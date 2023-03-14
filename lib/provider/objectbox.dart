import 'dart:async';
import 'package:get/get.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

import '../model/videomodel.dart';
import '../objectbox.g.dart';
class ObjectBox {
  static late ObjectBox objectbox;
  late final Store store;
  late final Box<VideoModel> songBox;
  late final Stream<Query<VideoModel>> songsStream;
  ObjectBox._Create(this.store){
    songBox = Box<VideoModel>(store);
  }
  //
  // static Future<ObjectBox> create() async {
  //   final store = await openStore();
  //   return ObjectBox._Create(store);
  // }


  static Future<ObjectBox> create()  async {
    var path = await getApplicationDocumentsDirectory();
    if(Store.isOpen(path.path)){
      // applicable when store is from other isolate
      return ObjectBox._Create(Store.attach(getObjectBoxModel(), path.path));
    }

    final store =await openStore(directory: path.path);
    return  ObjectBox._Create(store);

  }



  static void updaterecent(VideoModel songModel) {
    Query<VideoModel> query = objectbox.songBox.query(VideoModel_.id.equals(songModel.id)).build();
    VideoModel? sm= query.findFirst();
    // print(sm?.title);

    if(sm==null){
      // print("test: ");
      songModel.setRecentPlayed();
      ObjectBox.objectbox.songBox.put(songModel);
    }
    else {
      sm.setRecentPlayed();
      ObjectBox.objectbox.songBox.put(sm);
    }
  }



  static void setFav(VideoModel songModel, bool isfav) {
    Query<VideoModel> query = objectbox.songBox.query(VideoModel_.id.equals(songModel.id)).build();
    VideoModel? sm= query.findFirst();
    // print(sm?.title);

    if(sm==null){
      // print("test: ");
      songModel.isfav = isfav;
      songModel.setRecentLiked();
      ObjectBox.objectbox.songBox.put(songModel);
    }
    else {
      sm.isfav = isfav;
      sm.setRecentLiked();
      ObjectBox.objectbox.songBox.put(sm);
    }
  }



  static Stream<List<VideoModel>> getAllSongs()  {
    late final Stream<Query<VideoModel>> stream;
      final qBuilder = objectbox.songBox.query().order(VideoModel_.recentPlayed, flags: Order.descending);
      stream = qBuilder.watch(triggerImmediately: true);
     return stream.map((query) => query.find());
  }

  static Stream<List<VideoModel>> getLiked()  {
    late final Stream<Query<VideoModel>> stream;
    final qBuilder = objectbox.songBox.query(VideoModel_.isfav.equals(true)).order(VideoModel_.recentliked, flags: Order.descending);
    stream = qBuilder.watch(triggerImmediately: true);
    Stream<List<VideoModel>> streamdata = stream.map((query) => query.find());
    return streamdata;
  }


  static Stream<bool> isFav(VideoModel songModel)  {
    late final Stream<Query<VideoModel>> stream;
    final qBuilder = objectbox.songBox.query(VideoModel_.id.equals(songModel.id));
    // print(sm?.title);
    stream = qBuilder.watch(triggerImmediately: true);

    return stream.map((query) => query.findFirst()?.isfav??false);

  }



}