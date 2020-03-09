import 'package:auth0_spa/src/definitions/auth0_definition.dart';

class LogoutOptions extends Auth0Definition {
  final String clientId;
  final bool federated;
  final String returnTo;

  const LogoutOptions({
    this.clientId,
    this.federated,
    this.returnTo,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        "client_id": this.clientId,
        "federated": this.federated,
        "returnTo": this.returnTo,
      };
}
