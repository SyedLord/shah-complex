import '/components/bottom_nav_bar_widget.dart';
import '/components/download_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  Local state fields for this page.

  bool isHidden = true;

  ///  State fields for stateful widgets in this page.

  // Model for DownloadItem.
  late DownloadItemModel downloadItemModel1;
  // Model for DownloadItem.
  late DownloadItemModel downloadItemModel2;
  // Model for DownloadItem.
  late DownloadItemModel downloadItemModel3;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    downloadItemModel1 = createModel(context, () => DownloadItemModel());
    downloadItemModel2 = createModel(context, () => DownloadItemModel());
    downloadItemModel3 = createModel(context, () => DownloadItemModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    downloadItemModel1.dispose();
    downloadItemModel2.dispose();
    downloadItemModel3.dispose();
    bottomNavBarModel.dispose();
  }
}
