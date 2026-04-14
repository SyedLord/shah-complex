import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'movie_card_with_title4_model.dart';
export 'movie_card_with_title4_model.dart';

class MovieCardWithTitle4Widget extends StatefulWidget {
  const MovieCardWithTitle4Widget({super.key});

  @override
  State<MovieCardWithTitle4Widget> createState() =>
      _MovieCardWithTitle4WidgetState();
}

class _MovieCardWithTitle4WidgetState extends State<MovieCardWithTitle4Widget> {
  late MovieCardWithTitle4Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieCardWithTitle4Model());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          0.0, 0.0, FlutterFlowTheme.of(context).designToken.spacing.md, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                FlutterFlowTheme.of(context).designToken.radius.md),
            child: Container(
              width: 120.0,
              height: 180.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    FlutterFlowTheme.of(context).designToken.radius.md),
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 0),
                    fadeOutDuration: Duration(milliseconds: 0),
                    imageUrl:
                        'https://dimg.dreamflow.cloud/v1/image/%24title%20movie%20poster',
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ].divide(SizedBox(
            height: FlutterFlowTheme.of(context).designToken.spacing.sm)),
      ),
    );
  }
}
