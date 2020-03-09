import 'package:auth0_spa/src/definitions/base_login_options.dart';
import 'package:auth0_spa/src/definitions/login_display_type.dart';
import 'package:auth0_spa/src/definitions/login_prompt_type.dart';

class GetTokenWithPopupOptions extends BaseLoginOptions {

  const GetTokenWithPopupOptions({
    String acrValues,
    String audience,
    String connection,
    LoginDisplayType displayType,
    String idTokenHint,
    String loginHint,
    Duration maxAge,
    LoginPromptType promptType,
    String scope,
    String uiLocales,
  }) : super(
          acrValues: acrValues,
          audience: audience,
          connection: connection,
          displayType: displayType,
          idTokenHint: idTokenHint,
          loginHint: loginHint,
          maxAge: maxAge,
          promptType: promptType,
          scope: scope,
          uiLocales: uiLocales,
        );
}
