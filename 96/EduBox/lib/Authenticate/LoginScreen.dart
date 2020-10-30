import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {


  Future<String> signInWithGoogle() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      bool userExists = (await FirebaseFirestore.instance
          .collection('User')
          .doc(user.uid)
          .get()).exists;
      if (!userExists) {
        FirebaseFirestore.instance.collection('User').doc(user.uid).set({
          'Address': '',
          'Avatar': user.photoURL,
          'Birth': Timestamp.fromDate(DateTime(1960)),
          'Email': user.email,
          'Gender': '',
          'Name': user.displayName,
          'PhoneNumber': '',
        });
      } else {
        FirebaseFirestore.instance.collection('User').doc(user.uid).update({
          'Avatar': user.photoURL,
          'Email': user.email,
          'Name': user.displayName,
        });
      }
      return '';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    //final userDetail = Provider.of<UserDetail>(context);
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            signInWithGoogle();

          },
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  blurRadius: 15,
                  offset: Offset(4.5, 4.5),
                  color: Colors.black26,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        offset: Offset(4, 4),
                        color: Colors.black26,
                      ),
                    ],
                  ),
                  child: Image.asset('lib/assets/google.png'),
                  height: 45,
                  width: 45,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Đăng nhập với google',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
