
import 'package:c_work/screens/tasks_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c_work/constants.dart';

import '../components/rounded_button.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {

  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.app_registration, color: Colors.lightBlueAccent, size: 60,),
            SizedBox(height: 20,),

            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value){
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
            ),
            SizedBox(height: 20,),

            TextField(
              obscureText: true,

              textAlign: TextAlign.center,
              onChanged: (value){
                password = value;
              },
              decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
            ),
            //SizedBox(height: 20,),

            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Register',
              onPressed: () async{
                try{
                  _auth.fetchSignInMethodsForEmail(email);
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                  if(newUser.user != null){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TasksScreen(),
                      ),
                    );
                  }
                }
                catch(e){
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
