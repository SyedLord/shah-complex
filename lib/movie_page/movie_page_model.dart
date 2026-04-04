import '/components/movie_card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'movie_page_widget.dart' show MoviePageWidget;
import 'package:flutter/material.dart';

class MoviePageModel extends FlutterFlowModel<MoviePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getOneDriveDirectLink] action in PlayBtn widget.
  String? oneDriveLink;
  // Model for MovieCard2 component.
  late MovieCard2Model movieCard2Model1;
  // Model for MovieCard2 component.
  late MovieCard2Model movieCard2Model2;
  // Model for MovieCard2 component.
  late MovieCard2Model movieCard2Model3;
  // Model for MovieCard2 component.
  late MovieCard2Model movieCard2Model4;
  // Model for MovieCard2 component.
  late MovieCard2Model movieCard2Model5;
  // Model for MovieCard2 component.
  late MovieCard2Model movieCard2Model6;
  // Model for MovieCard2 component.
  late MovieCard2Model movieCard2Model7;
  // Model for MovieCard2 component.
  late MovieCard2Model movieCard2Model8;
  // Model for MovieCard2 component.
  late MovieCard2Model movieCard2Model9;

  @override
  void initState(BuildContext context) {
    movieCard2Model1 = createModel(context, () => MovieCard2Model());
    movieCard2Model2 = createModel(context, () => MovieCard2Model());
    movieCard2Model3 = createModel(context, () => MovieCard2Model());
    movieCard2Model4 = createModel(context, () => MovieCard2Model());
    movieCard2Model5 = createModel(context, () => MovieCard2Model());
    movieCard2Model6 = createModel(context, () => MovieCard2Model());
    movieCard2Model7 = createModel(context, () => MovieCard2Model());
    movieCard2Model8 = createModel(context, () => MovieCard2Model());
    movieCard2Model9 = createModel(context, () => MovieCard2Model());
  }

  @override
  void dispose() {
    movieCard2Model1.dispose();
    movieCard2Model2.dispose();
    movieCard2Model3.dispose();
    movieCard2Model4.dispose();
    movieCard2Model5.dispose();
    movieCard2Model6.dispose();
    movieCard2Model7.dispose();
    movieCard2Model8.dispose();
    movieCard2Model9.dispose();
  }
}
