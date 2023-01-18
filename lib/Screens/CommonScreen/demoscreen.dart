import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../Constant/snackbar.dart';
class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = const Color.fromARGB(132, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.0009250,size.height*1.0004714);
    path0.lineTo(0,size.height*0.3025571);
    path0.quadraticBezierTo(size.width*0.2237750,size.height*0.5817143,size.width*0.5666167,size.height*0.5584857);
    path0.cubicTo(size.width*0.7560583,size.height*0.5153714,size.width*0.8463417,size.height*0.3581857,size.width*0.8970333,size.height*0.2623429);
    path0.cubicTo(size.width*0.9391917,size.height*0.1882571,size.width*0.9779583,size.height*0.0761571,size.width,size.height*0.0516143);
    path0.quadraticBezierTo(size.width*1.0037000,size.height*0.2827714,size.width*1.0009250,size.height*1.0015857);
    path0.lineTo(size.width*0.0009250,size.height*1.0015857);

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class RPSCustomPainter1 extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = const Color.fromARGB(132, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.0009250,size.height*1.0004714);
    path0.lineTo(0,size.height*0.3025571);
    path0.quadraticBezierTo(size.width*0.2228500,size.height*0.6118429,size.width*0.5656917,size.height*0.5886143);
    path0.cubicTo(size.width*0.7551333,size.height*0.5455000,size.width*0.8463417,size.height*0.3581857,size.width*0.8970333,size.height*0.2623429);
    path0.cubicTo(size.width*0.9401167,size.height*0.1676429,size.width*0.9779583,size.height*0.0761571,size.width,size.height*0.0516143);
    path0.quadraticBezierTo(size.width*1.0037000,size.height*0.2827714,size.width*1.0009250,size.height*1.0015857);
    path0.lineTo(size.width*0.0009250,size.height*1.0015857);

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class InterviewUpload extends StatefulWidget {
  const InterviewUpload({Key key}) : super(key: key);

  @override
  State<InterviewUpload> createState() => _InterviewUploadState();
}

class _InterviewUploadState extends State<InterviewUpload> {
  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              child: Stack(
            children: [
              CustomPaint(
                size: Size(
                    WIDTH,
                    (WIDTH * 0.5)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              ),
              CustomPaint(
                size: Size(
                    WIDTH,
                    (WIDTH * 0.5833333333333334)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter1(),
              ),
            ],
          ))
        ],
      )),
    );
  }
}
  // ! All File and Image Functions are Calling here
