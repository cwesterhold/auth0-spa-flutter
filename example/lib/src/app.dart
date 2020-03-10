import 'package:auth0_spa/auth0_spa.dart';
import 'package:flutter/material.dart';

class ExampleApp extends StatelessWidget {

  final Auth0Client client;

  const ExampleApp({Key key, this.client}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<IdToken>(
        future: client.isAuthenticated().then((isAuthenticated) async {
          if (isAuthenticated) {
            return await client.getIdTokenClaims();
          } else {
            return null;
          }
        }),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final token = snapshot.data;
            if (token != null) {
              return UserPage(token: token);
            } else {
              return LoginPage(client: client);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class LoginPage extends StatelessWidget {

  final Auth0Client client;

  const LoginPage({Key key, @required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: FlatButton(
          color: Colors.redAccent,
          child: Text("Login"),
          onPressed: () { this.client.loginWithRedirect(RedirectLoginOptions(
            appState: {
              "redirectUri": "https://google.com",
            }
          )); },
        ),
      ),
    );
  }
}

class UserPage extends StatelessWidget {

  final IdToken token;

  const UserPage({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Email: ${token.email}"),
            Text("Token Expires at: ${DateTime.fromMicrosecondsSinceEpoch(token.expiresAt).toIso8601String()}")
          ],
        ),
      ),
    );
  }
}