import 'package:flutter/foundation.dart';

class IdToken {
  final String rawJwt;
  final String email;
  final String avatarUrl;
  final bool isEmailVerified;
  final int issuedAt;
  final int expiresAt;

  const IdToken({
    @required this.rawJwt,
    this.email,
    this.avatarUrl,
    this.isEmailVerified,
    this.issuedAt,
    this.expiresAt,
  });
}
