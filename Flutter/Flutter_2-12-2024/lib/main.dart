import 'package:flutter/material.dart';
import 'BottomNavigationBar.dart';
import 'examples.dart';
import 'HomeScreen.dart';
import 'Login.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examples',
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

