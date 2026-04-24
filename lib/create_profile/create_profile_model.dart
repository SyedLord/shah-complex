import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'create_profile_widget.dart' show CreateProfileWidget;
import 'package:flutter/material.dart';

class CreateProfileModel extends FlutterFlowModel<CreateProfileWidget> {
  ///  Local state fields for this page.

  String profileImage =
      'https://wallpapers.com/images/hd/netflix-profile-pictures-1000-x-1000-qo9h82134t9nv0j0.jpg';

  bool isHIdden = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ProfileName widget.
  FocusNode? profileNameFocusNode;
  TextEditingController? profileNameTextController;
  String? Function(BuildContext, String?)? profileNameTextControllerValidator;
  // State field(s) for IsKids widget.
  bool? isKidsValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    profileNameFocusNode?.dispose();
    profileNameTextController?.dispose();
  }
}
