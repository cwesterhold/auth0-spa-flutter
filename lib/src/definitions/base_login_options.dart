import 'package:auth0_spa/src/definitions/auth0_definition.dart';
import 'package:auth0_spa/src/definitions/login_display_type.dart';
import 'package:auth0_spa/src/definitions/login_prompt_type.dart';

abstract class BaseLoginOptions extends Auth0Definition {
  final String acrValues;
  final String audience;
  final String connection;
  final LoginDisplayType displayType;
  final String idTokenHint;
  final String loginHint;
  final Duration maxAge;
  final LoginPromptType promptType;
  final String scope;
  final String uiLocales;

  const BaseLoginOptions({
    this.acrValues,
    this.audience,
    this.connection,
    this.displayType,
    this.idTokenHint,
    this.loginHint,
    this.maxAge,
    this.promptType,
    this.scope,
    this.uiLocales,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        "acr_values": this.acrValues,
        "audience": this.audience,
        "connection": this.connection,
        "display": _displayTypeToString(this.displayType),
        "id_token_hint": this.idTokenHint,
        "login_hint": this.loginHint,
        "max_age": this.maxAge?.inSeconds,
        "prompt": _promptTypeToString(promptType),
        "scope": this.scope,
        "ui_locales": this.uiLocales,
      };
}

String _promptTypeToString(LoginPromptType type) {
  if (type == null) {
    return null;
  }

  switch (type) {
    case LoginPromptType.none:
      return "none";
    case LoginPromptType.login:
      return "login";
    case LoginPromptType.consent:
      return "consent";
    case LoginPromptType.selectAccount:
      return "select_account";
  }

  throw ArgumentError("Unknown LoginPromptType: $type");
}

String _displayTypeToString(LoginDisplayType type) {
  if (type == null) {
    return null;
  }

  switch (type) {
    case LoginDisplayType.page:
      return "page";
    case LoginDisplayType.popup:
      return "popup";
    case LoginDisplayType.touch:
      return "touch";
    case LoginDisplayType.wap:
      return "wap";
  }

  throw ArgumentError("Unknown LoginDisplayType: $type");
}
