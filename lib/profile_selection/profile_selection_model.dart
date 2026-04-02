import '/components/profile_avatar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_selection_widget.dart' show ProfileSelectionWidget;
import 'package:flutter/material.dart';

class ProfileSelectionModel extends FlutterFlowModel<ProfileSelectionWidget> {
  ///  State fields for stateful widgets in this page.

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
