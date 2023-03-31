import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lessons/auth/landing.dart';
import 'package:flutter_lessons/auth/service.dart';
import 'package:flutter_lessons/pages/iphone.dart';
import 'package:flutter_lessons/pages/iphone_grid.dart';
import 'package:provider/provider.dart';
import 'pages/auth.dart';
import 'pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices().currentUser,
      initialData: null,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const LandingPage(),
          '/home': (context) => const HomePage(),
          '/iphone': (context) => const IphonePage(),
          '/iphone-grid': (context) => const IphoneGridPage(),
          '/landing': (context) => const LandingPage(),
        },
      ),
    );
  }
}
