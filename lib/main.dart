import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myproject/AllScreens/loginScrean.dart';
import 'package:myproject/AllScreens/mainScreen.dart';
import 'package:myproject/AllScreens/resistration.dart';

import 'apiCall/pages/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static  String idScreen = "main";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // initialRoute: mainScreen.idScreen,
      initialRoute: "/home",
     // home: resistration(),
      routes: {
        resistration.idScreen:(context)=>resistration(),
        loginScreen.idScreen:(context)=>loginScreen(),
        mainScreen.idScreen:(context)=>mainScreen(),
        "/home":(context)=>Home()
      },
    );
  }
}
