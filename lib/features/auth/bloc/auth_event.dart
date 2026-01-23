part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// ================= PASSWORD =================

class TogglePasswordVisibiltyEvent extends AuthEvent {
  const TogglePasswordVisibiltyEvent();
}

/// ================= OTP TIMER =================

class StartOtpTimer extends AuthEvent {
  const StartOtpTimer();
}

class TickOtpTimer extends AuthEvent {
  final int secondsLeft;

  const TickOtpTimer(this.secondsLeft);

  @override
  List<Object?> get props => [secondsLeft];
}

/// 🔥 REQUIRED to finish timer correctly
class CompleteOtpTimer extends AuthEvent {
  const CompleteOtpTimer();
}

/// ================= OTP ACTION =================

class ResendOtpEvent extends AuthEvent {
  const ResendOtpEvent();
}

///=============================================   SEND OTP EVENT ============================================///
class SendOtpEvent extends AuthEvent {
  final String mobileNumber;

  const SendOtpEvent({required this.mobileNumber});

  @override
  List<Object?> get props => [mobileNumber];
}

///=============================================   SEND OTP EVENT ============================================///

///=============================================   VERIFY OTP EVENT ============================================///
class VerifyOtpEvent extends AuthEvent {
  final String number;
  final String otp;
  final String? deviceId;
  final String? deviceType;

  const VerifyOtpEvent({
    required this.number,
    required this.otp,
    this.deviceId,
    this.deviceType,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [number, otp, deviceId, deviceType];
}

///=============================================   VERIFY OTP EVENT ============================================///

class ChangeAuthStatus extends AuthEvent {
  final AuthenticationStatus status;

  const ChangeAuthStatus({required this.status});

  @override
  List<Object?> get props => [status];
}

class HandleAppOpen extends AuthEvent {}
