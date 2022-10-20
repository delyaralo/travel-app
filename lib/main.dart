import 'dart:core';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/hotels_ui.dart';
import 'package:travel_app/screens/splash_screen.dart';
import 'package:travel_app/screens/tour_ui.dart';
import 'theme/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> _firebaseMessagingBackgroundHandler(message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context,child)=>
      ResponsiveWrapper.builder(
        child,maxWidth: 1200,minWidth: 480,
      defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(
          600,name: MOBILE,),
          ResponsiveBreakpoint.resize(
          800,name: TABLET,),
          ResponsiveBreakpoint.resize(
          1000,name: DESKTOP,),
        ],
        background:
          Container(color: Color(0xFFF5F35F5),),),
      initialRoute: '/',
      routes: {
        // '/second': (context)=> Tour_Ui(indexcountrytourui: ,)
      },
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: primary,
      ),
      home: Splash(),
    );
  }
}


