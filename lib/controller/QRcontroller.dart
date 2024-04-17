// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dart_amqp/dart_amqp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/HomePage.dart';
import 'package:flutter_application_1/QueueMpdel/datachecking.dart';

import 'package:dart_amqp/dart_amqp.dart' as am;
import '../QueueMpdel/model.dart';
import '../constants/AppConstant.dart';
import '../constants/SharedPreference.dart';

class QRCon extends ChangeNotifier {
  List<TextEditingController> mycontroller =
      List.generate(150, (i) => TextEditingController());
  // final formKey = GlobalKey<FormState>();
  List<GlobalKey<FormState>> formkey =
      List.generate(10, (i) => GlobalKey<FormState>());

  init() async {
    // await SharedPref.clearTerminal();
    isloading = false;
  //  IPfieldvisible =false;
   isIP=true;
   isterminal2=true;
   button=true;
    // isamountvisible = false;
    queuemodel2 = null;
    mycontroller[0].clear();
    mycontroller[1].clear();
    mycontroller[2].clear();
     mycontroller[4].clear();
      mycontroller[5].clear();
       mycontroller[6].clear();
        mycontroller[7].clear();
         mycontroller[8].clear();
    String? terminalold = await SharedPref.getTerminal();
    String? ipold = await SharedPref.getHostDSP();
    String? exchangeold = await SharedPref.getBranchSSP();
    String? ComNameold = await SharedPref.getComNameDSP();
    String? ComCodeold = await SharedPref.getComCodeDSP();
    if (terminalold == null || terminalold == "" && ipold ==null || ipold =="" && exchangeold==null || exchangeold=="" && ComCodeold==null || ComCodeold=="" && ComNameold==null || ComNameold=="") {
      mycontroller[4].text = "";
      mycontroller[5].text ="";
      mycontroller[6].text ="";
      mycontroller[7].text ="";
      mycontroller[8].text ="";
    } else {
      mycontroller[4].text = terminalold.toString();
      mycontroller[5].text = ipold.toString();
       mycontroller[6].text = exchangeold.toString();
        mycontroller[7].text = ComNameold.toString();
         mycontroller[8].text = ComCodeold.toString();
         AppConstant.ComName=ComNameold.toString().trim();
         AppConstant.ComCode=ComCodeold.toString().trim();
         log("message11:::"+AppConstant.ComName.toString()+":::"+mycontroller[7].text.toString()+":::"+ComNameold.toString());
          log("message12:::"+AppConstant.ComCode.toString());
         
      reievervb();
      isterminal = true;
      issetbuttondisable =true;
      isupiidvisible=true;
      // isamountvisible = false;
      // IPfieldvisible =false;
     
    }
    // mycontroller[4].clear();
  }

  Timer? timer;
  Duration duration = Duration();
  // addTime() {
  //   final addseconds = 1;
  //   final seconds = duration.inSeconds + addseconds;
  //   duration = Duration(seconds: seconds);
  //   notifyListeners();
  // }

  // startTimer() {
  //   timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  //   notifyListeners();
  // }

  List<String> items = [
    'UPI_James_T1',
    'UPI_James_T2',
  ];

  queuemodel? queuemodel2;
  bool isloading = false;
  bool isamountvisible = false;
  bool IPfieldvisible =false;

  bool istimer = false;
  bool isterminal = false;
  bool isIP=false;
  bool isterminal2=false;
  bool button=false;
  bool isbuttondisable=false;
  bool isbuttondisable2=false;
   bool issetbuttondisable=false;
   bool isupiidvisible=false;
  String? ComName;
  String? rupees;
  String? Tnvalue;
  String? bankdetail;
  String? terminalnew = "";
  String? IPnew = "";
  String? exchangenew="";
  String? ComNamenew="";
  String? ComCodenew="";
  List<queuemodel> basemodel = [];
  String? terminal;
//  ss(){
//   queuemodel(custCode: , Trans: Trans, amount: amount, customername: customername)
//  }

  // Timingmethod() {
  //   Widget buildTime() {
  //     String twoDigits(int n) => n.toString().padLeft(2, "0");
  //     final minutes = twoDigits(duration.inMinutes.remainder(60));

