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

class SendOtpEvent extends AuthEvent {
  final String mobileNumber;

  const SendOtpEvent({required this.mobileNumber});

  @override
  List<Object?> get props => [mobileNumber];
}
