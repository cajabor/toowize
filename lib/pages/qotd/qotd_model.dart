import '/components/quote_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'qotd_widget.dart' show QotdWidget;
import 'package:flutter/material.dart';

class QotdModel extends FlutterFlowModel<QotdWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - subscribeToQOTDTopic] action in QOTD widget.
  bool? subSuccess;
  // Model for quoteCard component.
  late QuoteCardModel quoteCardModel;

  @override
  void initState(BuildContext context) {
    quoteCardModel = createModel(context, () => QuoteCardModel());
  }

  @override
  void dispose() {
    quoteCardModel.dispose();
  }
}
