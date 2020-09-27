import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
FirebaseAuth auth = FirebaseAuth.instance;
GoogleSignIn googleSignIn = new GoogleSignIn();
Future<User> signInWithUser() async{
  await Firebase.initializeApp();
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken,accessToken: googleSignInAuthentication.accessToken);
  User user = (await auth.signInWithCredential(credential)).user;

  return user;
}