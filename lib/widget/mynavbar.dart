import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:music55/controller/myroute.dart';

import '../generated/assets.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyRoute myRoute = Get.find();
    return SizedBox(
      height: 65,
      child: Obx(() {
        return BottomNavigationBar(
          iconSize: 26,
          elevation: 0,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.imagesIconHomeActive,
                color: Theme
                    .of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
              ),
              icon: SvgPicture.asset(
                Assets.imagesIconHome,

              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.imagesIconFeaturedActive,
                color: Theme
                    .of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
              ),
              icon: SvgPicture.asset(
                Assets.imagesIconFeatured,
              ),
              label: 'Featured',
            ),
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                Assets.imagesIconLibraryActive,
                color: Theme
                    .of(context)
                    .bottomNavigationBarTheme
                    .selectedItemColor,
              ),
              icon: SvgPicture.asset(
                Assets.imagesIconLibrary,
              ),
              label: 'Favorites',
            ),
          ],
          currentIndex: myRoute.navindex.value,
          selectedItemColor: Theme
              .of(context)
              .bottomNavigationBarTheme
              .selectedItemColor,
          unselectedItemColor: Theme
              .of(context)
              .bottomNavigationBarTheme
              .unselectedItemColor,
          backgroundColor: Theme
              .of(context)
              .bottomNavigationBarTheme
              .backgroundColor,

          onTap: (index) {
            print(index);
            myRoute.changeNavIndex(index);
          },
        );
      }),
    );
  }
}
