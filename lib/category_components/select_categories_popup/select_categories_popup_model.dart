import '/category_components/post_to_category_tag/post_to_category_tag_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'select_categories_popup_widget.dart' show SelectCategoriesPopupWidget;
import 'package:flutter/material.dart';

class SelectCategoriesPopupModel
    extends FlutterFlowModel<SelectCategoriesPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for postToCategoryTag dynamic component.
  late FlutterFlowDynamicModels<PostToCategoryTagModel> postToCategoryTagModels;

  @override
  void initState(BuildContext context) {
    postToCategoryTagModels =
        FlutterFlowDynamicModels(() => PostToCategoryTagModel());
  }

  @override
  void dispose() {
    postToCategoryTagModels.dispose();
  }
}
