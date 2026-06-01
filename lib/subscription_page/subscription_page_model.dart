import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subscription_page_widget.dart' show SubscriptionPageWidget;
import 'package:flutter/material.dart';

class SubscriptionPageModel extends FlutterFlowModel<SubscriptionPageWidget> {
  ///  Local state fields for this page.

  bool isVisible = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for CodeInput widget.
  FocusNode? codeInputFocusNode;
  TextEditingController? codeInputTextController;
  String? Function(BuildContext, String?)? codeInputTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    codeInputFocusNode?.dispose();
    codeInputTextController?.dispose();
  }
}
