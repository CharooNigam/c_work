import 'package:c_work/screens/tasks_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:c_work/constants.dart';
import 'package:provider/provider.dart';

import '../components/rounded_button.dart';
import '../models/task_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.login, color: Colors.lightBlueAccent, size: 60,),
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
            SizedBox(height: 20,),
            RoundedButton(
              colour: Colors.lightBlueAccent,
              title: 'Log In',
              onPressed: () async{
                try{
                  final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  if(user.user != null){
                    Provider.of<TaskData>(context, listen: false).fetchData(user.user);

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
