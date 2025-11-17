import 'package:e_commerce/core/error/exception.dart' show Exceptions;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw Exceptions(message: "User creation failed, please try again.");
      }

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw Exceptions(message: "كلمة المرور ضعيفة");
        case 'email-already-in-use':
          throw Exceptions(message: "البريد الإلكتروني مستخدم بالفعل");
        case 'invalid-email':
          throw Exceptions(message: "البريد الإلكتروني غير صالح");
        default:
          throw Exceptions(
            message: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى',
          );
      }
    } catch (e) {
      throw Exceptions(message: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw Exceptions(message: "User creation failed, please try again.");
      }

      return user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw Exceptions(message: "كلمة المرور ضعيفة");
        case 'email-already-in-use':
          throw Exceptions(message: "البريد الإلكتروني مستخدم بالفعل");
        case 'invalid-email':
          throw Exceptions(message: "البريد الإلكتروني غير صالح");
        default:
          throw Exceptions(
            message: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى',
          );
      }
    } catch (e) {
      throw Exceptions(message: 'حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى');
    }
  }

  /*
  Future<User?> signInWithGoogle() async {
    try {
      // Step 1: Trigger Google Sign-In popup
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null; // user cancelled

      // Step 2: Obtain auth details
      final GoogleSignInAuthentication googleAuth =  googleUser.authentication;

      // Step 3: Create a Firebase credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Step 4: Sign in with Firebase
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      return userCredential.user; // <-- Firebase User
    } catch (e) {
      print("Google Sign-In Error: $e");
      return null;
    }
  } */

  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    return (await FirebaseAuth.instance.signInWithCredential(
      facebookAuthCredential,
    )).user!;
  }

  bool isSignIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
