import '/components/description_widget_widget.dart';
import '/components/movie_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'collection_page_widget.dart' show CollectionPageWidget;
import 'package:flutter/material.dart';

class CollectionPageModel extends FlutterFlowModel<CollectionPageWidget> {
  ///  Local state fields for this page.

  int tabIndex = 0;

  bool toggleBtn = false;

  bool isHidden = true;

  ///  State fields for stateful widgets in this page.

  // Model for movie_card component.
  late MovieCardModel movieCardModel1;
  // Model for DescriptionWidget component.
  late DescriptionWidgetModel descriptionWidgetModel;

  @override
  void initState(BuildContext context) {
    movieCardModel1 = createModel(context, () => MovieCardModel());
    descriptionWidgetModel =
        createModel(context, () => DescriptionWidgetModel());
  }

  @override
  void dispose() {
    movieCardModel1.dispose();
    descriptionWidgetModel.dispose();
  }
}
