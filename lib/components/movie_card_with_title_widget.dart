import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'movie_card_with_title_model.dart';
export 'movie_card_with_title_model.dart';

class MovieCardWithTitleWidget extends StatefulWidget {
  const MovieCardWithTitleWidget({super.key});

  @override
  State<MovieCardWithTitleWidget> createState() =>
      _MovieCardWithTitleWidgetState();
}

class _MovieCardWithTitleWidgetState extends State<MovieCardWithTitleWidget> {
  late MovieCardWithTitleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieCardWithTitleModel());
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
