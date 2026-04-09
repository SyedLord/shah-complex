import '/backend/backend.dart';
import '/components/section_header_search_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'search_screen_widget.dart' show SearchScreenWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SearchScreenModel extends FlutterFlowModel<SearchScreenWidget> {
  ///  Local state fields for this page.

  bool isSearch = false;

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

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in SearchScreen widget.
  List<MoviesRecord>? loadedMovies;
  // Stores action output result for [Firestore Query - Query a collection] action in SearchScreen widget.
  List<SeriesRecord>? loadedSeries;
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Stores action output result for [Custom Action - vipSmartSearch] action in SearchField widget.
  List<MoviesRecord>? outMovies;
  // Stores action output result for [Custom Action - vipSmartSearchSeries] action in SearchField widget.
  List<SeriesRecord>? outSeries;
  // Model for section_headerSearch component.
  late SectionHeaderSearchModel sectionHeaderSearchModel1;
  // Model for section_headerSearch component.
  late SectionHeaderSearchModel sectionHeaderSearchModel2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {
    sectionHeaderSearchModel1 =
        createModel(context, () => SectionHeaderSearchModel());
    sectionHeaderSearchModel2 =
        createModel(context, () => SectionHeaderSearchModel());
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    sectionHeaderSearchModel1.dispose();
    sectionHeaderSearchModel2.dispose();
    expandableExpandableController.dispose();
  }
}
