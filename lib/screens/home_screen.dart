import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendez/components/primary_button.dart';
import 'package:rendez/utils/google_signin_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = 'home_screen';

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(user.photoURL!),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Hello ' + user.displayName! + '!',
            style: TextStyle(fontSize: 36, fontFamily: 'Jost'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter something for your web',
              ),
            ),
          ),
          PrimaryButton(
            text: 'Submit',
            onPress: () {},
          ),
          SizedBox(
            height: 20,
          ),
          PrimaryButton(
            text: 'Logout',
            onPress: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
          ),
        ],
      ),
    );
  }
}
