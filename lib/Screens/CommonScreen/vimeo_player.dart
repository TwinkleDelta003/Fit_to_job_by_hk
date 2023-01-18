// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';
// import 'package:vimeo_video_player/vimeo_video_player.dart';

// import '../Constant/Colorpath.dart';

// class VimeoPlayerScreen extends StatefulWidget {
//   const VimeoPlayerScreen({Key key}) : super(key: key);

//   @override
//   _VimeoPlayerScreenState createState() => _VimeoPlayerScreenState();
// }

// class _VimeoPlayerScreenState extends State<VimeoPlayerScreen> {
//   var bundleData = Get.arguments;

//   String videoLink = "";
//   String videoId = "";

//   @override
//   void initState() {
//     videoLink = bundleData[0];
//     videoId = bundleData[1];
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     /*return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: VimeoVideoPlayer(
//           vimeoPlayerModel: VimeoPlayerModel(
//             url: videoLink,
//             systemUiOverlay: const [
//               SystemUiOverlay.top,
//               SystemUiOverlay.bottom,
//             ],
//           ),
//         ),
//       ),
//     );*/

//     return Scaffold(
//       //backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: splashBGColor,
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Color(0xff018F89),
//             ),
//             onPressed: () => Get.back()),
//         title: const Padding(
//           padding: EdgeInsets.only(right: 120.0),
//           child: Text(
//             "Vimeo Screen",
//             style: TextStyle(
//                 color: Color(0xff1AA19A),
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       body: VimeoPlayer(
//         videoId: videoId,
//       ),
//     );
//   }
// }
