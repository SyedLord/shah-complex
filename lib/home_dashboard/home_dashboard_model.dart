import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/section_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_dashboard_widget.dart' show HomeDashboardWidget;
import 'package:flutter/material.dart';

class HomeDashboardModel extends FlutterFlowModel<HomeDashboardWidget> {
  ///  Local state fields for this page.

  List<HeroItemStruct> carouselItems = [];
  void addToCarouselItems(HeroItemStruct item) => carouselItems.add(item);
  void removeFromCarouselItems(HeroItemStruct item) =>
      carouselItems.remove(item);
  void removeAtIndexFromCarouselItems(int index) =>
      carouselItems.removeAt(index);
  void insertAtIndexInCarouselItems(int index, HeroItemStruct item) =>
      carouselItems.insert(index, item);
  void updateCarouselItemsAtIndex(
          int index, Function(HeroItemStruct) updateFn) =>
      carouselItems[index] = updateFn(carouselItems[index]);

  bool showProfileDropdown = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getTrendingCarousel] action in HomeDashboard widget.
  List<HeroItemStruct>? trendingList;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for section_header component.
  late SectionHeaderModel sectionHeaderModel1;
  // Model for section_header component.
  late SectionHeaderModel sectionHeaderModel2;
  // Model for section_header component.
  late SectionHeaderModel sectionHeaderModel3;

  @override
  void initState(BuildContext context) {
    sectionHeaderModel1 = createModel(context, () => SectionHeaderModel());
    sectionHeaderModel2 = createModel(context, () => SectionHeaderModel());
    sectionHeaderModel3 = createModel(context, () => SectionHeaderModel());
  }

  @override
  void dispose() {
    sectionHeaderModel1.dispose();
    sectionHeaderModel2.dispose();
    sectionHeaderModel3.dispose();
  }
}
