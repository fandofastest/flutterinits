import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'controller/musiccontroller.dart';
import 'controller/myroute.dart';
import 'controller/panelcontroller.dart';
import 'navigatorkey.dart';
import 'ui/player.dart';

class MainHome extends StatelessWidget {
  const MainHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    MyPanelController panelController =
        Get.put(MyPanelController(), tag: 'panelx');
    MusicController musicController = Get.put(MusicController(), tag: 'musicx');
    return Column(
      children: [
        Expanded(
          child: SlidingUpPanel(

            defaultPanelState: PanelState.CLOSED,
            controller: panelController.panelController.value,
            onPanelSlide: (double pos) {
              panelController.onPanelSlide(pos);
            },
            maxHeight: MediaQuery.of(context).size.height,
            minHeight: musicController.state.value != PlayerState.playing &&
                    musicController.state.value != PlayerState.paused
                ? 65
                : 65,
            panel: const SafeArea(
              top: false,
              child: Player(),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Navigator(
                    key: MyNavigatorKey.navigatorKeySecondary,
                    initialRoute: '/',
                    /// Starting route from the onGenerateRoute map

                    onGenerateRoute: (routeSettings) {
                      /// Generate the route we want
                      return MaterialPageRoute(
                          builder: (context) =>
                              MyRoute.secondaryrouteBuilders(context)[routeSettings.name]!(context));
                    },
                  ),
                ),
                const SizedBox(
                  height: 130,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
