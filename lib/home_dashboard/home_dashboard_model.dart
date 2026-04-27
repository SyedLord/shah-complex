import '/backend/backend.dart';
import '/components/bottom_nav_bar_widget.dart';
import '/components/section_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_dashboard_widget.dart' show HomeDashboardWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeDashboardModel extends FlutterFlowModel<HomeDashboardWidget> {
  ///  Local state fields for this page.

  bool showProfileDropdown = false;

  bool isHidden = true;

  bool isTopBarBlurred = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getTrendingCarousel] action in HomeDashboard widget.
  List<HeroItemStruct>? trendingList;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Backend Call - Read Document] action in Stack widget.
  MoviesRecord? loadedMoviesDoc;
  // Stores action output result for [Backend Call - Read Document] action in Stack widget.
  SeriesRecord? loadedSeriesDoc;
  // Model for section_header component.
  late SectionHeaderModel sectionHeaderModel1;
  // Model for section_header component.
  late SectionHeaderModel sectionHeaderModel2;
  // Model for section_header component.
  late SectionHeaderModel sectionHeaderModel3;
  // Model for BottomNavBar component.
  late BottomNavBarModel bottomNavBarModel;

  @override
  void initState(BuildContext context) {
    sectionHeaderModel1 = createModel(context, () => SectionHeaderModel());
    sectionHeaderModel2 = createModel(context, () => SectionHeaderModel());
    sectionHeaderModel3 = createModel(context, () => SectionHeaderModel());
    bottomNavBarModel = createModel(context, () => BottomNavBarModel());
  }

  @override
  void dispose() {
    sectionHeaderModel1.dispose();
    sectionHeaderModel2.dispose();
    sectionHeaderModel3.dispose();
    bottomNavBarModel.dispose();
  }
}
