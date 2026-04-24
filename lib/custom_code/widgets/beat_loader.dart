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

import 'package:loading_animation_widget/loading_animation_widget.dart';

class BeatLoader extends StatefulWidget {
  const BeatLoader({
    super.key,
    this.width,
    this.height,
    required this.size,
    required this.color,
  });

  final double? width;
  final double? height;
  final double size;
  final Color color;

  @override
  State<BeatLoader> createState() => _BeatLoaderState();
}

class _BeatLoaderState extends State<BeatLoader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: LoadingAnimationWidget.beat(
        color: widget.color,
        size: widget.size,
      ),
    );
  }
}
