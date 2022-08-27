import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendez/components/primary_button.dart';
import 'package:rendez/screens/test.dart';
import 'package:rendez/utils/google_signin_provider.dart';
import 'calendar.dart';
import 'form.dart';
import 'notifications.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference test = firestore.collection('test');
    CollectionReference appointments = firestore.collection('appointments');
    final user = FirebaseAuth.instance.currentUser!;
    final tabs = [
      Calendar(
        collectionReference: appointments,
      ),
      FormEdit(),
      Notifications(),
      Test(
        user: user,
        collectionReference: test,
      ),
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        iconSize: 35,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black38,
        backgroundColor: Color(0xFF717171),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.link), label: 'Form'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'Test'),
        ],
      ),
    );
  }
}
