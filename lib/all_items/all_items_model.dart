import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_items_widget.dart' show AllItemsWidget;
import 'package:flutter/material.dart';

class AllItemsModel extends FlutterFlowModel<AllItemsWidget> {
  ///  Local state fields for this page.

  List<MoviesRecord> filteredMoviesList = [];
  void addToFilteredMoviesList(MoviesRecord item) =>
      filteredMoviesList.add(item);
  void removeFromFilteredMoviesList(MoviesRecord item) =>
      filteredMoviesList.remove(item);
  void removeAtIndexFromFilteredMoviesList(int index) =>
      filteredMoviesList.removeAt(index);
  void insertAtIndexInFilteredMoviesList(int index, MoviesRecord item) =>
      filteredMoviesList.insert(index, item);
  void updateFilteredMoviesListAtIndex(
          int index, Function(MoviesRecord) updateFn) =>
      filteredMoviesList[index] = updateFn(filteredMoviesList[index]);

  bool isSearch = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in LatestUpdateCard widget.
  MoviesRecord? movieRef1;
  // Stores action output result for [Backend Call - Read Document] action in LatestUpdateCard widget.
  SeriesRecord? seriesRef1;
  // Stores action output result for [Backend Call - Read Document] action in LatestUpdateCard widget.
  EpisodesRecord? episodeDoc1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
