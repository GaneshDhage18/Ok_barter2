import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:okbarter2/core/errors/exceptions.dart';
import 'package:okbarter2/core/globals/globals.dart';
import 'package:okbarter2/core/routes/router.dart';
import 'package:okbarter2/core/services/device_info_service.dart';
import 'package:okbarter2/core/services/local_db.dart';
import 'package:okbarter2/core/services/tokens.dart';
import 'package:okbarter2/features/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

enum AuthenticationStatus { loggedIn, loggedOut, unknown }

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthenticationStatus status = AuthenticationStatus.unknown;

  static const int _timerDuration = 30;
  Timer? _timer;
  final AuthRepository repository = AuthRepository();

  AuthBloc() : super(const PasswordVisibilytyState(obsecure: true)) {
    on<TogglePasswordVisibiltyEvent>(_toggleVisibility);
    on<StartOtpTimer>(_onStartTimer);
    on<TickOtpTimer>(_onTick);
    on<CompleteOtpTimer>(_onCompleteTimer);
    on<ResendOtpEvent>(_onResendOtp);
    on<SendOtpEvent>(_sendOtpEvent);
    on<VerifyOtpEvent>(_onVerifyOtp);
    on<ChangeAuthStatus>(_changeAuthStatus);
    on<HandleAppOpen>(_handleAppOpen);
  }

  FutureOr<void> _changeAuthStatus(event, emit) {
    status = event.status;
    emit(AuthStateUpdated(status: status));
  }

  /// ================= PASSWORD VISIBILITY =================
  void _toggleVisibility(
    TogglePasswordVisibiltyEvent event,
    Emitter<AuthState> emit,
  ) {
    final current = state;
    if (current is PasswordVisibilytyState) {
      emit(PasswordVisibilytyState(obsecure: !current.obsecure));
    }
  }

  /// ================= START OTP TIMER =================
  void _onStartTimer(StartOtpTimer event, Emitter<AuthState> emit) {
    _timer?.cancel();

    int secondsLeft = _timerDuration;
    emit(OtpTimerRunning(secondsLeft));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      secondsLeft--;

      if (secondsLeft > 0) {
        add(TickOtpTimer(secondsLeft));
      } else {
        timer.cancel();
        add(const CompleteOtpTimer());
      }
    });
  }

  /// ================= TIMER TICK =================
  void _onTick(TickOtpTimer event, Emitter<AuthState> emit) {
    emit(OtpTimerRunning(event.secondsLeft));
  }

  /// ================= TIMER COMPLETED =================
  void _onCompleteTimer(CompleteOtpTimer event, Emitter<AuthState> emit) {
    emit(OtpTimerCompleted());
  }

  /// ================= RESEND OTP =================
  void _onResendOtp(ResendOtpEvent event, Emitter<AuthState> emit) async {
    // TODO: Call resend OTP API
    await Future.delayed(const Duration(seconds: 1));

    emit(OtpResentSuccess());
    add(const StartOtpTimer());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  ///=============================================   SEND OTP BLOC ============================================///
  _sendOtpEvent(SendOtpEvent event, emit) async {
    emit(SendOtpEventLoadingState());
    try {
      await repository.sendOtp(event.mobileNumber);
      emit(SendOtpEventSuccessState());
    } on NoInternetException catch (e) {
      emit(NoInternetState());
    } on ApiException catch (e) {
      emit(SendOtpEventErrorState(error: e.message.toString()));
    } catch (e) {
      emit(SendOtpEventErrorState(error: e.toString()));
    }
  }

  ///=============================================   SEND OTP BLOC ============================================///

  ///=============================================   VERIFY OTP BLOC ============================================///

  _onVerifyOtp(VerifyOtpEvent event, Emitter emit) async {
    emit(VerifyOtpLoadingState());
    try {
      final deviceId = await DeviceInfoService.getDeviceId();
      final deviceType = DeviceInfoService.getDeviceType();

      await repository.verifyOtp(
        number: event.number,
        otp: event.otp,
        deviceId: deviceId,
        deviceType: deviceType,
      );
      emit(ChangeAuthStatus(status: AuthenticationStatus.loggedIn));
      emit(VerifyOtpSuccessState());
    } on NoInternetException catch (e) {
      emit(ChangeAuthStatus(status: AuthenticationStatus.loggedOut));
      emit(NoInternetState());
    } on ApiException catch (e) {
      emit(ChangeAuthStatus(status: AuthenticationStatus.loggedOut));
      emit(VerifyOtpErrorState(error: e.message.toString()));
    } catch (e) {
      emit(ChangeAuthStatus(status: AuthenticationStatus.loggedOut));
      emit(VerifyOtpErrorState(error: e.toString()));
    }
  }

  ///=============================================   VERIFY OTP BLOC ============================================///
  ///
  _handleAppOpen(event, emit) async {
    try {
      final refreshToken = await Tokens.refreshToken;

      if (refreshToken != null) {
        await repository.refreshToken();
        add(ChangeAuthStatus(status: AuthenticationStatus.loggedIn));
        emit(NavigateToHomeState());
        return;
      }

      add(ChangeAuthStatus(status: AuthenticationStatus.loggedOut));

      final isUserComesFirstTime = await checkUserComesFirstTime();

      if (isUserComesFirstTime) {
        emit(NavigateToOnboardingState());
      } else {
        emit(NavigateToSignInState());
      }
    } catch (e) {
      emit(NavigateToSignInState());
    }
  }

  checkUserComesFirstTime() async {
    final firstTime = LocalDb().userBox.get("firstTime");
    if (firstTime == null) {
      LocalDb().userBox.put("firstTime", false);
      return true;
    }

    return firstTime;
  }
}