  //     final seconds = twoDigits(duration.inSeconds.remainder(60));
  //     notifyListeners();
  //     return Text("$minutes:$seconds");
  //   }
  // }
int seconds=60;
int minutes =2;
String digitseconds="00";
String digitminutes="00";
// bool timestart=false;
  int count = 15;
  int minutescount=2;
  // AnimationController controller=AnimationController(vsync: this,);
  // 
  // Timer? timer;
  // Duration duration = Duration();
// Timer timer;
startTimer3(){
  timer?.cancel();
  // // timestart=true;
  // const oneSec = const Duration(seconds: 1);
  timer = Timer.periodic(Duration(seconds: 1), (timer) {
  if (minutescount == 0 && count == 0) {
    timer.cancel();
    mycontroller[0].clear();
    mycontroller[1].clear();
    mycontroller[2].clear();
    isloading = false;
    istimer = false;
    notifyListeners();
  } else if (count > 0) {
    count--;
    final seconds = count;
    duration = Duration(seconds: seconds);
  } else {
    count = 59;
    minutescount--;
    final seconds = count;
    duration = Duration(minutes: minutescount, seconds: seconds);
  }
  notifyListeners();
});
}

  startTimer() {
    timer?.cancel();
    //  count = 15;
    timer = Timer.periodic(Duration(seconds: 1,), (timer) {
// if(minutescount !=0 && count ==0 ){
//   final  minutescount2=minutescount--;
//   count =59;
//    final seconds = count--;
//   duration = Duration(minutes:minutescount2 , seconds: seconds);
//   // if(count>0){
    
    
      
      
  // }
// }
if(minutescount ==0 && count ==0){
         timer.cancel();
        mycontroller[0].clear();
        mycontroller[1].clear();
        mycontroller[2].clear();
        isloading = false;
        istimer = false;
        notifyListeners();
      }
      else if(count > 0){
        final seconds = count--;
      // final  minutescount2=minutescount--;
        duration = Duration(
          // minutes:minutescount2 ,
           seconds: seconds);
      }
      else{
         count=60;
        final seconds = count--;
    final  minutescount2=minutescount--;
        duration = Duration(
          minutes:minutescount2 ,
           seconds: seconds);
      }

    //   if ( count > 0 ) {
    //     // count=59;
    //     final seconds = count--;
    //   // final  minutescount2=minutescount--;
    //     duration = Duration(
    //       // minutes:minutescount2 ,
    //        seconds: seconds);
    //   }
    //   if ( count == 0 ) {
    //     count=60;
    //     final seconds = count--;
    // final  minutescount2=minutescount--;
    //     duration = Duration(
    //       minutes:minutescount2 ,
    //        seconds: seconds);
     
      
    //   }
      
      // else    if(minutescount ==0 && count ==0){
      //    timer.cancel();
      //   mycontroller[0].clear();
      //   mycontroller[1].clear();
      //   mycontroller[2].clear();
      //   isloading = false;
      //   istimer = false;
      // }
      
      //  else {
      //   timer.cancel();
      //   mycontroller[0].clear();
      //   mycontroller[1].clear();
      //   mycontroller[2].clear();
      //   isloading = false;
      //   istimer = false;
      // } 
      
      // });
      notifyListeners();
    });
  }

  startTimer2() {
     timer?.cancel();
    //  count = 15;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
//  final addseconds=1;
      // setState(() {
        if(minutescount ==0 && count ==0){
        timer.cancel();
        queuemodel2 = null;
        isloading = false;
        istimer = false;
        notifyListeners();
      }
      else if(count > 0){
        final seconds = count--;
      // final  minutescount2=minutescount--;
        duration = Duration(
          // minutes:minutescount2 ,
           seconds: seconds);
      }
      else{
         count=60;
        final seconds = count--;
    final  minutescount2=minutescount--;
        duration = Duration(
          minutes:minutescount2 ,
           seconds: seconds);
      }
      // if (count > 0) {
      //   final seconds = count--;
      //   duration = Duration(seconds: seconds);
      // }
      
      // else {
      //   timer.cancel();
      //   queuemodel2 = null;
      //   isloading = false;
      //   istimer = false;
      // }
      // });
      notifyListeners();
    });
  }

  validate() {
    if (formkey[0].currentState!.validate()) {
      count = 00;
// int seconds=60;
minutescount =2;
// String digitseconds="00";
// String digitminutes="00";
      startTimer();
      istimer = true;
      isloading = true;
      // Future.delayed(Duration(seconds: 15), () {
      //   log("deleete statr");
      //   mycontroller[0].clear();
      //   mycontroller[1].clear();
      //   mycontroller[2].clear();
      //   isloading = false;
      //   istimer = false;
      // });
    } else {
      isloading = false;
      istimer = false;
      notifyListeners();
    }
    // String? Textfi1;
    // String? Textfi2;
    // String? Textfi3;
    // if (mycontroller[0].text != null &&
    //     mycontroller[1].text != null &&
    //     mycontroller[2].text != null) {
    //   istimer = true;
    //   isloading = true;
    //   startTimer();
    //   notifyListeners();
    // }
    // Textfi1 = mycontroller[0].text;
    // log("1::" + Textfi1.toString());
    // Textfi2 = mycontroller[1].text;

    // log("2::" + Textfi2.toString());
    // Textfi3 = mycontroller[3].text;

    // log("3::" + Textfi3.toString());

    //   // consumer.cancel();
    //   //  queuemodel2 =null;
    //   notifyListeners();
    //   //  Navigator.po(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
    // });

    notifyListeners();
  }
