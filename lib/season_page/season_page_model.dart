import '/components/description_widget_widget.dart';
import '/components/i_m_d_b_ratings_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'season_page_widget.dart' show SeasonPageWidget;
import 'package:flutter/material.dart';

class SeasonPageModel extends FlutterFlowModel<SeasonPageWidget> {
  ///  Local state fields for this page.

  int selectedSeason = 1;

  bool isExpanded = false;

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
  // State field(s) for SeasonSelector widget.
  String? seasonSelectorValue;
  FormFieldController<String>? seasonSelectorValueController;

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
