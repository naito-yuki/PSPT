import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static AuthResult authResult;

  static Future<AuthResult> handleSignIn(String _email, String _password) async {
    try {
      AuthResult _result;
      _result = await auth.signInWithEmailAndPassword(
        email: _email,
        password: _password
      );
      return _result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<void> handleSignOut() async {
    try {
      await auth.signOut();
      authResult = null;
    } catch (e) {
      print(e);
    }
  }
}
