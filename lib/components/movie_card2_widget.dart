import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'movie_card2_model.dart';
export 'movie_card2_model.dart';

class MovieCard2Widget extends StatefulWidget {
  const MovieCard2Widget({
    super.key,
    this.img,
  });

  final String? img;

  @override
  State<MovieCard2Widget> createState() => _MovieCard2WidgetState();
}

class _MovieCard2WidgetState extends State<MovieCard2Widget> {
  late MovieCard2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieCard2Model());
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
      child: ClipRRect(
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
                imageUrl: valueOrDefault<String>(
                  widget.img,
                  'https://dimg.dreamflow.cloud/v1/image/Interstellar%20movie%20poster',
                ),
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
