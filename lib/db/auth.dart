import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth{

    Future<User> googleSignIn ();

}

class Auth implements BaseAuth{

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<User> googleSignIn()async {
    final GoogleSignIn _googleSignIn= GoogleSignIn();
    final GoogleSignInAccount _googleSignInAccount=await _googleSignIn.signIn();
    final GoogleSignInAuthentication _googleAuth = await _googleSignInAccount.authentication;
    final AuthCredential credential= GoogleAuthProvider.credential(
      idToken: _googleAuth.idToken,
      accessToken: _googleAuth.accessToken,
    );

    try{
     User user = (await _auth.signInWithCredential(credential)).user;
     return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }









  }
}