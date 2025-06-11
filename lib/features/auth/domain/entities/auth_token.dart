class AuthToken {
  final String accessToken;
  final String refreshToken;
  final DateTime expiresAt;

  const AuthToken({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresAt,
  });

  bool get isExpired => DateTime.now().isAfter(expiresAt);

  AuthToken copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? expiresAt,
  }) {
    return AuthToken(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AuthToken &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.expiresAt == expiresAt;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^ refreshToken.hashCode ^ expiresAt.hashCode;
  }

  @override
  String toString() {
    return 'AuthToken(accessToken: ${accessToken.substring(0, 10)}..., refreshToken: ${refreshToken.substring(0, 10)}..., expiresAt: $expiresAt)';
  }
}