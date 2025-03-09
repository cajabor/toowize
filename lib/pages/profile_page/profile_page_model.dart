import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for StaggeredView widget.

  PagingController<DocumentSnapshot?, QuotesRecord>?
      staggeredViewPagingController;
  Query? staggeredViewPagingQuery;

  /// Query cache managers for this widget.

  final _myFollowingCountManager = FutureRequestManager<int>();
  Future<int> myFollowingCount({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _myFollowingCountManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyFollowingCountCache() => _myFollowingCountManager.clear();
  void clearMyFollowingCountCacheKey(String? uniqueKey) =>
      _myFollowingCountManager.clearRequest(uniqueKey);

  final _myFollowerCountManager = FutureRequestManager<int>();
  Future<int> myFollowerCount({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _myFollowerCountManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyFollowerCountCache() => _myFollowerCountManager.clear();
  void clearMyFollowerCountCacheKey(String? uniqueKey) =>
      _myFollowerCountManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    staggeredViewPagingController?.dispose();

    /// Dispose query cache managers for this widget.

    clearMyFollowingCountCache();

    clearMyFollowerCountCache();
  }

  /// Additional helper methods.
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
