import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendez/utils/google_signin_provider.dart';
import 'package:rendez/components/primary_button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: PrimaryButton(
            text: 'SignIn',
          ),
        ),
        SizedBox(height: 20),
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
    );
  }
}
