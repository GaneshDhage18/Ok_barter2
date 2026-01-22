import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:okbarter2/core/errors/exceptions.dart';
import 'package:okbarter2/features/auth/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
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
}
