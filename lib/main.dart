import 'package:dojo_flutter_firebase/firebase_options.dart';
import 'package:dojo_flutter_firebase/home.dart';
import 'package:dojo_flutter_firebase/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dojo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      routes:{
        'Login': (_) => const Login(), //creo la ruta
        'home': (_) => const Home(),
      }
    );
  }
}
