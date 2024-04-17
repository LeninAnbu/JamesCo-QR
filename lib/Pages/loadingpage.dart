// ignore_for_file: must_call_super, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/Pages/HomePage.dart';
import 'package:flutter_application_1/controller/QRcontroller.dart';
import 'package:provider/provider.dart';

import '../constants/Screen.dart';

class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  @override
  void initState() {
    setState(() {
      Future.delayed(Duration(seconds: 3), () {
         Navigator.of(context)
                                                            .pushAndRemoveUntil(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            MyHomePage()),
                                                                (route) =>
                                                                    false);
      });
      //  context.read<QRCon>().delay();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: Screens.padingHeight(context)*0.20,
              // color: Colors.blue,
              child: Image.asset(
                "assets/Jco-Logo1.jpg",
                fit: BoxFit.cover,
                height: 80,
              ),

              // width: Screens.width(context)*0.20,
            ),
          ),
          SizedBox(
            height: Screens.bodyheight(context) * 0.02,
          ),
          Center(
            child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Screens.width(context) * 0.35),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.white,
                )),
          )
        ],
      ),
    );
    //   ),
    // );
  }
}
