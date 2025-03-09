import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/comment_components/comment_entry/comment_entry_widget.dart';
import '/comment_components/comment_thread/comment_thread_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comment_thread_widget.dart' show CommentThreadWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CommentThreadModel extends FlutterFlowModel<CommentThreadWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, CommentsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Models for commentEntry dynamic component.
  late FlutterFlowDynamicModels<CommentEntryModel> commentEntryModels;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  UsersRecord? quotePostedBy;
  // Stores action output result for [Backend Call - API (moderateText)] action in IconButton widget.
  ApiCallResponse? moderateTextReturn;

  @override
  void initState(BuildContext context) {
    commentEntryModels = FlutterFlowDynamicModels(() => CommentEntryModel());
  }

  @override
  void dispose() {
    for (var s in listViewStreamSubscriptions) {
      s?.cancel();
    }
    listViewPagingController?.dispose();

    commentEntryModels.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, CommentsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, CommentsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, CommentsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryCommentsRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 10,
          isStream: true,
        ),
      );
  }
}
