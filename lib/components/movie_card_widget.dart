import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'movie_card_model.dart';
export 'movie_card_model.dart';

class MovieCardWidget extends StatefulWidget {
  const MovieCardWidget({
    super.key,
    this.img,
    this.movieDoc,
  });

  final String? img;
  final MoviesRecord? movieDoc;

  @override
  State<MovieCardWidget> createState() => _MovieCardWidgetState();
}

class _MovieCardWidgetState extends State<MovieCardWidget> {
  late MovieCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MovieCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: 120.0,
          height: 180.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            children: [
              CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 0),
                fadeOutDuration: Duration(milliseconds: 0),
                imageUrl: widget.movieDoc!.posterImage,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
