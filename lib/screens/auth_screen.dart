import '../widgets/auth_form.dart';
import 'package:flutter/material.dart';

enum AuthType {
  login,
  register,
}

class AuthScreen extends StatelessWidget {
  
  final AuthType authType;
  AuthScreen({required this.authType});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Hello !',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image.asset('assets/images/logo.png'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Container(
                child: AuthForm(authType: authType,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
