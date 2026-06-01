import '/components/code_expired_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'component_widget.dart' show ComponentWidget;
import 'package:flutter/material.dart';

class ComponentModel extends FlutterFlowModel<ComponentWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CodeExpiredPopUp component.
  late CodeExpiredPopUpModel codeExpiredPopUpModel;

  @override
  void initState(BuildContext context) {
    codeExpiredPopUpModel = createModel(context, () => CodeExpiredPopUpModel());
  }

  @override
  void dispose() {
    codeExpiredPopUpModel.dispose();
  }
}
