import 'package:auth0_spa/src/definitions/auth0_definition.dart';

class GetTokenSilentlyOptions extends Auth0Definition {
  final String audience;
  final bool ignoreCache;
  final String redirectUri;
  final String scope;
  final Duration timeout;

  const GetTokenSilentlyOptions({
    this.audience,
    this.ignoreCache,
    this.redirectUri,
    this.scope,
    this.timeout,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        "audience": this.audience,
        "ignoreCache": this.ignoreCache,
        "redirect_uri": this.redirectUri,
        "scope": this.scope,
        "timeoutInSecond": this.timeout?.inSeconds,
      };
}
