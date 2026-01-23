part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// ================= INITIAL =================

final class AuthInitial extends AuthState {}

/// ================= PASSWORD VISIBILITY =================

class PasswordVisibilytyState extends AuthState {
  final bool obsecure;

  const PasswordVisibilytyState({required this.obsecure});

  @override
  List<Object?> get props => [obsecure];
}

/// ================= OTP TIMER =================

class OtpTimerRunning extends AuthState {
  final int secondsLeft;

  const OtpTimerRunning(this.secondsLeft);

  @override
  List<Object?> get props => [secondsLeft];
}

class OtpTimerCompleted extends AuthState {}

/// ================= OTP RESEND =================

class OtpResentSuccess extends AuthState {}

class SendOtpEventStates extends AuthState {}

class SendOtpEventLoadingState extends SendOtpEventStates {}

class SendOtpEventSuccessState extends SendOtpEventStates {}

class SendOtpEventErrorState extends SendOtpEventStates {
  final String error;
  final DateTime _dateTime = DateTime.now();
  SendOtpEventErrorState({required this.error});
  @override
  List<Object> get props => [error, _dateTime];
}

class NoInternetState extends AuthState {}

///=============================================   VERIFY OTP STATES ============================================///

class VerifyOtpStates extends AuthState {}

class VerifyOtpLoadingState extends VerifyOtpStates {}

class VerifyOtpSuccessState extends VerifyOtpStates {}

class VerifyOtpErrorState extends VerifyOtpStates {
  final String error;
  final DateTime _dateTime = DateTime.now();
  VerifyOtpErrorState({required this.error});
  @override
  List<Object> get props => [error, _dateTime];
}

///=============================================   VERIFY OTP STATES ============================================///

class AuthStateUpdated extends AuthState {
  final AuthenticationStatus status;

  AuthStateUpdated({required this.status});

  @override
  List<Object?> get props => [status];
}

class NavigateToOnboardingState extends AuthState {}

class NavigateToSignInState extends AuthState {}

class NavigateToHomeState extends AuthState {}
