import 'package:flutter/material.dart';
import 'package:mood_matic/presentation/screens/auth/login.dart';
import 'package:mood_matic/presentation/screens/home/home.dart';
import 'package:mood_matic/services/auth.dart';

import '../../../widgets/button.dart';
import '../../../widgets/textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              'Moodmatic',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
            )),
            const SizedBox(
              height: 11,
            ),
            TextInput(
              hintText: 'username',
              controller: username,
            ),
            const SizedBox(
              height: 11,
            ),
            TextInput(
              hintText: 'email',
              controller: email,
            ),
            const SizedBox(
              height: 11,
            ),
            TextInput(
              hintText: 'password',
              controller: password,
            ),
            const SizedBox(
              height: 11,
            ),
            Button(
              title: "sign up",
              onPressed: () async {
                var res = await Auth()
                    .signup(username.text, email.text, password.text);
                if (res['success'] == true) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                }
              },
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              isLoading: false,
            ),
            const SizedBox(
              height: 11,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ));
                    },
                    child: const Text(
                      'log in',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
