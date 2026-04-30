import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_selection_widget.dart' show ProfileSelectionWidget;
import 'package:flutter/material.dart';

class ProfileSelectionModel extends FlutterFlowModel<ProfileSelectionWidget> {
  ///  Local state fields for this page.

  bool showAddProfile = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ProfileSelection widget.
  List<ProfilesRecord>? fetchedProfiles;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
