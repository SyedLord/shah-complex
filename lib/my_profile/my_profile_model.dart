import '/components/download_item_widget.dart';
import '/components/menu_item_widget.dart';
import '/components/watchlist_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for WatchlistCard.
  late WatchlistCardModel watchlistCardModel1;
  // Model for WatchlistCard.
  late WatchlistCardModel watchlistCardModel2;
  // Model for WatchlistCard.
  late WatchlistCardModel watchlistCardModel3;
  // Model for WatchlistCard.
  late WatchlistCardModel watchlistCardModel4;
  // Model for DownloadItem.
  late DownloadItemModel downloadItemModel1;
  // Model for DownloadItem.
  late DownloadItemModel downloadItemModel2;
  // Model for DownloadItem.
  late DownloadItemModel downloadItemModel3;
  // Model for MenuItem.
  late MenuItemModel menuItemModel1;
  // Model for MenuItem.
  late MenuItemModel menuItemModel2;
  // Model for MenuItem.
  late MenuItemModel menuItemModel3;
  // Model for MenuItem.
  late MenuItemModel menuItemModel4;

  @override
  void initState(BuildContext context) {
    watchlistCardModel1 = createModel(context, () => WatchlistCardModel());
    watchlistCardModel2 = createModel(context, () => WatchlistCardModel());
    watchlistCardModel3 = createModel(context, () => WatchlistCardModel());
    watchlistCardModel4 = createModel(context, () => WatchlistCardModel());
    downloadItemModel1 = createModel(context, () => DownloadItemModel());
    downloadItemModel2 = createModel(context, () => DownloadItemModel());
    downloadItemModel3 = createModel(context, () => DownloadItemModel());
    menuItemModel1 = createModel(context, () => MenuItemModel());
    menuItemModel2 = createModel(context, () => MenuItemModel());
    menuItemModel3 = createModel(context, () => MenuItemModel());
    menuItemModel4 = createModel(context, () => MenuItemModel());
  }

  @override
  void dispose() {
    watchlistCardModel1.dispose();
    watchlistCardModel2.dispose();
    watchlistCardModel3.dispose();
    watchlistCardModel4.dispose();
    downloadItemModel1.dispose();
    downloadItemModel2.dispose();
    downloadItemModel3.dispose();
    menuItemModel1.dispose();
    menuItemModel2.dispose();
    menuItemModel3.dispose();
    menuItemModel4.dispose();
  }
}
