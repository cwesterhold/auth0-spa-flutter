import 'package:auth0_spa/src/client/auth0_client.dart';
import 'package:auth0_spa/src/definitions/get_id_token_claims_options.dart';
import 'package:auth0_spa/src/definitions/get_token_silently_options.dart';
import 'package:auth0_spa/src/definitions/get_token_with_popup_options.dart';
import 'package:auth0_spa/src/definitions/get_user_options.dart';
import 'package:auth0_spa/src/definitions/id_token.dart';
import 'package:auth0_spa/src/definitions/logout_options.dart';
import 'package:auth0_spa/src/definitions/popup_login_options.dart';
import 'package:auth0_spa/src/definitions/redirect_login_options.dart';
import 'package:auth0_spa/src/definitions/redirect_login_result.dart';
import 'package:auth0_spa/src/js/utility/js_object_bridge.dart';

import 'utility/js_object_bridge.dart';

class Auth0ClientJs extends Auth0Client {
  final JsObjectBridge _jsAuth0Client;

  Auth0ClientJs(this._jsAuth0Client) : assert(_jsAuth0Client != null);

  @override
  Future<bool> isAuthenticated() => _jsAuth0Client.invokeAsyncMethod("isAuthenticated");

  @override
  void loginWithRedirect([RedirectLoginOptions options]) {
    this._jsAuth0Client.invokeAsyncMethod<void>("loginWithRedirect", <dynamic>[options?.toJsObject()]);
  }

  @override
  Future<void> loginWithPopup([PopupLoginOptions options]) {
    return this._jsAuth0Client.invokeAsyncMethod<void>("loginWithPopup", <dynamic>[options?.toJsObject()]);
  }

  @override
  Future<Map<String, String>> handleRedirectCallbackWithQuery(String searchQuery, {List<String> appStateKeys = const []}) async {
    if (searchQuery.startsWith("/")) {
      searchQuery = searchQuery.substring(1);
    }
    final result = await this._jsAuth0Client.invokeAsyncMethod<JsObjectBridge>("handleRedirectCallback", <dynamic>[searchQuery]);
    final appState = result.get<JsObjectBridge>("appState");
    var convertedAppState = <String, String>{};
    for (String key in appStateKeys) {
      convertedAppState[key] = appState.get(key);
    }
    return convertedAppState;
  }

  @override
  Future<dynamic> getUser([GetUserOptions options]) {
    return this._jsAuth0Client.invokeAsyncMethod<dynamic>("getUser", <dynamic>[options?.toJsObject()]);
  }

  @override
  Future<String> getTokenSilently([GetTokenSilentlyOptions options]) {
    return this._jsAuth0Client.invokeAsyncMethod<String>("getTokenSilently", <dynamic>[options?.toJsObject()]);
  }

  @override
  Future<IdToken> getIdTokenClaims([GetIdTokenClaimsOptions options]) async {
    JsObjectBridge userTokenJs = await this._jsAuth0Client.invokeAsyncMethod("getIdTokenClaims", <dynamic>[options?.toJsObject()]);
    return IdToken(
      rawJwt: userTokenJs.get("__raw"),
      email: userTokenJs.get("email"),
      isEmailVerified: userTokenJs.get("email_verified"),
      avatarUrl: userTokenJs.get("picture"),
      issuedAt: userTokenJs.get("iat"),
      expiresAt: userTokenJs.get("exp"),
    );
  }

  @override
  Future<String> getTokenWithPopup([GetTokenWithPopupOptions options]) {
    return this._jsAuth0Client.invokeAsyncMethod("getTokenWithPopup", <dynamic>[options?.toJsObject()]);
  }

  @override
  void logout([LogoutOptions options]) {
    this._jsAuth0Client.invokeMethod<void>("logout", <dynamic>[options?.toJsObject()]);
  }
}
