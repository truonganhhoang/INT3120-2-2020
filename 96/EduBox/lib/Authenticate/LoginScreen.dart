import 'package:EduBox/Authenticate/MyAnimatedIcon.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    _auth.signInWithCredential(credential).then((authResult) {
      final User user = authResult.user;
      if (user != null) {
        final User currentUser = _auth.currentUser;
        assert(user.uid == currentUser.uid);

        FirebaseFirestore.instance
            .collection('User')
            .doc(user.uid)
            .get()
            .then((value) {
          if (!value.exists) {
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
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: googleSignIn.onCurrentUserChanged,
          builder: (context, snapshot) {
            if (snapshot.hasError)
              return Scaffold(
                body: Center(
                  child: Text(
                    'Error',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            if (snapshot.hasData)
              return Scaffold(
                body: Center(child: LinearProgressIndicator()),
              );
            else
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 2,
                      width: MediaQuery.of(context).size.width / 2,
                      child: MyAnimatedIcon(),
                    ),
                    GestureDetector(
                      onTap: signInWithGoogle,
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 5 * 4,
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
                  ],
                ),
              );
          },
        ),
      ),
    );
  }
}
