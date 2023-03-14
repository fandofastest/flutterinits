import 'package:flutter/foundation.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'generated/assets.dart';

class Config {
  static String apiKey="AIzaSyCV2Nh0MkLjXppLmBRf9ta9oS91iSqN5Oo";
  static String jsonurl = "https://fando.id/json/music.json";
  static String keywords = "music";






  static const String banner = "ca-app-pub-3940256099942544/6300978111";
  static const String inter = "ca-app-pub-3940256099942544/1033173712";
  static const String open = "ca-app-pub-3940256099942544/3419835294";


  static const String appName = "Calvin Harris";
  static const String devid = "5050647488420595889";
  static const String baseurl = "http://sample.iostudiodev.xyz/api/mobile/";
  static const String playUrl = "${baseurl}play/";



  static const  List<String> infotitle = [
    "Edit your profile",
    "Privacy Policy",
    "Rate App",
    "Share",
    "Version App ",
  ];

  static const  List<String> infodesc = [
    "Important info for both of us",
    "Share to your friends for enjoying music",
    "Ratings and reviews application",
    "Vrsn-2022.01.05",
  ];
  static const String disclaimertext = "This app may contain third party advertisements and links to third party sites. We do not make any representation as to the accuracy or suitability of any of the information contained in those advertisements or sites and does not accept any responsibility or liability for the conduct or content of those advertisements and sites and the offerings made by the third parties.Advertising keeps us and many of the websites and services you use free of charge. We work hard to make sure that ads are safe, unobtrusive, and as relevant as possible.  We've updated our Disclaimer to provide you with complete transparency into what is being set when you visit our site and how it's being used. By using our service, registering an account, or making a purchase, you hereby consent to our Disclaimer and agree to its terms.  Should we update, amend or make any changes to this document so that they accurately reflect our Service and policies. Unless otherwise required by law, those changes will be prominently posted here. Then, if you continue to use the Service, you will be bound by the updated Disclaimer. If you do not want to agree to this or any updated Disclaimer, you can delete your account   ";
  static const String privacytext = "This app may contain third party advertisements and links to third party sites. We do not make any representation as to the accuracy or suitability of any of the information contained in those advertisements or sites and does not accept any responsibility or liability for the conduct or content of those advertisements and sites and the offerings made by the third parties.Advertising keeps us and many of the websites and services you use free of charge. We work hard to make sure that ads are safe, unobtrusive, and as relevant as possible.  We've updated our Disclaimer to provide you with complete transparency into what is being set when you visit our site and how it's being used. By using our service, registering an account, or making a purchase, you hereby consent to our Disclaimer and agree to its terms.  Should we update, amend or make any changes to this document so that they accurately reflect our Service and policies. Unless otherwise required by law, those changes will be prominently posted here. Then, if you continue to use the Service, you will be bound by the updated Disclaimer. If you do not want to agree to this or any updated Disclaimer, you can delete your account   ";


  static void Onesignalinit (){
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("bdbc5962-11ab-4048-a2fe-8953769468d3");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      if (kDebugMode) {
        print("Accepted permission: $accepted");
      }
    });
  }

}