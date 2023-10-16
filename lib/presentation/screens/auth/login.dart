import 'package:flutter/material.dart';
import 'package:mood_matic/presentation/screens/auth/signup.dart';
import 'package:mood_matic/services/auth.dart';
import 'package:mood_matic/widgets/button.dart';
import 'package:mood_matic/widgets/textfield.dart';

import '../home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Moodmatic',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
          )),
          SizedBox(
            height: 11,
          ),
          TextInput(
            hintText: 'email',
            controller: email,
          ),
          SizedBox(
            height: 11,
          ),
          TextInput(
            hintText: 'password',
            controller: password,
          ),
          SizedBox(
            height: 11,
          ),
          Button(
            title: "login",
            onPressed: () async {
              var res = await Auth().login(email.text, password.text);
              if (res['success'] == true) {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              }
            },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            isLoading: false,
          ),
          SizedBox(
            height: 11,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ));
                  },
                  child: Text(
                    'sign up',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
