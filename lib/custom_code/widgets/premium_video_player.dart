// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Pubspec dependency mein ye lazmi add karein: better_player: ^0.0.83
import 'package:better_player/better_player.dart';

class PremiumVideoPlayer extends StatefulWidget {
  const PremiumVideoPlayer({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoUrl;

  @override
  _PremiumVideoPlayerState createState() => _PremiumVideoPlayerState();
}

class _PremiumVideoPlayerState extends State<PremiumVideoPlayer> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    super.initState();

    // Player ki VIP settings (Yahan Audio aur Subtitles enable kiye gaye hain)
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: true,
      looping: false,
      fullScreenByDefault: true, // Screen automatically rotate ho jayegi
      allowedScreenSleep: false, // Video dekhte hue screen band nahi hogi
      controlsConfiguration: BetterPlayerControlsConfiguration(
        enableAudioTracks: true, // 🔥 DUAL AUDIO SUPPORT
        enableSubtitles: true, // 🔥 SUBTITLES SUPPORT
        enableQualities: true,
        enableFullscreen: true,
        enablePip: true, // Picture-in-Picture mode
        controlBarColor: Colors.black87,
        progressBarPlayedColor: Colors.red, // Netflix Red color
      ),
    );

    // Video Source setup
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
      // better_player automatically MKV/MP4 files se embedded audio/subs nikal leta hai
    );

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      backgroundColor: Colors.black, // Background hamesha black
      child: BetterPlayer(
        controller: _betterPlayerController,
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
