import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rendez/components/login_widget.dart';
import 'package:rendez/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final user = FirebaseAuth.instance.currentUser!;
            return HomeScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: Column(children: [Text('Something went wrong')]),
            );
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
