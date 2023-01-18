import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';

class YoutubePlayerScreen extends StatefulWidget {
  @override
  _YoutubePlayerScreenState createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
  VideoPlayerController playerController;
  VoidCallback listener;
  FlickManager flickManager;
  var data = Get.arguments;


  ////// For Youtube  
  // YoutubePlayerController _controller = YoutubePlayerController(
  //   initialVideoId: 'iLnmTe5Q2Qw',
  //   flags: YoutubePlayerFlags(
  //     autoPlay: true,
  //     mute: true,
  //   ),
  // );

  @override
  void initState() {
    print(data[0]);
    print(data[1]);
    print(data[2]);

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          'https://www.youtube.com/watch?v=BBAyRBTfsOU'

          // "https://www.youtube.com/watch?v=MZtPZd5Lw84"
          ),
    );

    super.initState();
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VimeoVideoPlayer(
      vimeoPlayerModel: VimeoPlayerModel(
        url: data[0],
      ),
    );
    //// This is for All Video Type But Its gives me Playback Error while Playing Video in app////// 
          // FlickVideoPlayer(
          //   flickManager: flickManager,
          // )
    
  }
}
