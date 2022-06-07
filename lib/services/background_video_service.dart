import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoService extends StatefulWidget {
  const BackgroundVideoService({Key? key, required this.videoAssetName})
      : super(key: key);

  final String videoAssetName;

  @override
  State<BackgroundVideoService> createState() => _BackgroundVideoServiceState();
}

class _BackgroundVideoServiceState extends State<BackgroundVideoService> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller = VideoPlayerController.asset(widget.videoAssetName)
      ..initialize().then((_) {
        // Once the video has been loaded we play the video and set looping to true.
        _controller.play();
        _controller.setLooping(true);
        // Ensure the first frame is shown after the video is initialized.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _controller.value.size.width,
      height: _controller.value.size.height,
      child: VideoPlayer(_controller),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