Future<String?> getIP() async {
  String? ip = await SharedPref.getHostDSP();

  return ip;
}
Future<String?> getBranch() async {
  String? branch = await SharedPref.getBranchSSP();
  return branch;
}
  Future<String?> getTerminal() async {
    String? terminal = await SharedPref.getTerminal();
    return terminal;
  }
   Future<String?> getComName() async {
    String? terminal = await SharedPref.getComNameDSP();
    return terminal;
  }
   Future<String?> getComCode() async {
    String? terminal = await SharedPref.getComCodeDSP();
    return terminal;
  }

  onselect(String value,String value2,String value3,BuildContext context,String value4,String value5) async {
    if (formkey[1].currentState!.validate()) {
       issetbuttondisable =true;
       isupiidvisible=true;
           Navigator.pop(context);
    if (value.isNotEmpty && value2.isNotEmpty && value3.isNotEmpty &&value4.isNotEmpty && value5.isNotEmpty) {
      await SharedPref.clearTerminal();
       await SharedPref.clearHost();
      await SharedPref. clrBranchSSP();
      await SharedPref.clearComCode();
      await SharedPref.clearComName();
      queuemodel2 == null;

      SharedPref.saveTerminal(value.toString());
      SharedPref.saveHostSP(value2.toString());
      SharedPref.saveBranchSP(value3.toString());
       SharedPref.saveComNameSP(value4.toString());
       SharedPref.saveComCodeSP(value5.toString());
       
      String? terminal = await SharedPref.getTerminal();
      String? ip=await SharedPref.getHostDSP();
      String? exchange=await SharedPref.getBranchSSP();
      String? ComName=await SharedPref.getComNameDSP();
      String? ComCode=await SharedPref.getComCodeDSP();
      ComNamenew=ComName;
      ComCodenew=ComCode;
      exchangenew=exchange;
IPnew=ip;
      terminalnew = terminal;
      log("SharedPref.saveTerminal(terminal.toString():::" +
          terminal.toString());
          log("SharedPref.ip(ip.toString():::" +
          ip.toString());
          log("SharedPref.ip(ip.toString():::" +
          exchangenew.toString());
      // AppConstant.terminal = terminal.toString();
      log("message:::" + value.toString());
      AppConstant.ComName=ComNamenew.toString().trim();
      AppConstant.ComCode=ComCodenew.toString().trim();
      await reievervb();
      
       
       notifyListeners();
      
    }
     
      // nsotifyListeners();
      // issetbuttondisable =true;
    }
   
  }

