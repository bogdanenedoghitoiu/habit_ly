import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository {
  final GoogleSignIn _googleSignIn;

  const FirebaseAuthRepository(this._googleSignIn);

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<User?> googleSignIn() async {
    final googleAccount = await _googleSignIn.signIn();
    final googleAuthentication = await googleAccount?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuthentication?.accessToken,
      idToken: googleAuthentication?.idToken,
    );

    final userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<User?> signIn(final String emailAddress, final String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: emailAddress, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        print('The user does not exist.');
      } else if (exception.code == 'wrong-password') {
        print('Wrong password.');
      }
    }
  }

  Future<User?> signUp(final String emailAddress, final String password) async {
    try {
      print('attempting sign up with email: $emailAddress and pwd: $password');

      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailAddress, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (exception.code == 'email-already-in-use') {
        print('An account already exists for the provided email.');
      }
    }
  }

  Future<void> _verifyUserEmail() async {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      final actionCodeSettings = ActionCodeSettings(
        url: 'https://www.example.com/?email=${user.email}',
        dynamicLinkDomain: 'example.page.link',
        androidPackageName: 'cerulean.tech.habit_ly',
        androidInstallApp: true,
        iOSBundleId: 'cerulean.tech.ios',
        handleCodeInApp: true,
      );

      await user.sendEmailVerification(actionCodeSettings);
    }
  }
}
