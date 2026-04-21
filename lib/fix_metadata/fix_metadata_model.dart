import '/components/movie_card_widget.dart';
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
  // Model for movie_card component.
  late MovieCardModel movieCardModel;
  // Stores action output result for [Custom Action - fetchTmdbMetadata] action in Button widget.
  dynamic apiResult;

  @override
  void initState(BuildContext context) {
    movieCardModel = createModel(context, () => MovieCardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    movieCardModel.dispose();
  }
}
