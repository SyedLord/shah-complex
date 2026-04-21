import '/components/local_filter_chip_widget.dart';
import '/components/movie_card_widget.dart';
import '/components/search_result_item_widget.dart';
import '/components/season_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  bool isHidden = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for LocalFilterChip.
  late LocalFilterChipModel localFilterChipModel1;
  // Model for LocalFilterChip.
  late LocalFilterChipModel localFilterChipModel2;
  // Model for LocalFilterChip.
  late LocalFilterChipModel localFilterChipModel3;
  // Model for LocalFilterChip.
  late LocalFilterChipModel localFilterChipModel4;
  // Model for movie_card component.
  late MovieCardModel movieCardModel;
  // Model for SeasonCard.
  late SeasonCardModel seasonCardModel1;
  // Model for SeasonCard.
  late SeasonCardModel seasonCardModel2;
  // Model for SeasonCard.
  late SeasonCardModel seasonCardModel3;
  // Model for SearchResultItem.
  late SearchResultItemModel searchResultItemModel1;
  // Model for SearchResultItem.
  late SearchResultItemModel searchResultItemModel2;
  // Model for SearchResultItem.
  late SearchResultItemModel searchResultItemModel3;
  // Model for SearchResultItem.
  late SearchResultItemModel searchResultItemModel4;

  @override
  void initState(BuildContext context) {
    localFilterChipModel1 = createModel(context, () => LocalFilterChipModel());
    localFilterChipModel2 = createModel(context, () => LocalFilterChipModel());
    localFilterChipModel3 = createModel(context, () => LocalFilterChipModel());
    localFilterChipModel4 = createModel(context, () => LocalFilterChipModel());
    movieCardModel = createModel(context, () => MovieCardModel());
    seasonCardModel1 = createModel(context, () => SeasonCardModel());
    seasonCardModel2 = createModel(context, () => SeasonCardModel());
    seasonCardModel3 = createModel(context, () => SeasonCardModel());
    searchResultItemModel1 =
        createModel(context, () => SearchResultItemModel());
    searchResultItemModel2 =
        createModel(context, () => SearchResultItemModel());
    searchResultItemModel3 =
        createModel(context, () => SearchResultItemModel());
    searchResultItemModel4 =
        createModel(context, () => SearchResultItemModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    localFilterChipModel1.dispose();
    localFilterChipModel2.dispose();
    localFilterChipModel3.dispose();
    localFilterChipModel4.dispose();
    movieCardModel.dispose();
    seasonCardModel1.dispose();
    seasonCardModel2.dispose();
    seasonCardModel3.dispose();
    searchResultItemModel1.dispose();
    searchResultItemModel2.dispose();
    searchResultItemModel3.dispose();
    searchResultItemModel4.dispose();
  }
}
