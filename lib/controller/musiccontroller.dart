import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../model/videomodel.dart';
import '../provider/objectbox.dart';
import 'panelcontroller.dart';


class MusicController  extends GetxController {

  var listvideoModel = List<VideoModel>.empty(growable: true).obs;
  var currentposition = 0.obs;
  var currentsecond = 0.0.obs;
  var repeat = false.obs;
  var shuffle = false.obs;
  var state = PlayerState.unStarted.obs;

   var sleeptimer = Duration(seconds: 0);
   var sleeptimerseconds = 0.0.obs;
  static Timer? countdownTimer;



  Rx<YoutubePlayerController>controller = YoutubePlayerController(
    params: const YoutubePlayerParams(
      mute: false,
      showControls: false,
      showFullscreenButton: false,

    ),
  ).obs;




  VideoModel get currentvideo => listvideoModel[currentposition.value];

  void toggleMusic() {
    if (controller.value.value.playerState == PlayerState.playing) {
      controller.value.pauseVideo();
    } else {
      controller.value.playVideo();
    }
  }


  void load(String videoId) {
    controller.value.loadVideo("https://www.youtube.com/watch?v=$videoId");
  }


  YoutubePlayerController mylistener() {
    controller.value.videoStateStream.listen((event) {
      currentsecond.value = event.position.inSeconds.toDouble();
      print(event.position.inSeconds);
    });

    controller.value.listen((event) {
      print('state: ${event.playerState}');
        state.value = controller.value.value.playerState;
        if (state.value == PlayerState.ended && repeat.value) {
          controller.value.loadVideo(listvideoModel[currentposition.value].videoId);
        }
        if (state.value == PlayerState.buffering) {
          MyPanelController myPanelController = Get.find(tag: 'panelx');
            myPanelController.panelController.value.open();

        }
    });
       return controller.value;
  }


  void seeksto(double second) {
    // controller.value.seekTo(Duration(seconds: second.toInt()));
    currentsecond.value = second;
    controller.value.seekTo(seconds: second,allowSeekAhead: true);


  }

  Future<void> stop() async {
   await controller.value.stopVideo();
    // state.value = PlayerState.unStarted;
  }


  void toggleRepeat() {
    repeat.value = !repeat.value;
  }
  void toggleShuffle() {
    shuffle.value = !shuffle.value;
  }

  void next() {
    if (currentposition.value < listvideoModel.length - 1 && !shuffle.value && !repeat.value) {
      currentposition.value++;
      load(listvideoModel[currentposition.value].videoId);
      ObjectBox.updaterecent(listvideoModel[currentposition.value]);
    }

    else if (repeat.value) {
      load(listvideoModel[currentposition.value].videoId);
      ObjectBox.updaterecent(listvideoModel[currentposition.value]);
    }
    else if(shuffle.value){
      currentposition.value = Random().nextInt(listvideoModel.length);
      load(listvideoModel[currentposition.value].videoId);
      ObjectBox.updaterecent(listvideoModel[currentposition.value]);
    }
  }

  void previous() {
    if (currentposition.value > 0 && !shuffle.value && !repeat.value) {
      currentposition.value--;
      load(listvideoModel[currentposition.value].videoId);
      ObjectBox.updaterecent(listvideoModel[currentposition.value]);
    }

    else if (repeat.value) {
      load(listvideoModel[currentposition.value].videoId);
      ObjectBox.updaterecent(listvideoModel[currentposition.value]);
    }

    else if(shuffle.value){
      currentposition.value = Random().nextInt(listvideoModel.length);
      load(listvideoModel[currentposition.value].videoId);
      ObjectBox.updaterecent(listvideoModel[currentposition.value]);
    }
  }


  void play(List<VideoModel> listvideoModel, int currentposition) {
    this.listvideoModel.clear();
    this.listvideoModel.addAll(listvideoModel);
    load(listvideoModel[currentposition].videoId);
    this.currentposition.value = currentposition;
    ObjectBox.updaterecent(listvideoModel[currentposition]);

    // controller.play();


  }

  void playoldlist(int index) {
    load(listvideoModel[index].videoId);
  }
   void setSleepTimer(Duration duration) {
    countdownTimer?.cancel();
    sleeptimer = duration;
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) {
          if (sleeptimer.inSeconds > 0) {
            sleeptimer = sleeptimer - const Duration(seconds: 1);
            print(sleeptimer.inSeconds);
          }
          else {
            stop();
            countdownTimer!.cancel();
          }
        });
  }

   Stream<Duration> getSleepTimerStream() {
    return Stream.periodic(Duration(microseconds:1 ), (x) => sleeptimer);
  }

}