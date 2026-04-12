import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'hero_poster_widget.dart' show HeroPosterWidget;
import 'package:flutter/material.dart';

class HeroPosterModel extends FlutterFlowModel<HeroPosterWidget> {
  ///  Local state fields for this component.

  bool isHidden = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Read Document] action in Stack widget.
  MoviesRecord? loadedMovieDoc;
  // Stores action output result for [Backend Call - Read Document] action in Stack widget.
  SeriesRecord? loadedSeriesDoc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
