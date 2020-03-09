import 'package:auth0_spa/src/definitions/base_login_options.dart';
import 'package:auth0_spa/src/definitions/login_display_type.dart';
import 'package:auth0_spa/src/definitions/login_prompt_type.dart';
import 'package:flutter/foundation.dart';

class Auth0ClientOptions extends BaseLoginOptions {
  final Duration authorizeTimeout;
  final String clientId;
  final String domain;
  final String issuer;
  final Duration leeway;
  final String redirectUri;

  const Auth0ClientOptions({
    this.authorizeTimeout,
    @required this.clientId,
    @required this.domain,
    this.issuer,
    this.leeway,
    this.redirectUri,
    String acrValues,
    String audience,
    String connection,
    LoginDisplayType displayType,
    String idTokenHint,
    String loginHint,
    Duration maxAge,
    LoginPromptType promptType,
    String scope,
    String uiLocales,
  }) : super(
          acrValues: acrValues,
          audience: audience,
          connection: connection,
          displayType: displayType,
          idTokenHint: idTokenHint,
          loginHint: loginHint,
          maxAge: maxAge,
          promptType: promptType,
          scope: scope,
          uiLocales: uiLocales,
        );

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = super.toMap();
    map["authorizeTimeoutInSeconds"] = this.authorizeTimeout?.inSeconds;
    map["client_id"] = this.clientId;
    map["domain"] = this.domain;
    map["issuer"] = this.issuer;
    map["leeway"] = this.leeway?.inSeconds;
    map["redirect_uri"] = this.redirectUri;
    return map;
  }
}
