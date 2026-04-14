import '/components/movie_card_with_title4_widget.dart';
import '/components/profile_icon_dropdown_widget.dart';
import '/components/section_header4_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_dashboard_profile_menu_widget.dart'
    show HomeDashboardProfileMenuWidget;
import 'package:flutter/material.dart';

class HomeDashboardProfileMenuModel
    extends FlutterFlowModel<HomeDashboardProfileMenuWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for SectionHeader4 component.
  late SectionHeader4Model sectionHeader4Model1;
  // Model for MovieCardWithTitle4 component.
  late MovieCardWithTitle4Model movieCardWithTitle4Model1;
  // Model for MovieCardWithTitle4 component.
  late MovieCardWithTitle4Model movieCardWithTitle4Model2;
  // Model for MovieCardWithTitle4 component.
  late MovieCardWithTitle4Model movieCardWithTitle4Model3;
  // Model for MovieCardWithTitle4 component.
  late MovieCardWithTitle4Model movieCardWithTitle4Model4;
  // Model for SectionHeader4 component.
  late SectionHeader4Model sectionHeader4Model2;
  // Model for MovieCardWithTitle4 component.
  late MovieCardWithTitle4Model movieCardWithTitle4Model5;
  // Model for MovieCardWithTitle4 component.
  late MovieCardWithTitle4Model movieCardWithTitle4Model6;
  // Model for MovieCardWithTitle4 component.
  late MovieCardWithTitle4Model movieCardWithTitle4Model7;
  // Model for MovieCardWithTitle4 component.
  late MovieCardWithTitle4Model movieCardWithTitle4Model8;
  // Model for ProfileIconDropdown component.
  late ProfileIconDropdownModel profileIconDropdownModel;

  @override
  void initState(BuildContext context) {
    sectionHeader4Model1 = createModel(context, () => SectionHeader4Model());
    movieCardWithTitle4Model1 =
        createModel(context, () => MovieCardWithTitle4Model());
    movieCardWithTitle4Model2 =
        createModel(context, () => MovieCardWithTitle4Model());
    movieCardWithTitle4Model3 =
        createModel(context, () => MovieCardWithTitle4Model());
    movieCardWithTitle4Model4 =
        createModel(context, () => MovieCardWithTitle4Model());
    sectionHeader4Model2 = createModel(context, () => SectionHeader4Model());
    movieCardWithTitle4Model5 =
        createModel(context, () => MovieCardWithTitle4Model());
    movieCardWithTitle4Model6 =
        createModel(context, () => MovieCardWithTitle4Model());
    movieCardWithTitle4Model7 =
        createModel(context, () => MovieCardWithTitle4Model());
    movieCardWithTitle4Model8 =
        createModel(context, () => MovieCardWithTitle4Model());
    profileIconDropdownModel =
        createModel(context, () => ProfileIconDropdownModel());
  }

  @override
  void dispose() {
    sectionHeader4Model1.dispose();
    movieCardWithTitle4Model1.dispose();
    movieCardWithTitle4Model2.dispose();
    movieCardWithTitle4Model3.dispose();
    movieCardWithTitle4Model4.dispose();
    sectionHeader4Model2.dispose();
    movieCardWithTitle4Model5.dispose();
    movieCardWithTitle4Model6.dispose();
    movieCardWithTitle4Model7.dispose();
    movieCardWithTitle4Model8.dispose();
    profileIconDropdownModel.dispose();
  }
}
