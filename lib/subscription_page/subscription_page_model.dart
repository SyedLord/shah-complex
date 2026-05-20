import '/backend/api_requests/api_calls.dart';
import '/components/button7_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subscription_page_widget.dart' show SubscriptionPageWidget;
import 'package:flutter/material.dart';

class SubscriptionPageModel extends FlutterFlowModel<SubscriptionPageWidget> {
  ///  Local state fields for this page.

  bool isVisible = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (InitSafepayPayment)] action in Button widget.
  ApiCallResponse? apiResult;
  // Model for Button.
  late Button7Model buttonModel1;
  // Model for Button.
  late Button7Model buttonModel2;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => Button7Model());
    buttonModel2 = createModel(context, () => Button7Model());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
