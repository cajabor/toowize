import '/backend/backend.dart';
import '/components/quote_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'quote_detail_page_widget.dart' show QuoteDetailPageWidget;
import 'package:flutter/material.dart';

class QuoteDetailPageModel extends FlutterFlowModel<QuoteDetailPageWidget> {
  ///  Local state fields for this page.

  bool dash = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in quoteDetailPage widget.
  QuotesRecord? readquoteDoc;
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
