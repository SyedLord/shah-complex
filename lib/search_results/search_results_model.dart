import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_results_widget.dart' show SearchResultsWidget;
import 'package:flutter/material.dart';

class SearchResultsModel extends FlutterFlowModel<SearchResultsWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
