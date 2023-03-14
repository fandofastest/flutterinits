
import 'package:objectbox/objectbox.dart';

@Entity()
class VideoModel {
  @Id()
  int id = 0;
  String title = 'Title';
  String channelId = 'ChannelId';
  String channelTitle= 'ChannelTitle';
  String description= 'Description';
  String videoId= 'gcj2RUWQZ60';
  String publishedAt= '2023-03-04T17:00:06Z';
  String viewCount= '1000000';
  int duration= 0;
  DateTime? recentPlayed;
  DateTime? recentliked;
  bool isfav = false;

  VideoModel.init();


  VideoModel(this.title, this.channelId, this.channelTitle, this.description, this.videoId, this.duration,this.publishedAt,this.viewCount);

  String getThumbnail(String size){
    return 'https://i.ytimg.com/vi/$videoId/$size.jpg';
  }

  void setRecentPlayed() {
    recentPlayed = DateTime.now();
  }

  void setRecentLiked() {
    recentliked = DateTime.now();
  }

 static int convertTime(String duration) {

    RegExp regex = new RegExp(r'(\d+)');
    List<String> a = regex.allMatches(duration).map((e) => e.group(0)!).toList();

    if (duration.indexOf('M') >= 0 &&
        duration.indexOf('H') == -1 &&
        duration.indexOf('S') == -1) {
      a = ["0", a[0], "0"];
    }

    if (duration.indexOf('H') >= 0 && duration.indexOf('M') == -1) {
      a = [a[0], "0", a[1]];
    }
    if (duration.indexOf('H') >= 0 &&
        duration.indexOf('M') == -1 &&
        duration.indexOf('S') == -1) {
      a = [a[0], "0", "0"];
    }

    int seconds = 0;

    if (a.length == 3) {
      seconds = seconds + int.parse(a[0]) * 3600;
      seconds = seconds + int.parse(a[1]) * 60;
      seconds = seconds + int.parse(a[2]);
    }

    if (a.length == 2) {
      seconds = seconds + int.parse(a[0]) * 60;
      seconds = seconds + int.parse(a[1]);
    }

    if (a.length == 1) {
      seconds = seconds + int.parse(a[0]);
    }
    return seconds;
  }

   String getDuration() {
    Duration duration = Duration(seconds: this.duration);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  static String printDuration(int millis) {
    Duration duration = Duration(seconds: millis);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

   String printPublishedAt() {
    DateTime now = DateTime.now();
    DateTime dateTime = DateTime.parse(publishedAt);

    if (now.difference(dateTime).inDays > 365) {
      return now.difference(dateTime).inDays ~/ 365 == 1
          ? '1 year ago'
          : '${now.difference(dateTime).inDays ~/ 365} years ago';
    } else if (now.difference(dateTime).inDays > 30) {
      return now.difference(dateTime).inDays ~/ 30 == 1
          ? '1 month ago'
          : '${now.difference(dateTime).inDays ~/ 30} months ago';
    } else if (now.difference(dateTime).inDays > 7) {
      return now.difference(dateTime).inDays ~/ 7 == 1
          ? '1 week ago'
          : '${now.difference(dateTime).inDays ~/ 7} weeks ago';
    } else if (now.difference(dateTime).inDays > 1) {
      return '${now.difference(dateTime).inDays} days ago';
    } else if (now.difference(dateTime).inHours > 1) {
      return '${now.difference(dateTime).inHours} hours ago';
    } else if (now.difference(dateTime).inMinutes > 1) {
      return '${now.difference(dateTime).inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }
  String pringViewCount() {
    if (int.parse(viewCount) > 1000000000) {
      return '${(int.parse(viewCount) / 1000000000).toStringAsFixed(1)}B';
    }
   else if (int.parse(viewCount) > 1000000) {
      return '${(int.parse(viewCount) / 1000000).toStringAsFixed(1)}M';
    } else if (int.parse(viewCount) > 1000) {
      return '${(int.parse(viewCount) / 1000).toStringAsFixed(1)}K';
    } else {
      return viewCount;
    }
  }
}



