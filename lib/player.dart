import 'model_pod.dart';
import  'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'global.dart';

class playerscreen extends StatefulWidget {
  final model poddetails;
  const playerscreen({Key? key,required this.poddetails}) : super(key: key);

  @override
  State<playerscreen> createState() => _playerscreenState();
}

class _playerscreenState extends State<playerscreen> {
  bool  _isplaying=false;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayingFeature;
  @override
  void initState(){
    _controller=VideoPlayerController.network('https://stream.mux.com/${widget.poddetails.playbackid}.m3u8');
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }
  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Padding(
        padding: const EdgeInsets.all(18.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    SizedBox(
    width: 50,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    alignment: Alignment.center,
    padding: EdgeInsets.zero,
    backgroundColor: MyColors.greyish,
    ),
    onPressed: () => Navigator.of(context).pop(),
    child: const Icon(
    Icons.chevron_left,
    color: Colors.black54,
    ),
    ),
    ),
    Text(
    "Now Playing",
    style: Theme.of(context).textTheme.titleLarge,
    ),
    SizedBox(
    width: 50,
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    alignment: Alignment.center,
    padding: EdgeInsets.zero,
    backgroundColor: MyColors.greyish,
    ),
    onPressed: () {},
    child: const Icon(
    Icons.keyboard_control,
    color: Colors.black54,
    ),
    ),
    )
    ],
    ),

    //  New Section
    const SizedBox(height: 24.0),
    FutureBuilder(future: _intializeVideoPlayerFuture,
    builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.done)
        {
          return AspectRatio(aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),);
        }
    }),


  }
}
