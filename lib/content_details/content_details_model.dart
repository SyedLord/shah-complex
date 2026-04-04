import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'content_details_widget.dart' show ContentDetailsWidget;
import 'package:flutter/material.dart';

class ContentDetailsModel extends FlutterFlowModel<ContentDetailsWidget> {
  ///  Local state fields for this page.

  int currentSeason = 1;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SeasonSelector widget.
  String? seasonSelectorValue;
  FormFieldController<String>? seasonSelectorValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
