String maskEmail(String email) {
  if (!email.contains('@')) return email;

  final parts = email.split('@');
  final username = parts[0];
  final domain = parts[1];

  if (username.length <= 3) {
    return '${username[0]}***@******';
  }

  final firstChar = username[0];
  final lastTwoChars = username.substring(username.length - 2);

  final maskedMiddle = '*' * (username.length - 3);

  return '$firstChar$maskedMiddle$lastTwoChars@******';
}
