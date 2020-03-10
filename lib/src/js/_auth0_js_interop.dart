@JS()
library auth0_js;

import 'package:auth0_spa/src/definitions/auth0_client_options.dart';
import 'package:auth0_spa/src/js/utility/js_object_bridge.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

@JS("createAuth0Client")
external dynamic _createAuth0Client(dynamic options);

///
/// The method bridges Auth0 JS SDK's createAuth0Client method, mapping and renaming
/// some of the arguments for consistency and convenience for Dart usage.
///
Future<JsObjectBridge> createAuth0Client(Auth0ClientOptions options) async {
  return JsObjectBridge(await promiseToFuture<dynamic>(_createAuth0Client(options.toJsObject())));
}
