
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:miabesante/firebase_options.dart';
import 'package:miabesante/screens/welcome_screen.dart';

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp( MyApp());

}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home :WelcomeScreen(),
    );
  }
}