// String? terminalnew
  reievervb() async {
    // onselect(mycontroller[4].text);
    // String? ip = await getIP();
    String? exchange = await getBranch();
    // await SharedPref.saveTerminal(terminalnew.toString());
    //  notifyListeners();
    // log("terminalnew:::"+terminalnew.toString());
    String? terminal = await getTerminal();
    String? ip=await getIP();
    log("terminalnew:::" + terminal.toString());
 log("ip:::" + ip.toString());
    // String? terminal = await SharedPref.getTerminal();
    if (terminal == null && ip ==null &&exchange ==null) {
      // notifyListeners();
      return;
    }
// await SharedPref.clearTerminal();
    // else if(terminalnew != terminal){}

//     else if(terminalnew == terminal){
// terminal = await getTerminal();
// notifyListeners();
//     }
    //  notifyListeners();

    // log("setted ip: " + terminal.toString());
    if (terminal != null && terminal != '' && ip != null && ip != "" && exchange != null && exchange != "") {
      //   // AppConstant.ip = ip;
      //   // AppConstant.branch = branch.toString();
      //102.69.167.106
      //  if(terminal =="UPI_James_T1"){
        AppConstant.ip =ip.toString(); 
      AppConstant.terminal = terminal.toString();
       AppConstant.exchange= exchange.toString();
      log("AppConstant terminal: " + AppConstant.terminal.toString());
      log("AppConstant ip: " + AppConstant.ip.toString());
      

      // log("Queue: " +
      //     "Br_${AppConstant.branch.trim()}_${AppConstant.terminal.toString().trim()}");
      am.ConnectionSettings settings = am.ConnectionSettings(
          host:"${AppConstant.ip.toString().trim()}",
          // "216.48.186.108",
          //  AppConstant.ip,
          //"102.69.167.106"
          port: 5672,
          authProvider: am.PlainAuthenticator("buson", "BusOn123"));
      am.Client client = am.Client(settings: settings);

       Map<String, Object> data = {"Branch": "${AppConstant.exchange.toString().trim()}"};

      am.Channel channel = await client.channel(); // Br_HOFG_T2

      am.Queue queue = await channel.queue(
        "${AppConstant.terminal.toString().trim()}",
        durable: true,
        arguments: data
      ); //arguments: data

      am.Consumer consumer = await queue.consume();

// log("datata: " + jsonDecode(message.payloadAsString).toString());

      consumer.listen((am.AmqpMessage message) {
        log("AppConstant terminal: " + AppConstant.terminal.toString());
        Map<String, dynamic> deocoded =
            jsonDecode(message.payloadAsString.toString());
        // log("ksdjkhfhsf: " + deocoded.containsKey("Name").toString());

        if (deocoded.containsKey("ObjectType")) {
          validateQueue(message);
        }
        // log("datata: " + jsonDecode(message.payloadAsString).toString())

        // consumer.cancel();

        // if (queuemodel2 != null) {
        //   Future.delayed(Duration(seconds: 10), () {
        //     log("deleete statr");
        //     // consumer.cancel();
        //     queuemodel2 = null;
        //     isloading = false;

        //     // notifyListeners();
        //  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
        //   });
        // }
        // notifyListeners();
      });
      //
    }
    // }

    notifyListeners();
  }

  void validateQueue(AmqpMessage message) async {
   
    basemodel.clear();
    isloading = true;
    log("datata: " + isloading.toString());
    // print("VVVVVVVVVVVVVVVVVVVVVVVVVVVV");
    log("sap message: " + message.payloadAsString);
    var data = jsonDecode(message.payloadAsString);
    log("queuedataSAP:::" + data.toString());
    SapConsumeQueue queuedata =
        SapConsumeQueue.fromjson(jsonDecode(message.payloadAsString));
    // log("queuedata22:::" + queuedata.amount.toString());
    // List<queuemodel> queuemodel2 = [];
    
    queuemodel queuemode = queuemodel(
        objecttype: queuedata.objectType,
        cardcode: queuedata.CardCode!,
        cardname: queuedata.CardName!,
        custCode: queuedata.pa!,
        Trans: queuedata.tn!,
        amount: queuedata.amount!,
        customername: queuedata.pn!,
        MobileNo: queuedata.MobileNo!.isEmpty?"":queuedata.MobileNo
        );
    basemodel.add(queuemode);
    log("queuemode::::" + basemodel.length.toString());
    queuemodel2 = queuemode;
    log("queuemodel2::::" + queuemodel2!.MobileNo.toString());
     count = 00;
    minutescount=2;

    startTimer2();
    // notifyListeners();
    // if (queuemodel2 == null) {
    //   isloading = false;
    notifyListeners();
    // }
  }
disableKeyBoard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    notifyListeners();
  }
  Future<void> delay() async {
    print("DELAY START");
    await Future.delayed(Duration(seconds: 10));
    print("DELAY END");
  }
