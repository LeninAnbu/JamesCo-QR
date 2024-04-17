// ignore_for_file: prefer_const_constructors, unused_import, must_call_super

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/SharedPreference.dart';
import 'package:flutter_application_1/controller/QRcontroller.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../QueueMpdel/model.dart';
import '../constants/AppConstant.dart';
import '../constants/Screen.dart';

class MobQRpage extends StatefulWidget {
  const MobQRpage({super.key});

  @override
  State<MobQRpage> createState() => MobQRpageState();
}

class MobQRpageState extends State<MobQRpage> {
  void initState() {
   
    // context.read<QRCon>().reievervb();
    log("ANBUUUUUU" + context.read<QRCon>().basemodel.toString());
    setState(() {
      //  context.read<QRCon>()
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return
        // Scaffold(
        // backgroundColor: Colors.blue,
        // body:
        Form(
      key: context.read<QRCon>().formkey[0],
      child: Container(
        // // alignment: Alignment.center,
        height: Screens.padingHeight(context) * 0.8,

        // width: Screens.width(context) ,
        padding: EdgeInsets.only(
            left: Screens.width(context) * 0.03,
            top: Screens.bodyheight(context) * 0.03,
            bottom: Screens.bodyheight(context) * 0.03,
            right: Screens.width(context) * 0.03),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        // color: Colors.white,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: Screens.width(context),
              // color: Colors.amber,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: Screens.width(context) * 0.35),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //  color: Colors.amber,
                    // width: Screens.width(context)*0.80,
                    // alignment: Alignment.center,
                    child: Center(
                      child: Container(
                        //  width: Screens.width(context) * 0.10,
                        // color: Colors.blue,
                        child: Image.asset(
                          "assets/Jco-Logo1.jpg",
                          fit: BoxFit.cover,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // context.read<QRCon>().terminal==null?
                      Container(
                        // color: Colors.amber,
                        child: IconButton(
                          tooltip:"${context
                                          .read<QRCon>()
                                          .mycontroller[4]
                                          .text.toString().trim()} - ${context
                                          .read<QRCon>()
                                          .mycontroller[5]
                                          .text.toString().trim()} - ${context
                                          .read<QRCon>()
                                          .mycontroller[6]
                                          .text.toString().trim()}",
                          onPressed: 
                          () {
                              setState(() {
                                 setState(() {
                                        showDialog(context: context, builder: (BuildContext context ){
                                          return AlertDialog(
                                             shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      contentPadding: EdgeInsets.all(2),
                      // backgroundColor: Colors.transparent,
                      insetPadding:
                          EdgeInsets.all(Screens.bodyheight(context) * 0.1),
content:settings(context) ,
                                          );
                                        });
                                        // context.read<QRCon>().isterminal =
                                        //     true;
                                        // context
                                        //     .read<QRCon>()
                                        //     .isamountvisible = true;
                                        // context.read<QRCon>().IPfieldvisible =
                                        //     true;
                                        // context.read<QRCon>().button = false;
                                      });
                               
                              });
                            },
                         icon:Icon (Icons.settings),
                          ),
                      ),
                    
                      context.read<QRCon>().isterminal == false
                          ? Container(
                              child: Text(
                                "Termial is required",
                                style: TextStyle(color: Colors.red),
                              ),
                            )
                          : Container(),
                  //     SizedBox(
                  //       width: Screens.width(context) * 0.02,
                  //     ),
                  //     context.read<QRCon>().isamountvisible == true
                  //         ? Container(
                  //             height: Screens.padingHeight(context) * 0.03,
                  //             width: Screens.width(context) * 0.2,
                  //             // color: Colors.amber,
                  //             child: SizedBox.expand(
                  //               child: TextField(
                  //                 controller:
                  //                     context.read<QRCon>().mycontroller[4],
                  //                 onEditingComplete: () {
                  //                   setState(() {
                  //                     // context.read<QRCon>().isterminal = true;
                  //                     // context.read<QRCon>().isamountvisible =
                  //                     //     false;
                  //                     // context.read<QRCon>().onselect(context
                  //                     //     .read<QRCon>()
                  //                     //     .mycontroller[4]
                  //                     //     .text
                  //                     //     .toString()
                  //                     //     .trim());
                  //                     // context
                  //                     //     .read<QRCon>()
                  //                     //     .reievervb();
                  //                   });
                  //                 },
                  //                 decoration: InputDecoration(
                  //                     border: UnderlineInputBorder(), hintText: "Terminal",),
                                      
                  //               ),
                  //             ),
                  //           )
                  //         : Container(
                  //             alignment: Alignment.centerRight,
                  //             height: Screens.padingHeight(context) * 0.02,
                  //             width: Screens.width(context) * 0.2,
                  //             child: context
                  //                     .read<QRCon>()
                  //                     .mycontroller[4]
                  //                     .text
                  //                     .isEmpty
                  //                 ? Text("")
                  //                 : Text(
                  //                     " ${context.read<QRCon>().mycontroller[4].text}",
                  //                     style: TextStyle(color: Colors.grey),
                  //                   )),
                  // context.read<QRCon>().isterminal2 == false
                  //                 ? Container(
                  //                     child: Text(
                  //                       "Terminal is required",
                  //                       style: TextStyle(color: Colors.red),
                  //                     ),
                  //                   )
                  //                 : Container(),
                  //             context.read<QRCon>().IPfieldvisible == true
                  //                 ? SizedBox(
                  //                     height:
                  //                         Screens.padingHeight(context) * 0.01,
                  //                   )
                  //                 : Container(),
                  //             context.read<QRCon>().IPfieldvisible == true
                  //                 ? Container(
                  //                     height: Screens.padingHeight(context) * 0.03,
                  //             width: Screens.width(context) * 0.2,
                  //                     child: TextField(
                  //                       // readOnly: context
                  //                       //         .read<QRCon>()
                  //                       //         .mycontroller[5]
                  //                       //         .text
                  //                       //         .isNotEmpty
                  //                       //     ? true
                  //                       //     : false,
                  //                       controller: context
                  //                           .read<QRCon>()
                  //                           .mycontroller[5],
                  //                       // onEditingComplete: () {
                  //                       //   setState(() {
                  //                       //     // context
                  //                       //     //     .read<QRCon>()
                  //                       //     //     .IPfieldvisible = false;
                  //                       //   });
                  //                       // },
                  //                       decoration: InputDecoration(
                  //                         contentPadding:
                  //                             const EdgeInsets.symmetric(
                  //                                 vertical: 5, horizontal: 5),
                  //                         border: UnderlineInputBorder(),
                  //                         hintText: "IP",
                  //                         //  labelStyle: theme.textTheme.bodyText1
                  //                       ),
                  //                     ))
                  //                 : Container(
                  //                   // color: Colors.amber,
                  //                     alignment: Alignment.centerRight,
                  //                       height: Screens.padingHeight(context) * 0.03,
                  //             width: Screens.width(context) * 0.2,
                  //                     child: context
                  //                             .read<QRCon>()
                  //                             .mycontroller[5]
                  //                             .text
                  //                             .isEmpty
                  //                         ? Text("")
                  //                         : Text(
                  //                             " ${context.read<QRCon>().mycontroller[5].text}",
                  //                             style:
                  //                                 TextStyle(color: Colors.grey),
                  //                           )),
                  //             context.read<QRCon>().isIP == false
                  //                 ? Container(
                  //                     child: Text(
                  //                       "IP is required",
                  //                       style: TextStyle(color: Colors.red),
                  //                     ),
                  //                   )
                  //                 : Container(),

                  //             context.read<QRCon>().button == false
                  //                 ? Container(
                  //                     child: ElevatedButton(
                  //                         onPressed: () {
                  //                           setState(() {
                  //                             if (context
                  //                                     .read<QRCon>()
                  //                                     .mycontroller[4]
                  //                                     .text
                  //                                     .isNotEmpty &&
                  //                                 context
                  //                                     .read<QRCon>()
                  //                                     .mycontroller[5]
                  //                                     .text
                  //                                     .isNotEmpty) {
                  //                               context
                  //                                   .read<QRCon>()
                  //                                   .isterminal = true;
                  //                               context
                  //                                   .read<QRCon>()
                  //                                   .isamountvisible = false;
                  //                               context
                  //                                   .read<QRCon>()
                  //                                   .IPfieldvisible = false;
                  //                               context.read<QRCon>().isIP =
                  //                                   true;
                  //                               context
                  //                                   .read<QRCon>()
                  //                                   .isterminal2 = true;
                  //                               context.read<QRCon>().button =
                  //                                   true;
                  //                               // context.read<QRCon>().onselect(
                  //                               //     context
                  //                               //         .read<QRCon>()
                  //                               //         .mycontroller[4]
                  //                               //         .text
                  //                               //         .toString()
                  //                               //         .trim(),
                  //                               //     context
                  //                               //         .read<QRCon>()
                  //                               //         .mycontroller[5]
                  //                               //         .text
                  //                               //         .toString()
                  //                               //         .trim());
                  //                               // context
                  //                               //     .read<QRCon>()
                  //                               //     .reievervb();
                  //                             } else {
                  //                               context.read<QRCon>().isIP =
                  //                                   false;
                  //                               context
                  //                                   .read<QRCon>()
                  //                                   .isterminal2 = false;
                  //                             }
                  //                           });
                  //                         },
                  //                         child: Text("ok")))
                  //                 : Container(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Screens.bodyheight(context) * 0.01,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: Screens.bodyheight(context) * 0.01,
            ),
            Container(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        //  height: Screens.padingHeight(context)*0.20,
                        width: Screens.width(context),
                        // padding: EdgeInsets.only(left: Screens.width(context)*0.22),
                        // color: Color.fromRGBO(255, 152, 0, 1),
                        child: context.read<QRCon>().queuemodel2 == null
                            ? Container(
                                // alignment: Alignment.center,
                                // color: Colors.red,
                                //  height: Screens.padingHeight(context)*0.06,
                                width: Screens.width(context) * 0.5,
                                child: TextFormField(
                                  readOnly:
                                      context.read<QRCon>().isloading == true
                                          ? true
                                          : false,
                                  onEditingComplete: () {
                                    setState(() {
                                       context.read<QRCon>().disableKeyBoard(context);
                                    });
                                  },
                                  validator: (value) {
                                    if (context
                                        .read<QRCon>()
                                        .mycontroller[0]
                                        .text
                                        .isEmpty) {
                                      return "*required field";
                                    }

                                    return null;
                                  },
                                  controller:
                                      context.read<QRCon>().mycontroller[0],
                                  decoration: InputDecoration(
                                    //  contentPadding:
                                    //                 const EdgeInsets.symmetric(
                                    //                     vertical: 10,
                                    //                     horizontal: 10),
                                    //             enabledBorder: OutlineInputBorder(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(8),
                                    //               borderSide: BorderSide(
                                    //                   color: Colors.grey),
                                    //             ),

                                    //             // //focusborder
                                    //             focusedBorder: OutlineInputBorder(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(8),
                                    //               borderSide: BorderSide(
                                    //                   color: Colors.grey),
                                    //             ),

                                    //             errorBorder: OutlineInputBorder(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(8),
                                    //               borderSide:
                                    //                   BorderSide(color: Colors.red),
                                    //             ),
                                    //             focusedErrorBorder:
                                    //                 OutlineInputBorder(
                                    //               borderRadius:
                                    //                   BorderRadius.circular(8),
                                    //               borderSide:
                                    //                   BorderSide(color: Colors.red),
                                    //             ),
                                    border: OutlineInputBorder(),
                                    labelText: "Customer Name",
                                    //  labelStyle: theme.textTheme.bodyText1
                                  ),
                                ),
                              )
                            : Container(
                                // alignment: Alignment.center,
                                // color: Colors.amber,
                                // width: Screens.width(context)*0.4,
                                child: Text(
                                  "${context.read<QRCon>().queuemodel2!.customername.isEmpty ? "" : context.watch<QRCon>().queuemodel2!.customername}",
                                  style: theme.textTheme.bodyText1!
                                      .copyWith(fontSize: 20),
                                ),
                              ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Screens.padingHeight(context) * 0.01,
                  ),
                  context.read<QRCon>().queuemodel2 == null
                      ? Container(
                          // alignment: Alignment.center,
                          // color: Colors.red,
                          //  height: Screens.padingHeight(context)*0.06,
                          width: Screens.width(context) * 0.5,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            readOnly: context.read<QRCon>().isloading == true
                                ? true
                                : false,
                            validator: (value) {
                              if (context
                                  .read<QRCon>()
                                  .mycontroller[1]
                                  .text
                                  .isEmpty) {
                                return "*required field";
                              }
                                 else if(context
                                          .read<QRCon>()
                                          .mycontroller[1]
                                          .text.length > 10 ||context
                                          .read<QRCon>()
                                          .mycontroller[1]
                                          .text.length < 10){
                                            return "Please Enter valid Mobile Number";

                                      }
//  if(value > 10){
//                                             return "Please Enter valid Mobile Number";

//                                       }
                              return null;
                            },
                            onEditingComplete: () {
                              setState(() {
                                 context.read<QRCon>().disableKeyBoard(context);
                                //  context.read<QRCon>().validate();
                              });
                            },
                            controller: context.read<QRCon>().mycontroller[1],
                            decoration: InputDecoration(
                              counterText: "",
                              //  contentPadding:
                              //                 const EdgeInsets.symmetric(
                              //                     vertical: 10, horizontal: 10),
                              //             enabledBorder: OutlineInputBorder(
                              //               borderRadius: BorderRadius.circular(8),
                              //               borderSide:
                              //                   BorderSide(color: Colors.grey),
                              //             ),

                              //             // //focusborder
                              //             focusedBorder: OutlineInputBorder(
                              //               borderRadius: BorderRadius.circular(8),
                              //               borderSide:
                              //                   BorderSide(color: Colors.grey),
                              //             ),

                              //             errorBorder: OutlineInputBorder(
                              //               borderRadius: BorderRadius.circular(8),
                              //               borderSide:
                              //                   BorderSide(color: Colors.red),
                              //             ),
                              //             focusedErrorBorder: OutlineInputBorder(
                              //               borderRadius: BorderRadius.circular(8),
                              //               borderSide:
                              //                   BorderSide(color: Colors.red),
                              //             ),
                              border: OutlineInputBorder(),
                              labelText: "Customer Phone",
                              //  labelStyle: theme.textTheme.bodyText1
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.center,
                          //  height: Screens.padingHeight(context)*0.20,
                          width: Screens.width(context),
                          // color: Colors.orange,
                          child: context.read<QRCon>().queuemodel2!.custCode ==
                                  null
                              ? Text("")
                              : Text(
                                  "${context.read<QRCon>().queuemodel2!.custCode}",
                                  style: theme.textTheme.bodyText1!.copyWith(
                                      fontSize: 20, color: Colors.grey),
                                )),
                  SizedBox(
                    height: Screens.padingHeight(context) * 0.01,
                  ),
                  context.read<QRCon>().queuemodel2 != null ||
                          context.read<QRCon>().istimer == true
                      ? Container(
                          // color: Colors.amber,
                          alignment: Alignment.center,
                          child: context.read<QRCon>().queuemodel2 != null ||
                                  context.read<QRCon>().istimer == true
                              ? Text("0${context.read<QRCon>().minutescount}:${context.read<QRCon>().count.toString().padLeft(2,'0')}",
                                  // "00:${context.read<QRCon>().count}",
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                )
                              : Text(""),
                        )
                      : Container(),
                ],
              ),
            ),
            Center(
              child: Container(
                  height: Screens.padingHeight(context) * 0.30,
                  width: Screens.width(context) * 0.50,
                  alignment: Alignment.center,
                  // color: Colors.blue,
                  child: (context.read<QRCon>().queuemodel2 == null &&
                          context.watch<QRCon>().isloading == true)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            QrImage(
                              data:
                                  "upi://pay?pn=${AppConstant.ComName}&pa=${AppConstant.ComCode}&am=${context.watch<QRCon>().mycontroller[2].text}&tn=${context.watch<QRCon>().mycontroller[1].text}",
                              // "upi://pay?pn=JamesCo&pa=jamesandco.68065882@hdfcbank&am=1&tn=dfgdfh34",
                              version: QrVersions.auto,
                              // size: 400,
                            ),
                          ],
                        )
                      : (context.read<QRCon>().queuemodel2 != null ||
                              context.watch<QRCon>().isloading == true)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                QrImage(
                                  data:
                                      "upi://pay?pn=${context.watch<QRCon>().queuemodel2!.customername}&pa=${context.watch<QRCon>().queuemodel2!.custCode}&am=${context.watch<QRCon>().queuemodel2!.amount}&tn=${context.watch<QRCon>().queuemodel2!.Trans}",

                                  // "upi://pay?pn=${context.read<QRCon>().ComName}=${context.read<QRCon>().bankdetail}&am=${context.read<QRCon>().rupees}&tn=${context.read<QRCon>().Tnvalue}",
                                  // "upi://pay?pn=JamesCo&pa=jamesandco.68065882@hdfcbank&am=1&tn=dfgdfh34",
                                  version: QrVersions.auto,
                                  // size: 400,
                                ),
                              ],
                            )
                          : Container(
                              height: Screens.padingHeight(context) * 0.25,
                              width: Screens.width(context) * 0.30,
                              decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(5),
                                  //  color: Colors.amber,
                                  border: Border.all(color: Colors.grey)),
                            )),
            ),
            SizedBox(
              height: Screens.padingHeight(context) * 0.01,
            ),
            context.read<QRCon>().queuemodel2 == null
                ? Container(
                  alignment: Alignment.center,
                            // color: Colors.amber,
                            // width: Screens.width(context)*0.5,
                            padding: EdgeInsets.only(
                                left: (context.read<QRCon>().queuemodel2 ==
                                            null &&
                                        context.watch<QRCon>().isloading ==
                                            true)
                                    ? Screens.width(context) * 0.1
                                    : Screens.width(context) * 0.02),
                  child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          // alignment: Alignment.center,
                          // color: Colors.red,
                          //  height: Screens.padingHeight(context)*0.06,

                          width: Screens.width(context) * 0.5,
                          child: TextFormField(
                            readOnly: context.read<QRCon>().isloading == true
                                ? true
                                : false,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (context
                                  .read<QRCon>()
                                  .mycontroller[2]
                                  .text
                                  .isEmpty) {
                                return "*required field";
                              }

                              return null;
                            },
                            onEditingComplete: () {
                              setState(() {
                                 context.read<QRCon>().disableKeyBoard(context);
                                if(context
                                          .read<QRCon>()
                                          .mycontroller[4]
                                          .text
                                          .isNotEmpty &&
                                      context
                                          .read<QRCon>()
                                          .mycontroller[5]
                                          .text
                                          .isNotEmpty &&
                                          context
                                          .read<QRCon>()
                                          .mycontroller[6]
                                          .text
                                          .isNotEmpty &&context
                                          .read<QRCon>()
                                          .mycontroller[7]
                                          .text
                                          .isNotEmpty&&context
                                          .read<QRCon>()
                                          .mycontroller[8]
                                          .text
                                          .isNotEmpty){
                                                context
                                                    .read<QRCon>()
                                                    .validate();
                                             }else{
                                               final snackBar = SnackBar(
      content: Text("Terminal is required"),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
                                             }
                              });
                            },
                            controller: context.read<QRCon>().mycontroller[2],
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Amount",
                                suffixIcon: IconButton(
                                    onPressed:context.read<QRCon>().isloading == true
                                            ?(){}: () {
                                      setState(() {
                                         context
                                                    .read<QRCon>()
                                                    .disableKeyBoard(context);
                                       if(context
                                          .read<QRCon>()
                                          .mycontroller[4]
                                          .text
                                          .isNotEmpty &&
                                      context
                                          .read<QRCon>()
                                          .mycontroller[5]
                                          .text
                                          .isNotEmpty &&
                                          context
                                          .read<QRCon>()
                                          .mycontroller[6]
                                          .text
                                          .isNotEmpty &&context
                                          .read<QRCon>()
                                          .mycontroller[7]
                                          .text
                                          .isNotEmpty&&context
                                          .read<QRCon>()
                                          .mycontroller[8]
                                          .text
                                          .isNotEmpty){
                                                context
                                                    .read<QRCon>()
                                                    .validate();
                                             }else{
                                               final snackBar = SnackBar(
      content: Text("Terminal is required"),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
                                             }
                                      });
                                    },
                                    icon: Icon(Icons.qr_code))
                                //  labelStyle: theme.textTheme.bodyText1
                                ),
                          ),
                        ),
                        SizedBox(
                                  width: Screens.width(context) * 0.02,
                                ),
                     (context.read<QRCon>().queuemodel2 == null &&
                                        context.watch<QRCon>().isloading ==
                                            true)
                                    ? Container(
                                      // color: Colors.amber,
                                        height:
                                            Screens.bodyheight(context) * 0.05,
                                        width: Screens.width(context) * 0.1,
                                        child: context.read<QRCon>().isbuttondisable ==false?ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                context
                                                    .read<QRCon>()
                                                    .pushRabitmqSales(context);
          //                                           final snackBar =
          // SnackBar(content: Text("Sent Succesfully"));
          //                                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                              });
                                            },
                                            child: Text("OK")):Container()
                                            )
                                    : Container(),
                    ],
                  ),
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: Screens.width(context)*0.20),
                        alignment: Alignment.center,
                          // height:
                          //                   Screens.bodyheight(context) * 0.05,
                        //  height: Screens.padingHeight(context)*0.20,
                        width: Screens.width(context)*0.55,
                        // color: Colors.orange,
                        child: Text(
                          "${context.read<QRCon>().queuemodel2!.amount}",
                          style: theme.textTheme.bodyText1!
                              .copyWith(fontSize: 25, color: Colors.black),
                        )),
                SizedBox(
                                  width: Screens.width(context) * 0.1,
                                ),
                         Container(
                          
                                        height:
                                            Screens.bodyheight(context) * 0.04,
                                        width: Screens.width(context) * 0.1,
                                        child:context.read<QRCon>().isbuttondisable2 ==false? ElevatedButton(
                                            onPressed: () {
                                              setState(() {
                                                context
                                                    .read<QRCon>()
                                                    .pushRabitmqSales2(context);
                                                   });
                                            },
                                            child: Text("OK")):Container()
                                            )   ],
                ),
            context.read<QRCon>().queuemodel2 != null
                ? SizedBox(height: Screens.bodyheight(context) * 0.1)
                : SizedBox(
                    height: Screens.bodyheight(context) * 0.02,
                  ),
            Container(
              // color: Colors.amber,
              alignment: Alignment.center,
              // padding: EdgeInsets.only(left: Screens.width(context)*0.17),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white),
                          // color: Colors.green
                          ),
                      child: Image.asset(
                        "assets/gpay2.png",
                        fit: BoxFit.cover,
                        height: 50,
                      )),
                  SizedBox(
                    width: Screens.width(context) * 0.01,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.white),
                      child: Image.asset(
                        "assets/paytm2.png",
                        fit: BoxFit.cover,
                        height: 50,
                      )),
                  SizedBox(
                    width: Screens.width(context) * 0.01,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.white),
                      child: Image.asset(
                        "assets/phonepay.png",
                        fit: BoxFit.cover,
                        height: 50,
                      )),
                  SizedBox(
                    width: Screens.width(context) * 0.01,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.white),
                      child: Image.asset(
                        "assets/amazon2.png",
                        fit: BoxFit.cover,
                        height: 50,
                      )),
                  SizedBox(
                    width: Screens.width(context) * 0.01,
                  ),
                  Container(
                      // width: Screens.width(context)*0.05,
                      decoration: BoxDecoration(
                          // border: Border.all(color: Colors.white),
                          color: Colors.white),
                      child: Image.asset(
                        "assets/upi.png",
                        fit: BoxFit.cover,
                        height: 50,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // );
  }

  Widget buildTime() {
    //  startTimer();
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes =
        twoDigits(context.read<QRCon>().duration.inMinutes.remainder(60));

    final seconds =
        twoDigits(context.read<QRCon>().duration.inSeconds.remainder(60));
    return Text("$minutes:$seconds");
  }
   settings(BuildContext context,) {
    final theme = Theme.of(context);
    return StatefulBuilder(builder: (context, st) {
      return Container(
        // padding: EdgeInsets.only(
        //     // top: Screens.padingHeight(context) * 0.01,
        //     left: Screens.width(context) * 0.03,
        //     right: Screens.width(context) * 0.03,
        //     bottom: Screens.padingHeight(context) * 0.01),
        width: Screens.width(context) * 0.7,
        // color: Colors.red,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                // width: Screens.width(context)*0.55,
                height: Screens.padingHeight(context) * 0.04,
                color: theme.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: Screens.padingHeight(context) * 0.02,
                          right: Screens.padingHeight(context) * 0.02),
                      // color: Colors.red,
                      //  width: Screens.width(context) * 0.4,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Alert",
                        style: theme.textTheme.bodyText2
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          size: Screens.padingHeight(context) * 0.025,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Screens.bodyheight(context) * 0.01,
              ),
              Form(
                key: context.read<QRCon>().formkey[1],
                child: Column(
                  children: [
                    

                    Container(
                      width: Screens.width(context)*0.6,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey.withOpacity(0.001),
                      ),
                      child: TextFormField(
                        // autofocus: true,
                        controller: context.read<QRCon>().mycontroller[4],
                        cursorColor: Colors.grey,
                        readOnly: context.read<QRCon>().mycontroller[4].text.isNotEmpty?true:false,
                        // keyboardType: TextInputType.number,
                         onEditingComplete: () {
                              setState(() {
                                 context.read<QRCon>().disableKeyBoard(context);
                                //  context.read<QRCon>().validate();
                              });
                            },
                        onChanged: (v) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Terminal';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Terminal',
                          hintStyle: theme.textTheme.bodyText2
                              ?.copyWith(color: Colors.grey),
                          filled: false,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    Container(
                       width: Screens.width(context)*0.6,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey.withOpacity(0.001),
                      ),
                      child: TextFormField(
                         readOnly: context.read<QRCon>().mycontroller[5].text.isNotEmpty?true:false,
                        controller: context.read<QRCon>().mycontroller[5],
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.number,
                        onChanged: (v) {},
                         onEditingComplete: () {
                              setState(() {
                                 context.read<QRCon>().disableKeyBoard(context);
                                //  context.read<QRCon>().validate();
                              });
                            },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter IP';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'IP',
                          hintStyle: theme.textTheme.bodyText2
                              ?.copyWith(color: Colors.grey),
                          filled: false,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    Container(
                      width: Screens.width(context)*0.6,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey.withOpacity(0.001),
                      ),
                      child: TextFormField(
                        // autofocus: true,
                        controller: context.read<QRCon>().mycontroller[6],
                        cursorColor: Colors.grey,
                        readOnly: context.read<QRCon>().mycontroller[6].text.isNotEmpty?true:false,
                        //keyboardType: TextInputType.number,
                        onChanged: (v) {},
                         onEditingComplete: () {
                              setState(() {
                                 context.read<QRCon>().disableKeyBoard(context);
                                //  context.read<QRCon>().validate();
                              });
                            },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' Enter Exchange';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Exchange',
                          hintStyle: theme.textTheme.bodyText2
                              ?.copyWith(color: Colors.grey),
                          filled: false,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Screens.padingHeight(context) * 0.01),
                     Container(
                      width: Screens.width(context)*0.6,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey.withOpacity(0.001),
                      ),
                      child: TextFormField(
                        // autofocus: true,
                        controller: context.read<QRCon>().mycontroller[7],
                        cursorColor: Colors.grey,
                        readOnly: context.read<QRCon>().mycontroller[7].text.isNotEmpty?true:false,
                        //keyboardType: TextInputType.number,
                        onChanged: (v) {},
                         onEditingComplete: () {
                              setState(() {
                                 context.read<QRCon>().disableKeyBoard(context);
                                //  context.read<QRCon>().validate();
                              });
                            },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' Enter Name';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'Name',
                          hintStyle: theme.textTheme.bodyText2
                              ?.copyWith(color: Colors.grey),
                          filled: false,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Screens.padingHeight(context) * 0.01),
           context.read<QRCon>().   isupiidvisible==false?       Container(
                      width: Screens.width(context)*0.6,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey.withOpacity(0.001),
                      ),
                      child: TextFormField(
                        // autofocus: true,
                        controller: context.read<QRCon>().mycontroller[8],
                        cursorColor: Colors.grey,
                        readOnly: context.read<QRCon>().mycontroller[8].text.isNotEmpty?true:false,
                        //keyboardType: TextInputType.number,
                        onChanged: (v) {},
                         onEditingComplete: () {
                              setState(() {
                                 context.read<QRCon>().disableKeyBoard(context);
                                //  context.read<QRCon>().validate();
                              });
                            },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ' Enter ID';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          hintText: 'UPI ID',
                          hintStyle: theme.textTheme.bodyText2
                              ?.copyWith(color: Colors.grey),
                          filled: false,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 25,
                          ),
                        ),
                      ),
                    ):Container(),
                    SizedBox(height: Screens.padingHeight(context) * 0.01),
                    Container(
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey.withOpacity(0.001),
                      ),
                    )  
                  ],
                ),
              ),
              SizedBox(height: Screens.padingHeight(context) * 0.01),
        context.read<QRCon>(). issetbuttondisable==false?      InkWell(
                onTap:  () {
                  setState(() {
                                              // if (context
                                              //         .read<QRCon>()
                                              //         .mycontroller[4]
                                              //         .text
                                              //         .isNotEmpty &&
                                              //     context
                                              //         .read<QRCon>()
                                              //         .mycontroller[5]
                                              //         .text
                                              //         .isNotEmpty) {
                                                context
                                                    .read<QRCon>()
                                                    .isterminal = true;
                                                // context
                                                //     .read<QRCon>()
                                                //     .isamountvisible = false;
                                                // context
                                                //     .read<QRCon>()
                                                //     .IPfieldvisible = false;
                                                // context.read<QRCon>().isIP =
                                                //     true;
                                                // context
                                                //     .read<QRCon>()
                                                //     .isterminal2 = true;
                                                // context.read<QRCon>().button =
                                                //     true;
                                                context.read<QRCon>().onselect(
                                                    context
                                                        .read<QRCon>()
                                                        .mycontroller[4]
                                                        .text
                                                        .toString()
                                                        .trim(),
                                                    context
                                                        .read<QRCon>()
                                                        .mycontroller[5]
                                                        .text
                                                        .toString()
                                                        .trim(),
                                                         context
                                                        .read<QRCon>()
                                                        .mycontroller[6]
                                                        .text
                                                        .toString()
                                                        .trim(),
                                                        context,
                                                        context
                                                        .read<QRCon>()
                                                        .mycontroller[7]
                                                        .text
                                                        .toString()
                                                        .trim(),
                                                        context
                                                        .read<QRCon>()
                                                        .mycontroller[8]
                                                        .text
                                                        .toString()
                                                        .trim(),
                                                        );
                                                        // Navigator.pop(context);
                                                // context
                                                //     .read<QRCon>()
                                                //     .reievervb();
                                              // } else {
                                              //   context.read<QRCon>().isIP =
                                              //       false;
                                              //   context
                                              //       .read<QRCon>()
                                              //       .isterminal2 = false;
                                              // }
                                            });
                  // st(() {
                  //   context.read<QRCon>().onselect( context
                  //                                       .read<QRCon>()
                  //                                       .mycontroller[4]
                  //                                       .text
                  //                                       .toString()
                  //                                       .trim(),
                  //                                   context
                  //                                       .read<QRCon>()
                  //                                       .mycontroller[5]
                  //                                       .text
                  //                                       .toString()
                  //                                       .trim());
                  //   //logCon.ClearSp();
                  // });
                },
                child:  Container(
                  alignment: Alignment.center,
                  height: Screens.padingHeight(context) * 0.040,
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                  ),
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Set",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyText1
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ):Container(),
            ],
          ),
        ),
      );
    });
  }
}
