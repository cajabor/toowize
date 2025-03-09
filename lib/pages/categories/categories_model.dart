import '/category_components/category_card/category_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'categories_widget.dart' show CategoriesWidget;
import 'package:flutter/material.dart';

class CategoriesModel extends FlutterFlowModel<CategoriesWidget> {
  ///  Local state fields for this page.

  bool searchStarted = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for categorySearchTextField widget.
  FocusNode? categorySearchTextFieldFocusNode;
  TextEditingController? categorySearchTextFieldTextController;
  String? Function(BuildContext, String?)?
      categorySearchTextFieldTextControllerValidator;
  // Models for categoryCard dynamic component.
  late FlutterFlowDynamicModels<CategoryCardModel> categoryCardModels1;
  // Models for categoryCard dynamic component.
  late FlutterFlowDynamicModels<CategoryCardModel> categoryCardModels2;
  // Models for categoryCard dynamic component.
  late FlutterFlowDynamicModels<CategoryCardModel> categoryCardModels3;

  @override
  void initState(BuildContext context) {
    categoryCardModels1 = FlutterFlowDynamicModels(() => CategoryCardModel());
    categoryCardModels2 = FlutterFlowDynamicModels(() => CategoryCardModel());
    categoryCardModels3 = FlutterFlowDynamicModels(() => CategoryCardModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    categorySearchTextFieldFocusNode?.dispose();
    categorySearchTextFieldTextController?.dispose();

    categoryCardModels1.dispose();
    categoryCardModels2.dispose();
    categoryCardModels3.dispose();
  }
}
