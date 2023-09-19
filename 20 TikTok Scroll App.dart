import 'dart:html';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

// <uses-permission android:name="android.permission.INTERNET"/>
// video_player: ^2.7.2

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LPageView()
      ) ,
    );
  }
}




class LPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
          color: Colors.yellow,
          child: Center(
            child: VideoPlayerScreen(url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",)
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Center(
              child: VideoPlayerScreen(url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",)
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Center(
              child: VideoPlayerScreen(url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",)
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Center(
              child: VideoPlayerScreen(url: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",)
          ),
        ),



      ],
    );
  }
}




class VideoPlayerScreen extends StatefulWidget {

  late String url = "";

  VideoPlayerScreen({required String this.url}){

  }


  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState(url);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  late String url = "";
  _VideoPlayerScreenState(String url){
    this.url = url;
  }

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(url),
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Butterfly Video'),
      ),

      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.

            return Container(
              color: Colors.black,
              child: Stack(
                alignment: Alignment.bottomCenter,
                  children:[

                VideoPlayer(_controller),
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  color: Colors.white54,
                  width: 60,
                  height: 60,
                  child: MaterialButton(
                    onPressed: () {
                      // Wrap the play or pause in a call to `setState`. This ensures the
                      // correct icon is shown.
                      setState(() {
                        // If the video is playing, pause it.
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          // If the video is paused, play it.
                          _controller.play();
                        }
                      });
                    },
                    // Display the correct icon depending on the state of the player.
                    child: Icon(
                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                ),



              ] )
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

    );
  }
}

