import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rendez/components/login_widget.dart';
import 'package:rendez/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          final user = FirebaseAuth.instance.currentUser!;
          return HomeScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: Column(children: const [Text('Something went wrong')]),
          );
        } else {
          return const Login();
        }
      },
    );
  }
}
