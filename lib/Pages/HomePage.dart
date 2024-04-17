import 'dart:convert';
import 'dart:developer';

import 'package:dart_amqp/dart_amqp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/mobScr2.dart';
import 'package:flutter_application_1/Pages/secondpage.dart';
import 'package:provider/provider.dart';

import 'package:dart_amqp/dart_amqp.dart' as am;
import '../QueueMpdel/datachecking.dart';
import '../QueueMpdel/model.dart';
import '../constants/Screen.dart';
import '../controller/QRcontroller.dart';
import '../main.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        context.read<QRCon>().init();

        // context.read<QRCon>().reievervb(context);

        if (context.read<QRCon>().mycontroller[4].text.isEmpty) {
          context.read<QRCon>().isterminal == false;
        } else {
          context.read<QRCon>().isterminal == true;
        }
        // context.read<QRCon>().reievervb();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 800) {
        // return
        // ChangeNotifierProvider<QRCon>(
        //     create: (context) => QRCon(),
        //     builder: (context, child) {
        //       return Consumer<QRCon>(
        //           builder: (BuildContext context, stkCtrl, Widget? child) {
        return WillPopScope(

          onWillPop:()async{
          
return await context.read<QRCon>(). onWillPop(context);
// finish();
          } ,
          child: Scaffold(
            backgroundColor: Colors.blue,
            // appBar: appbarMS("Customer ", theme, context),
            // drawer: naviDrawerMob(context),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    // height: Screens.padingHeight(context)*0.9,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(
                        left: Screens.width(context) * 0.03,
                        top: Screens.bodyheight(context) * 0.1,
                        // bottom: Screens.bodyheight(context) * 0.03,
                        right: Screens.width(context) * 0.03),
                    child: Center(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MobQRpage(),
                          // MobCustomerScreens(
                          //   stkCtrl: stkCtrl,
              
                          //   // scaffoldKey: scaffoldKey,
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
        //   });
        // });
      } else {
        //300
        return
            // ChangeNotifierProvider<CustomerController>(
            //     create: (context) => CustomerController(),
            //     builder: (context, child) {
            //       return Consumer<CustomerController>(
            //           builder: (BuildContext context, stkCtrl, Widget? child) {
            //         return
            WillPopScope(
              onWillPop:()async{
          
return  context.read<QRCon>(). onWillPop(context);
// finish();
          } ,
              child: Scaffold(
                  backgroundColor: Colors.grey[300],
                  resizeToAvoidBottomInset: false,
                  // drawer: naviDrawer(context),
                  // appBar: appbar("Customer ", theme, context,),
                  body: SafeArea(
                    child: secondQRpage(),
                  )),
            );
        //   });
        // });
      }
   
    });
  
  }

}
