import 'package:js/js_util.dart';

import 'console.dart';

class JsObjectBridge {

  final dynamic _jsObject;

  JsObjectBridge(this._jsObject);

  T get<T>(String property) {
    dynamic value = getProperty(this._jsObject, property);
    return cast<T>(value, "Type mismatch: attempted to cast property '$property' to $T, actual type is ${value.runtimeType}");
  }

  T invokeMethod<T>(String methodName, [List<dynamic> args = const <dynamic>[]]) {
    dynamic invocationResult = callMethod(_jsObject, methodName, args.where((dynamic element) => element != null).toList());
    return cast<T>(invocationResult, "Type mismatch: attempted to invoke method '$methodName' and cast result to $T, actual type is ${invocationResult.runtimeType}");
  }

  Future<T> invokeAsyncMethod<T>(String methodName, [List<dynamic> args = const <dynamic>[]]) async {
    dynamic invocationResult = await promiseToFuture<dynamic>(callMethod(_jsObject, methodName, args.where((dynamic element) => element != null).toList()));
    return cast<T>(invocationResult, "Type mismatch: attempted to invoke method '$methodName' and cast result to $T, actual type is ${invocationResult.runtimeType}");
  }
  
  T cast<T>(dynamic value, String errorMessage) {
    if (T == dynamic) {
      return value;
    } else if (T == JsObjectBridge) {
      return JsObjectBridge(value) as T;
    } else if (value is T) {
      return value;
    } else {
      throw StateError(errorMessage);
    }
  }

  void log() {
    BrowserConsole.log(this._jsObject);
  }
}