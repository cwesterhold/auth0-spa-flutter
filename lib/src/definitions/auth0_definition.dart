import 'package:js/js_util.dart';

abstract class Auth0Definition {

  const Auth0Definition();

  Map<String, dynamic> toMap();

  dynamic toJsObject() {
    Map<String, dynamic> map = this.toMap();
    final dynamic object = newObject();
    map.forEach((key, dynamic value) {
      if (value != null) {
        setProperty(object, key, value);
      }
    });
    return object;
  }
}