import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance of Auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
  // Sign up

  // Sign out

  // Logout
  Future<void> signout() async {
    await _auth.signOut();
  }
}
