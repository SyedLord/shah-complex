import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'subscription_page_widget.dart' show SubscriptionPageWidget;
import 'package:flutter/material.dart';

class SubscriptionPageModel extends FlutterFlowModel<SubscriptionPageWidget> {
  ///  Local state fields for this page.

  bool isVisible = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (InitSafepayPayment)] action in Button widget.
  ApiCallResponse? apiTracker;
  // Stores action output result for [Backend Call - API (CreateAuthToken)] action in Button widget.
  ApiCallResponse? apiTbt;
  // Stores action output result for [Custom Action - buildCheckoutUrl] action in Button widget.
  String? finalCheckoutLink;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
