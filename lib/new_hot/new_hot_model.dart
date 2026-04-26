import '/backend/backend.dart';
import '/components/bottom_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'new_hot_widget.dart' show NewHotWidget;
import 'package:flutter/material.dart';

class NewHotModel extends FlutterFlowModel<NewHotWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in TrendingNewsCard widget.
  MoviesRecord? movieRef;
  // Stores action output result for [Backend Call - Read Document] action in TrendingNewsCard widget.
  SeriesRecord? seriesRef;
  // Stores action output result for [Backend Call - Read Document] action in UpcomingItem widget.
  MoviesRecord? movieRef1;
  // Stores action output result for [Backend Call - Read Document] action in UpcomingItem widget.
  SeriesRecord? seriesRef1;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    bottomNavBarModel.dispose();
  }
}
