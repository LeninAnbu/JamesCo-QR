// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:dart_amqp/dart_amqp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/QueueMpdel/datachecking.dart';
import 'package:flutter_application_1/QueueMpdel/model.dart';

import 'package:provider/provider.dart';
import 'package:dart_amqp/dart_amqp.dart' as am;
import 'Pages/HomePage.dart';
import 'Pages/loadingpage.dart';
import 'Pages/secondpage.dart';
import 'constants/AppConstant.dart';
import 'constants/Screen.dart';
import 'constants/SharedPreference.dart';
import 'constants/UserValues.dart';
import 'controller/QRcontroller.dart';

void main() {
  runApp(const MyApp());
}

Future<String?> getBranch() async {
  String? branch = await SharedPref.getBranchSSP();
  return branch;
}

Future<String?> getTerminal() async {
  String? terminal = await SharedPref.getTerminal();
  return terminal;
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QRCon()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: loadingScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//    child:  SpinKitThreeBounce(
//                   size: 25,
//                   color: Colors.blue,
//                   duration: Duration(seconds: 5),
//                 ),
//     );
//   }
// }


