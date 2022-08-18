import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendez/components/primary_button.dart';
import 'package:rendez/utils/google_signin_provider.dart';

class Test extends StatelessWidget {
  Test({required this.user, required this.collectionReference});
  User user;
  CollectionReference collectionReference;
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    @override
    void dispose() {
      textController.dispose();
      // super.dispose();
    }

    Future<void> sendToFirestore(String content) {
      return collectionReference
          .doc(user.uid)
          .set({
            'editor': user.email, // John Doe
            'content': content
          })
          .then((value) => print("Added"))
          .catchError((error) => print("Failed: $error"));
    }

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
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter something for your web',
              ),
            ),
          ),
          PrimaryButton(
            text: 'Submit',
            onPress: () {
              sendToFirestore(textController.text);
            },
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
