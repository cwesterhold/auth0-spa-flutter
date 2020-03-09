@JS()
library auth0_js;

import 'package:auth0_spa/src/definitions/auth0_client_options.dart';
import 'package:auth0_spa/src/js/utility/js_object_bridge.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS("createAuth0Client")
external dynamic _createAuth0Client(dynamic options);

//const defaultOptions = Auth0ClientOptions(domain: "huehuehue", client_id: "heuehuehue");

///
/// The method bridges Auth0 JS SDK's createAuth0Client method, mapping and renaming
/// some of the arguments for consistency and convenience for Dart usage.
///
Future<JsObjectBridge> createAuth0Client(Auth0ClientOptions options) async {
  return JsObjectBridge(await promiseToFuture<dynamic>(_createAuth0Client(options.toJsObject())));
}

///
/// Auth0ClientOptions js object bridge
/// https://auth0.github.io/auth0-spa-js/interfaces/auth0clientoptions.html
///
//@JS()
//@anonymous
//class Auth0ClientOptions {
//  external String get acr_values;
//
//  external String get audience;
//
//  external num get authorizeTimeoutInSeconds;
//
//  external String get client_id;
//
//  external String get connection;
//
//  external String get display;
//
//  external String get domain;
//
//  external String get id_token_hint;
//
//  external String get issuer;
//
//  external num get leeway;
//
//  external String get login_hint;
//
//  external num get max_age;
//
//  external String get prompt;
//
//  external String get redirect_uri;
//
//  external String get scope;
//
//  external String get ui_locales;
//
//  external const factory Auth0ClientOptions({
//    String acr_values,
//    String audience,
//    num authorizeTimeoutInSeconds,
//    @required String client_id,
//    String connection,
//    String display,
//    @required String domain,
//    String id_token_hint,
//    String issuer,
//    num leeway,
//    String login_hint,
//    num max_age,
//    String prompt,
//    String redirect_uri,
//    String scope,
//    String ui_locales,
//  });
//}
//
//String _convertLoginDisplayType(LoginDisplayType displayType) {
//  if (displayType == null) {
//    return null;
//  }
//
//  switch (displayType) {
//    case LoginDisplayType.page:
//      return "page";
//    case LoginDisplayType.popup:
//      return "popup";
//    case LoginDisplayType.touch:
//      return "touch";
//    case LoginDisplayType.wap:
//      return "wap";
//  }
//
//  throw StateError("Unknown LoginDisplayType: ${displayType}");
//}
//
//String _convertLoginPromptType(LoginPromptType promptType) {
//  if (promptType == null) {
//    return null;
//  }
//
//  switch (promptType) {
//    case LoginPromptType.none:
//      return "none";
//    case LoginPromptType.login:
//      return "login";
//    case LoginPromptType.consent:
//      return "consent";
//    case LoginPromptType.selectAccount:
//      return "select_account";
//  }
//
//  throw StateError("Unknown LoginPromptType: ${promptType}");
//}
