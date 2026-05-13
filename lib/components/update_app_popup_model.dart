import '/components/button2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'update_app_popup_widget.dart' show UpdateAppPopupWidget;
import 'package:flutter/material.dart';

class UpdateAppPopupModel extends FlutterFlowModel<UpdateAppPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Button.
  late Button2Model buttonModel1;
  // Model for Button.
  late Button2Model buttonModel2;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => Button2Model());
    buttonModel2 = createModel(context, () => Button2Model());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
