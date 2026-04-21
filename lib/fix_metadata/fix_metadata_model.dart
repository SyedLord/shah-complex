import '/flutter_flow/flutter_flow_util.dart';
import 'fix_metadata_widget.dart' show FixMetadataWidget;
import 'package:flutter/material.dart';

class FixMetadataModel extends FlutterFlowModel<FixMetadataWidget> {
  ///  Local state fields for this page.

  String? previewTitle;

  String? previewPoster;

  dynamic apiFullData;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - fetchTmdbMetadata] action in Button widget.
  dynamic apiResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
