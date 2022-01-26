import 'package:flutter/material.dart';
import 'package:flutter_sn/services/auth_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auth Service'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                var response = authService.registerWithEmailAndPassword(
                    'sambndongo@gmail.com', 'passer123');
                print(response);
              },
              child: Text('Sign Up'),
            ),
            ElevatedButton(
              onPressed: () {
                var response = authService.signInAnon();
              },
              child: Text('Sign in anonymously'),
            ),
            ElevatedButton(
              onPressed: () {
                var response = authService.signInWithEmailAndPassword(
                    'sambndongo@gmail.com', 'passer123');

                print(response);
              },
              child: Text('Sign in with email and password'),
            ),
          ],
        ),
      ),
    );
  }
}
