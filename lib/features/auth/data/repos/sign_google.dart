import 'dart:async';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthInitializer {
  static final googleSignIn = GoogleSignIn.instance;

  static Future<void> init({
    required String clientId,
    required String serverClientId,
    required void Function(GoogleSignInAuthenticationEvent) onAuthEvent,
    required void Function(Object error) onAuthError,
  }) async {
    unawaited(
      googleSignIn
          .initialize(clientId: clientId, serverClientId: serverClientId)
          .then((_) {
            googleSignIn.authenticationEvents
                .listen(onAuthEvent)
                .onError(onAuthError);

            // Start silent sign-in attempt
            googleSignIn.attemptLightweightAuthentication();
          }),
    );
  }
}
