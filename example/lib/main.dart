import 'package:auth0_spa/auth0_spa.dart';
import 'package:example/src/app.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

void main() async {

  final client = await Auth0.create(const Auth0ClientOptions(
    domain: "", // Your domain
    clientId: "", // Your client id
    redirectUri: "http://[::1]:3000/#/",
    audience: "", // Your audience
  ));

  final uri = Uri.parse(html.window.location.toString().replaceAll("#/", ""));
  final path = uri.path;
  final state = uri.queryParameters["state"];
  final code = uri.queryParameters["code"];

  if (path == "/" && (state?.isNotEmpty ?? false) && (code?.isNotEmpty ?? false)) {
    final result = await client.handleRedirectCallbackWithQuery("?${uri.query}", appStateKeys: ["redirectUri"]);
    print("Result: $result");
  }

  runApp(ExampleApp(client: client));
}


