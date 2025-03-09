import '/flutter_flow/flutter_flow_util.dart';
import 'submit_quote_report_widget.dart' show SubmitQuoteReportWidget;
import 'package:flutter/material.dart';

class SubmitQuoteReportModel extends FlutterFlowModel<SubmitQuoteReportWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for context widget.
  FocusNode? contextFocusNode;
  TextEditingController? contextTextController;
  String? Function(BuildContext, String?)? contextTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    contextFocusNode?.dispose();
    contextTextController?.dispose();
  }
}
