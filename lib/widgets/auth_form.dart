import 'package:firebase_app/servies/auth.dart';

import '../screens/auth_screen.dart';
import 'package:flutter/material.dart';

import 'button_button.dart';

class AuthForm extends StatefulWidget {
  final AuthType authType;

  AuthForm({required this.authType});

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  AuthBase authBase = AuthBase();



  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          children: [
            TextFormField(
              controller: email,
              validator: (value) => value!.isEmpty ? ' Enter your Email' : null,
              decoration: InputDecoration(
                labelText: 'Enter your Email',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: password,
              validator: (value) =>
                  value!.length < 6 ? ' Enter password > 6 number' : null,
              decoration: InputDecoration(
                labelText: 'Enter your password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            ButtonButton(
              title: widget.authType == AuthType.login ? 'Login' : 'Register',
              textColor: Colors.white,
              bgColor: Colors.lightBlue,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if (widget.authType == AuthType.login) {
                    await authBase.loginWithEmailAndPassword(
                        email.text, password.text);
                    Navigator.pushReplacementNamed(context, 'home');
                  } else {
                    await authBase.registerWithEmailAndPassword(
                        email.text, password.text);
                    Navigator.pushReplacementNamed(context, 'home');
                  }
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                if (widget.authType == AuthType.login) {
                  Navigator.of(context).pushReplacementNamed('Register');
                } else {
                  Navigator.of(context).pushReplacementNamed('Login');
                }
              },
              child: Text(
                widget.authType == AuthType.login
                    ? 'Don\'t have an account ?'
                    : 'You have an account ?',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
