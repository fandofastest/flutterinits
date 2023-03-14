import 'dart:convert';



import '../config.dart';
import '../model/videomodel.dart';
import 'package:http/http.dart' as http;

class MyYoutubeApi{

  static String apiKey=Config.apiKey;
  static String baseurl = "https://www.googleapis.com/youtube/v3/";
  static String videodetailurl = baseurl + "videos?part=snippet%2CcontentDetails%2Cstatistics&key=$apiKey";
  static String trending = baseurl + "videos?videoCategoryId=10&maxResults=25&part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&key=$apiKey&regionCode=";
  static String search = baseurl + "search?part=snippet&maxResults=25&key=$apiKey";


 static Future<VideoModel> getVideoDetail(String videoId) async{
    final response = await http.get(Uri.parse("$videodetailurl&id=$videoId"));
    print(Uri.parse("$videodetailurl&id=$videoId"));
    final extractedData = json.decode(response.body)['items'][0] as Map<String,dynamic>;

    VideoModel videoModel =VideoModel(extractedData['snippet']['title'], extractedData['snippet']['channelId'],extractedData['snippet']['channelTitle'], extractedData['snippet']['description'], extractedData['id'], VideoModel.convertTime(extractedData['contentDetails']['duration']), extractedData['snippet']['publishedAt'], extractedData['statistics']['viewCount']);


    print(videoModel.duration);

    return videoModel;
  }

  static Future<List<VideoModel>> getVideoListKeywords(String q) async{
    final response = await http.get(Uri.parse("$search&q=$q"));
    print(Uri.parse("$search&q=$q"));
    final extractedData = json.decode(response.body)['items'] as List<dynamic>;
    List<VideoModel> videoList = [];

    for (var element in extractedData) {
      try {

       await getVideoDetail(element['id']['videoId']).then((value) => videoList.add(value));

      }
      catch(e) {
        print(e.toString());
      }
    }


    return videoList;

  }

  static Future<List<VideoModel>> getVideoListTrending(String reqion) async{
    final response = await http.get(Uri.parse("$trending&regionCode=$reqion"));
    print(Uri.parse("$trending&regionCode=$reqion"));
    final extractedData = json.decode(response.body)['items'] as List<dynamic>;
    List<VideoModel> videoList = [];

    for (var element in extractedData) {
      try {

        await getVideoDetail(element['id']).then((value) => videoList.add(value));

      }
      catch(e) {
        print(e.toString());
      }
    }

    print(videoList.length);


   // myController.onloadcomplete(videoList[0]);

    return videoList;

  }



  static Future<List<VideoModel>> getVideoFromJson () async {
    List<VideoModel> videoList = [];
    final response = await http.get(Uri.parse(Config.jsonurl));
    final extractedData = json.decode(response.body)['videos'] as List<dynamic>;

    for (var element in extractedData) {
      try {
        await getVideoDetail(parseVideoId(element)).then((value) =>
            videoList.add(value));
        // print(videoList[0].title);
      }
      catch (e) {
        print(e.toString());
      }
    }

    return videoList;
  }

 static String parseVideoId(String url) {
    RegExp regExp = RegExp(
        r"^(?:https?:)?(?:\/\/)?(?:www\.)?(?:m\.)?(?:youtube\.com|youtu\.?be)\/(?:watch\?v=)?([^\s&]+)");
    return regExp.firstMatch(url)![1]!;
  }
}