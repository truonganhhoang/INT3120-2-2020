import 'package:EduBox/package/widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeInterface()));
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
                  child: Image.asset('lib/assests/google.png'),
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
