import '/components/hero_poster_widget.dart';
import '/components/movie_card_widget.dart';
import '/components/section_header_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'home_dashboard_copy_widget.dart' show HomeDashboardCopyWidget;
import 'package:flutter/material.dart';

class HomeDashboardCopyModel extends FlutterFlowModel<HomeDashboardCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HeroPoster component.
  late HeroPosterModel heroPosterModel;
  // Model for section_header component.
  late SectionHeaderModel sectionHeaderModel1;
  // Model for section_header component.
  late SectionHeaderModel sectionHeaderModel2;
  // Model for section_header component.
  late SectionHeaderModel sectionHeaderModel3;
  // Model for movie_card component.
  late MovieCardModel movieCardModel3;

  @override
  void initState(BuildContext context) {
    heroPosterModel = createModel(context, () => HeroPosterModel());
    sectionHeaderModel1 = createModel(context, () => SectionHeaderModel());
    sectionHeaderModel2 = createModel(context, () => SectionHeaderModel());
    sectionHeaderModel3 = createModel(context, () => SectionHeaderModel());
    movieCardModel3 = createModel(context, () => MovieCardModel());
  }

  @override
  void dispose() {
    heroPosterModel.dispose();
    sectionHeaderModel1.dispose();
    sectionHeaderModel2.dispose();
    sectionHeaderModel3.dispose();
    movieCardModel3.dispose();
  }
}
