import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:rendez/screens/home_screen.dart';
import 'package:rendez/screens/login_screen.dart';
import 'package:rendez/utils/google_signin_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Rendez());
}

class Rendez extends StatelessWidget {
  const Rendez({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Jost', primaryColor: Color(0xFF9E51DA)),
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          HomeScreen.id: (context) => HomeScreen()
        },
        initialRoute: LoginScreen.id,
      ),
    );
  }
}
