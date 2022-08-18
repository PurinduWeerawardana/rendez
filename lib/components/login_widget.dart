import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendez/utils/google_signin_provider.dart';
import 'package:rendez/components/primary_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'RENDEZ',
              style: TextStyle(fontFamily: 'Jost', fontSize: 48),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: PrimaryButton(
              text: 'SignIn',
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: PrimaryButton(
              text: 'LogIn',
              onPress: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
              },
            ),
          )
        ],
      ),
    );
  }
}
