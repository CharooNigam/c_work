import 'package:c_work/components/rounded_button.dart';
import 'package:c_work/screens/registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                '🌊 Work',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  //decorationColor: Colors.blueAccent,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
            ),
            RoundedButton(
              colour: Colors.blueAccent,
              title: 'Register',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
