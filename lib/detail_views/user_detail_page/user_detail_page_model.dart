import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'user_detail_page_widget.dart' show UserDetailPageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UserDetailPageModel extends FlutterFlowModel<UserDetailPageWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<UsersRecord>? documentRequestCompleter;
  // State field(s) for StaggeredView widget.

  PagingController<DocumentSnapshot?, QuotesRecord>?
      staggeredViewPagingController;
  Query? staggeredViewPagingQuery;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    staggeredViewPagingController?.dispose();
  }

  /// Additional helper methods.
  Future waitForDocumentRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = documentRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  PagingController<DocumentSnapshot?, QuotesRecord> setStaggeredViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    staggeredViewPagingController ??=
        _createStaggeredViewController(query, parent);
    if (staggeredViewPagingQuery != query) {
      staggeredViewPagingQuery = query;
      staggeredViewPagingController?.refresh();
    }
    return staggeredViewPagingController!;
  }

  PagingController<DocumentSnapshot?, QuotesRecord>
      _createStaggeredViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, QuotesRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryQuotesRecordPage(
          queryBuilder: (_) => staggeredViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          controller: controller,
          pageSize: 10,
          isStream: false,
        ),
      );
  }
}
