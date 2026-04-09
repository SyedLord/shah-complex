import '/components/description_widget_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'season_page_widget.dart' show SeasonPageWidget;
import 'package:flutter/material.dart';

class SeasonPageModel extends FlutterFlowModel<SeasonPageWidget> {
  ///  Local state fields for this page.

  int selectedSeason = 1;

  bool isExpanded = false;

  ///  State fields for stateful widgets in this page.

  // Model for DescriptionWidget component.
  late DescriptionWidgetModel descriptionWidgetModel;
  // State field(s) for SeasonSelector widget.
  String? seasonSelectorValue;
  FormFieldController<String>? seasonSelectorValueController;

  @override
  void initState(BuildContext context) {
    descriptionWidgetModel =
        createModel(context, () => DescriptionWidgetModel());
  }

  @override
  void dispose() {
    descriptionWidgetModel.dispose();
  }
}
