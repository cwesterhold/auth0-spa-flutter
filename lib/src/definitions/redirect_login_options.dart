import 'package:auth0_spa/src/definitions/base_login_options.dart';
import 'package:auth0_spa/src/definitions/login_display_type.dart';
import 'package:auth0_spa/src/definitions/login_prompt_type.dart';

class RedirectLoginOptions extends BaseLoginOptions {

  final dynamic appState;
  final String fragment;
  final String redirectUri;

  const RedirectLoginOptions({
    this.appState,
    this.fragment,
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
    map["appState"] = this.appState;
    map["fragment"] = this.fragment;
    map["redirect_uri"] = this.redirectUri;
    return map;
  }
}
