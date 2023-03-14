
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/myroute.dart';
import '../widget/myappbar.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    MyRoute myRoute = Get.put(MyRoute());
    return Column(
      children: [
        const MyAppBar(),
        Expanded(
          child: PageView(
            controller: myRoute.pageController.value,
            onPageChanged: (int index) {
              myRoute.changeNavIndex(index);
            },
            children: [
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
              Container(
                color: Colors.green,
              ),

            ],
          ),
        ),
      ],
    );
  }
}
