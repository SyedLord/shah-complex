import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_selection_widget.dart' show ProfileSelectionWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ProfileSelectionModel extends FlutterFlowModel<ProfileSelectionWidget> {
  ///  Local state fields for this page.

  bool isEditMode = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ProfileSelection widget.
  List<ProfilesRecord>? fetchedProfiles;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
