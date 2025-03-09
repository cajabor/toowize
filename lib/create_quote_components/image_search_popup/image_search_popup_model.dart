import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'image_search_popup_widget.dart' show ImageSearchPopupWidget;
import 'package:flutter/material.dart';

class ImageSearchPopupModel extends FlutterFlowModel<ImageSearchPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (googleImageSearch)] action in TextField widget.
  ApiCallResponse? googleImages;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
