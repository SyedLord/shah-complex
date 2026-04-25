import '/components/bottom_nav_bar_widget.dart';
import '/components/download_item_widget.dart';
import '/components/movie_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  Local state fields for this page.

  bool isHidden = true;

  ///  State fields for stateful widgets in this page.

  // Models for movie_card dynamic component.
  late FlutterFlowDynamicModels<MovieCardModel> movieCardModels1;
  // Models for movie_card dynamic component.
  late FlutterFlowDynamicModels<MovieCardModel> movieCardModels2;
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
    movieCardModels1 = FlutterFlowDynamicModels(() => MovieCardModel());
    movieCardModels2 = FlutterFlowDynamicModels(() => MovieCardModel());
    downloadItemModel1 = createModel(context, () => DownloadItemModel());
    downloadItemModel2 = createModel(context, () => DownloadItemModel());
    downloadItemModel3 = createModel(context, () => DownloadItemModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    movieCardModels1.dispose();
    movieCardModels2.dispose();
    downloadItemModel1.dispose();
    downloadItemModel2.dispose();
    downloadItemModel3.dispose();
    bottomNavBarModel.dispose();
  }
}
