import 'package:firebase_app/servies/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthBase authBase = AuthBase();
    return Scaffold(
      appBar: AppBar(
        title: Text('HELLO '),
        actions: [
          MaterialButton(
            onPressed: () {
              authBase.logout();
              Navigator.pushReplacementNamed(context, 'Login');
            },
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Text(
          'Wellcome......',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
