import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tcc_girls_in_ctrl/api/firebase.api.dart';
import 'package:tcc_girls_in_ctrl/view/auth/option.auth.dart';
import 'package:tcc_girls_in_ctrl/view/splash.view.dart';
import 'package:tcc_girls_in_ctrl/view/themes/light.theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

  runApp(
    MaterialApp(
      title: "Hello",
      debugShowCheckedModeBanner: false,
      home: const Loading(),
      theme: lightTheme,
    ),
  );
}
