import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthProviderService {
  static signInWithGoogle() async {
    // begin interactive sign in process
    const clientId = String.fromEnvironment('GOOGLE_CLIENT_ID');

    final GoogleSignInAccount? gUser =
        await GoogleSignIn(clientId: clientId).signIn();

  
    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    // finally, let's sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
