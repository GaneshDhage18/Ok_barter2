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
