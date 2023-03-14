import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:music55/controller/myroute.dart';
import 'package:music55/controller/panelcontroller.dart';
import 'package:music55/navigatorkey.dart';

import '../generated/assets.dart';
import '../ui/search.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyPanelController panelController = Get.find(tag: 'panelx');
    return SafeArea(
      child: Obx(() {
        return Container(
          color: Colors.white,
          height: 65-panelController.height *65,
          child: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle( // Status bar color
              statusBarColor: Theme
                  .of(context)
                  .appBarTheme
                  .backgroundColor,
              // Status bar brightness (optional)
              statusBarIconBrightness: Brightness.dark,
              // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            title: Text('Hi, Droid Genesis', style: Theme
                .of(context)
                .textTheme
                .titleMedium,),
            backgroundColor: Theme
                .of(context)
                .appBarTheme
                .backgroundColor,
            leading: IconButton(
              onPressed: () {
                Get.changeThemeMode(
                    Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
              },
              icon: SvgPicture.asset(
                Assets.imagesBtnDrawermenu,
                color: Theme
                    .of(context)
                    .iconTheme
                    .color,
              ),
              style: Theme
                  .of(context)
                  .iconButtonTheme
                  .style,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(MyNavigatorKey.navigatorKeySecondary.currentContext!).push(MaterialPageRoute(builder: (context) => SearchPage()));
                },
                icon: SvgPicture.asset(
                  Assets.imagesBtnSearch,
                  color: Theme
                      .of(context)
                      .iconTheme
                      .color,
                ),
                style: Theme
                    .of(context)
                    .iconButtonTheme
                    .style,
              ),

            ],
            centerTitle: true,

          ),
        );
      }),
    );
  }
}