Future<bool> onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Are you sure?"),
            content: Text("Do you want to exit an app"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text("No"),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                    // Navigator.app.ex;
                    notifyListeners();
                    // finish()
                  },
                  child: Text("yes"))
            ],
          ),
        )) ??
        false;
  } 
  pushRabitmqSales(BuildContext context) async {
    isbuttondisable =true;
    log("AAAAA");
    var ddd = json.encode({
      "CardCode": "",
      "MobileNo": mycontroller[1].text.toString(),
      "CardName": "",
      "Amount": mycontroller[2].text.toString(),
      "Terminal" :AppConstant.terminal.isEmpty?"": AppConstant.terminal.toString(),
      "CompanyName" :mycontroller[0].text.toString(),
      "CompanyCode" :"",
      "ObjectType":"",
      "TransID":"",
      "Exchange":AppConstant.exchange.isEmpty?"": AppConstant.exchange.toString()
    });
    log(ddd = json.encode({
      "CardCode": "",
      "MobileNo": mycontroller[1].text.toString(),
      "CardName": "",
      "Amount": mycontroller[2].text.toString(),
      "Terminal" :AppConstant.terminal.isEmpty?"": AppConstant.terminal.toString(),
      "CompanyName" :mycontroller[0].text.toString(),
      "CompanyCode" :"",
      "ObjectType":"",
      "TransID":"",
      "Exchange":AppConstant.exchange.isEmpty?"": AppConstant.exchange.toString()
    }).toString());
    Client client = Client();
    ConnectionSettings settings = ConnectionSettings(
        host: "${AppConstant.ip.toString().trim()}",
        port: 5672,
        authProvider: PlainAuthenticator("buson", "BusOn123"));
    Client client1 = Client(settings: settings);

    MessageProperties properties = new MessageProperties();

    // properties.headers = {"Branch": "UPI"};
    Channel channel = await client1.channel(); //Server_CS
    Exchange exchange =
        await channel.exchange("${AppConstant.exchange.toString().trim()}", ExchangeType.DIRECT, durable: true);
    exchange.publish(
      ddd,
      "response",
    );

    //cs

    // properties.headers = {"Branch": "UPI"};
    // exchange.publish(ddd, "", properties: properties);
    await client1.close();
    final snackBar = SnackBar(
      content: Text("Sent Succesfully"),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
    notifyListeners();
     mycontroller[0].clear();
        mycontroller[1].clear();
        mycontroller[2].clear();
         isloading = false;
        istimer = false;
        isbuttondisable=false;
        
  }

  pushRabitmqSales2(BuildContext context) async {
    isbuttondisable2 =true;
    log("AAAAA");
    var ddd = json.encode({
      "CardCode": queuemodel2!.cardcode.toString(),
      "CardName": queuemodel2!.cardname.toString(),
      "MobileNo": queuemodel2!.MobileNo.toString(),
      "Amount": queuemodel2!.amount.toString(),
      "Terminal" :AppConstant.terminal.isEmpty?"": AppConstant.terminal.toString(),
      "CompanyName" :queuemodel2!.customername.toString(),
      "CompanyCode" :queuemodel2!.custCode.toString(),
      "ObjectType":queuemodel2!.objecttype.toString(),
      "TransID":queuemodel2!.Trans.toString(),
      "Exchange":AppConstant.exchange.isEmpty?"": AppConstant.exchange.toString()
    });
    log(ddd = json.encode({
      "CardCode": queuemodel2!.cardcode.toString(),
      "CardName": queuemodel2!.cardname.toString(),
      "MobileNo": queuemodel2!.MobileNo.toString(),
      "Amount": queuemodel2!.amount.toString(),
      "Terminal" :mycontroller[4].text.toString(),
      "CompanyName" :queuemodel2!.customername.toString(),
      "CompanyCode" :queuemodel2!.custCode.toString(),
      "ObjectType":queuemodel2!.objecttype.toString(),
      "TransID":queuemodel2!.Trans.toString(),
      "Exchange":AppConstant.exchange.isEmpty?"": AppConstant.exchange.toString()
    }).toString());
    Client client = Client();
    ConnectionSettings settings = ConnectionSettings(
        host: "${AppConstant.ip.toString().trim()}",
        port: 5672,
        authProvider: PlainAuthenticator("buson", "BusOn123"));
    Client client1 = Client(settings: settings);

    MessageProperties properties = new MessageProperties();

    // properties.headers = {"Branch": "UPI"};
    Channel channel = await client1.channel(); //Server_CS
    Exchange exchange =
        await channel.exchange("${AppConstant.exchange.toString()}", ExchangeType.DIRECT, durable: true);
    exchange.publish(
      ddd,
      "response",
    );

    //cs

    // properties.headers = {"Branch": "UPI"};
    // exchange.publish(ddd, "", properties: properties);
    await client1.close();
         
    final snackBar = SnackBar(
      content: Text("Sent Succesfully"),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      snackBar,
    );
     notifyListeners();
     mycontroller[0].clear();
    mycontroller[1].clear();
    mycontroller[2].clear();
 isloading = false;
        istimer = false;
        queuemodel2 = null;
        isbuttondisable2=false;
        
        // queuemodel2!.customername == "";
        //     queuemodel2!.custCode == "";
   
    
  }
}
