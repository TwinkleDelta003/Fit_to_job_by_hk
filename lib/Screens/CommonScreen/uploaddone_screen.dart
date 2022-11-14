import 'package:fit_to_job/Screens/Constant/imagePath.dart';
import 'package:flutter/material.dart';

class DoneScreen extends StatefulWidget {
  const DoneScreen({Key key}) : super(key: key);

  @override
  State<DoneScreen> createState() => _DoneScreenState();
}

class _DoneScreenState extends State<DoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      backgroundColor: const Color(0xff018F89),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/4.3,),
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundColor: const Color(0xffffffff),
              child: customAssetPath(imagePath: righttick,size: 120),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top:30.0,left: 3),
            child: Text("Your Documents are\n " "Added Succesfully!!!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 28),),
          )
        ],
      ),
    );
  }
}
