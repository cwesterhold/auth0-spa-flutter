import 'dart:html' as html;

class BrowserConsole {

  static void log(dynamic object) {
    html.window.console.log(object);
  }
}