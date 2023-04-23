import 'model_pod.dart';
import 'package:flutter/material.dart';
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
    _initializeVideoPlayingFeature = _controller.initialize();
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
    primary: MyColors.greyish,
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
    primary: MyColors.greyish,
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
    FutureBuilder(future:_initializeVideoPlayingFeature,
    builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.done)
        {
          return AspectRatio(aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),);
        } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
    ),

      Column(
        children: [
          Text(
            "${widget.poddetails.title}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            "${widget.poddetails.author}",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.rss_feed,
                  color: Colors.black54,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.ios_share,
                  color: Colors.black54,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.download_for_offline,
                  color: MyColors.darkBlue,
                ),
              )
            ],
          ),
          const SizedBox(height: 12.0),
          const LinearProgressIndicator(
            color: MyColors.darkBlue,
            backgroundColor: MyColors.lightBlue,
            value: .3,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "03:23",
              ),
              Text("15:25")
            ],
          ),
        ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shuffle_rounded,
              color: Colors.black54,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black54,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!_isplaying) {
                _controller.play();
              } else {
                _controller.pause();
              }
              setState(() {
                _isplaying = !_isplaying;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: MyColors.darkBlue,
              shape: const CircleBorder(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(
                _isplaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_right,
              color: Colors.black54,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.replay,
              color: Colors.black54,
            ),
          ),
        ],
      )
    ],
    ),
        ),
        ),
    );
  }
}


