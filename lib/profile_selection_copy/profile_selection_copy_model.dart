import '/backend/backend.dart';
import '/components/profile_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_selection_copy_widget.dart' show ProfileSelectionCopyWidget;
import 'package:flutter/material.dart';

class ProfileSelectionCopyModel
    extends FlutterFlowModel<ProfileSelectionCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in ProfileSelectionCopy widget.
  List<ProfilesRecord>? fetchedProfiles;
  // Model for profile_avatar component.
  late ProfileAvatarModel profileAvatarModel1;
  // Model for profile_avatar component.
  late ProfileAvatarModel profileAvatarModel2;
  // Model for profile_avatar component.
  late ProfileAvatarModel profileAvatarModel3;

  @override
  void initState(BuildContext context) {
    profileAvatarModel1 = createModel(context, () => ProfileAvatarModel());
    profileAvatarModel2 = createModel(context, () => ProfileAvatarModel());
    profileAvatarModel3 = createModel(context, () => ProfileAvatarModel());
  }

  @override
  void dispose() {
    profileAvatarModel1.dispose();
    profileAvatarModel2.dispose();
    profileAvatarModel3.dispose();
  }
}
