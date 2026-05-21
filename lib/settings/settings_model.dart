import '/components/menu_item_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FlutterFlowModel<SettingsWidget> {
  ///  Local state fields for this page.

  bool isVisible = false;

  ///  State fields for stateful widgets in this page.

  // Model for MenuItem.
  late MenuItemModel menuItemModel1;
  // Model for MenuItem.
  late MenuItemModel menuItemModel2;
  // Model for MenuItem.
  late MenuItemModel menuItemModel3;
  // Model for MenuItem.
  late MenuItemModel menuItemModel4;
  // Model for MenuItem.
  late MenuItemModel menuItemModel5;
  // Model for MenuItem.
  late MenuItemModel menuItemModel6;

  @override
  void initState(BuildContext context) {
    menuItemModel1 = createModel(context, () => MenuItemModel());
    menuItemModel2 = createModel(context, () => MenuItemModel());
    menuItemModel3 = createModel(context, () => MenuItemModel());
    menuItemModel4 = createModel(context, () => MenuItemModel());
    menuItemModel5 = createModel(context, () => MenuItemModel());
    menuItemModel6 = createModel(context, () => MenuItemModel());
  }

  @override
  void dispose() {
    menuItemModel1.dispose();
    menuItemModel2.dispose();
    menuItemModel3.dispose();
    menuItemModel4.dispose();
    menuItemModel5.dispose();
    menuItemModel6.dispose();
  }
}
