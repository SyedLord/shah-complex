import '/backend/backend.dart';
import '/components/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  List<MoviesRecord> searchResultMovies = [];
  void addToSearchResultMovies(MoviesRecord item) =>
      searchResultMovies.add(item);
  void removeFromSearchResultMovies(MoviesRecord item) =>
      searchResultMovies.remove(item);
  void removeAtIndexFromSearchResultMovies(int index) =>
      searchResultMovies.removeAt(index);
  void insertAtIndexInSearchResultMovies(int index, MoviesRecord item) =>
      searchResultMovies.insert(index, item);
  void updateSearchResultMoviesAtIndex(
          int index, Function(MoviesRecord) updateFn) =>
      searchResultMovies[index] = updateFn(searchResultMovies[index]);

  List<SeriesRecord> searchResultSeries = [];
  void addToSearchResultSeries(SeriesRecord item) =>
      searchResultSeries.add(item);
  void removeFromSearchResultSeries(SeriesRecord item) =>
      searchResultSeries.remove(item);
  void removeAtIndexFromSearchResultSeries(int index) =>
      searchResultSeries.removeAt(index);
  void insertAtIndexInSearchResultSeries(int index, SeriesRecord item) =>
      searchResultSeries.insert(index, item);
  void updateSearchResultSeriesAtIndex(
          int index, Function(SeriesRecord) updateFn) =>
      searchResultSeries[index] = updateFn(searchResultSeries[index]);

  int tabIndex = 0;

  bool isHidden = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - vipSmartSearch] action in TextField widget.
  List<MoviesRecord>? loadedMovies;
  // Stores action output result for [Custom Action - vipSmartSearchSeries] action in TextField widget.
  List<SeriesRecord>? loadedSeries;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    bottomNavBarModel.dispose();
  }
}
