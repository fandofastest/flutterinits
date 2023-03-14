import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music55/controller/myroute.dart';
import 'package:music55/mainhome.dart';
import 'package:music55/navigatorkey.dart';
import 'package:music55/style/theme.dart';
import 'package:music55/ui/player.dart';
import 'package:music55/ui/search.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'controller/musiccontroller.dart';
import 'controller/panelcontroller.dart';
import 'generated/assets.dart';
import 'widget/myappbar.dart';
import 'widget/mynavbar.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final prefs = await SharedPreferences.getInstance();
  final String? name = prefs.getString('name');
  Get.put(MyRoute());
  runApp(MyApp(name ?? 'test'));
}

class MyApp extends StatelessWidget {
  MyApp(this.name, {super.key});
  String name = '';
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      initialRoute: name == '' ? '/opening' : '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/search': (context) => const SearchPage(),
      },
      key: MyNavigatorKey.navigatorKeyMain,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (MyNavigatorKey.navigatorKeySecondary.currentState!.canPop()) {
          MyNavigatorKey.navigatorKeySecondary.currentState!.pop();
          return false;
        } else {
          return true;
        }
      },
      child: const Scaffold(
        bottomNavigationBar: MyNavBar(),
        body: MainHome(),
      ),
    );
  }
}
