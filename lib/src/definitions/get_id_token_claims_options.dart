import 'package:auth0_spa/src/definitions/auth0_definition.dart';

class GetIdTokenClaimsOptions extends Auth0Definition {
  final String audience;
  final String scope;

  const GetIdTokenClaimsOptions({
    this.audience,
    this.scope,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        "audience": this.audience,
        "scope": this.scope,
      };
}
