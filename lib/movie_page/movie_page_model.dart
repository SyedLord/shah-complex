import '/components/description_widget_widget.dart';
import '/components/i_m_d_b_ratings_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'movie_page_widget.dart' show MoviePageWidget;
import 'package:flutter/material.dart';

class MoviePageModel extends FlutterFlowModel<MoviePageWidget> {
  ///  Local state fields for this page.

  int tabIndex = 0;

  ///  State fields for stateful widgets in this page.

  // Model for IMDBRatings component.
  late IMDBRatingsModel iMDBRatingsModel;
  // Model for DescriptionWidget component.
  late DescriptionWidgetModel descriptionWidgetModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {
    iMDBRatingsModel = createModel(context, () => IMDBRatingsModel());
    descriptionWidgetModel =
        createModel(context, () => DescriptionWidgetModel());
  }

  @override
  void dispose() {
    iMDBRatingsModel.dispose();
    descriptionWidgetModel.dispose();
  }
}
