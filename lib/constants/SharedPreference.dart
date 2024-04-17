import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
//   static String sPLocale = "Locale";
// //  static String sPLocale = "Locale";
//   static String spStgIP = "SettingIP";
  static String spHost = "spHost";
  static String spname = "spname";
  static String spcode = "spcode";
//   static String spDeviceID = "spDeviceID";
//   static String spSiteCode = "spSiteCode";
//   static String islogggedIN = "IslogggedIN";
//   static String spUser = "spUser";
//   static String splicense = "license";
//   static String spuserId = "userId";
  static String branchSp = "branchSp";
  static String terminal = "terminal";
// static String isDatadownloaded = "isDatadownloaded";

  

  static Future<bool> saveBranchSP(String branchSp1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(branchSp, branchSp1);
  }

  static Future<String?> getBranchSSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(branchSp);
  }

  static clrBranchSSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(branchSp);
  }

  static Future<bool> saveTerminal(String terminal1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(terminal, terminal1);
  }

  static Future<String?> getTerminal() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(terminal);
  }

  static clearTerminal() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(terminal);
  }

  static Future<bool> saveHostSP(String spHost1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(spHost, spHost1);
  }

  static Future<String?> getHostDSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(spHost);
  }

  static clearHost() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(spHost);
  }

   static Future<bool> saveComNameSP(String spname1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(spname, spname1);
  }

  static Future<String?> getComNameDSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(spname);
  }

  static clearComName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(spname);
  }


   static Future<bool> saveComCodeSP(String spcode1) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(spcode, spcode1);
  }

  static Future<String?> getComCodeDSP() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(spcode);
  }

  static clearComCode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(spcode);
  }
}
