import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practice_app/Screens/welcome_screen.dart';
import 'package:practice_app/main.dart';
import 'package:video_player/video_player.dart';
class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen(),
      ));

    });
    _controller = VideoPlayerController.asset(
      'assets/images/Doc.mp4'
    )
     ..initialize().then((_){
      setState(() {});
    })
    ..setVolume(0.0);
    _playVideo();
  }
  void _playVideo() async{
    _controller.play();
    await Future.delayed(const Duration(seconds: 10));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(
              _controller,
            ) ,
        )
            : Container(),
      ),
    );
  }
}