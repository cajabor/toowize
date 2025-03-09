import '/backend/backend.dart';
import '/components/quote_card_widget.dart';
import '/empty_list_components/no_users/no_users_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  bool dashShow = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for homePageView widget.
  PageController? homePageViewController;
  int homePageViewLoadedLength = 7;
  int get homePageViewCurrentIndex => homePageViewController != null &&
          homePageViewController!.hasClients &&
          homePageViewController!.page != null
      ? homePageViewController!.page!.round()
      : 0;
  PagingController<DocumentSnapshot?, QuotesRecord>?
      homePageViewPagingController;
  Query? homePageViewPagingQuery;
  List<StreamSubscription?> homePageViewStreamSubscriptions = [];

  // Models for quoteCard dynamic component.
  late FlutterFlowDynamicModels<QuoteCardModel> quoteCardModels1;
  // Model for noUsers component.
  late NoUsersModel noUsersModel;
  // State field(s) for followingPageView widget.
  PageController? followingPageViewController;
  int followingPageViewLoadedLength = 8;
  int get followingPageViewCurrentIndex =>
      followingPageViewController != null &&
              followingPageViewController!.hasClients &&
              followingPageViewController!.page != null
          ? followingPageViewController!.page!.round()
          : 0;
  PagingController<DocumentSnapshot?, QuotesRecord>?
      followingPageViewPagingController;
  Query? followingPageViewPagingQuery;
  List<StreamSubscription?> followingPageViewStreamSubscriptions = [];

  // Models for quoteCard dynamic component.
  late FlutterFlowDynamicModels<QuoteCardModel> quoteCardModels2;
  // Stores action output result for [AdMob - Show Interstitial Ad] action in Container widget.
  bool? interstitialAdSuccess;

  @override
  void initState(BuildContext context) {
    quoteCardModels1 = FlutterFlowDynamicModels(() => QuoteCardModel());
    noUsersModel = createModel(context, () => NoUsersModel());
    quoteCardModels2 = FlutterFlowDynamicModels(() => QuoteCardModel());
  }

  @override
  void dispose() {
    for (var s in homePageViewStreamSubscriptions) {
      s?.cancel();
    }
    homePageViewPagingController?.dispose();

    quoteCardModels1.dispose();
    noUsersModel.dispose();
    for (var s in followingPageViewStreamSubscriptions) {
      s?.cancel();
    }
    followingPageViewPagingController?.dispose();

    quoteCardModels2.dispose();
  }

  /// Additional helper methods.
  PagingController<DocumentSnapshot?, QuotesRecord> setHomePageViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    homePageViewPagingController ??=
        _createHomePageViewController(query, parent);
    if (homePageViewPagingQuery != query) {
      homePageViewPagingQuery = query;
      homePageViewPagingController?.refresh();
    }
    return homePageViewPagingController!;
  }

  PagingController<DocumentSnapshot?, QuotesRecord>
      _createHomePageViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, QuotesRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryQuotesRecordPage(
          queryBuilder: (_) => homePageViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: homePageViewStreamSubscriptions,
          controller: controller,
          pageSize: 7,
          isStream: true,
        ),
      );
  }

  PagingController<DocumentSnapshot?, QuotesRecord>
      setFollowingPageViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    followingPageViewPagingController ??=
        _createFollowingPageViewController(query, parent);
    if (followingPageViewPagingQuery != query) {
      followingPageViewPagingQuery = query;
      followingPageViewPagingController?.refresh();
    }
    return followingPageViewPagingController!;
  }

  PagingController<DocumentSnapshot?, QuotesRecord>
      _createFollowingPageViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, QuotesRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryQuotesRecordPage(
          queryBuilder: (_) => followingPageViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: followingPageViewStreamSubscriptions,
          controller: controller,
          pageSize: 8,
          isStream: true,
        ),
      );
  }
}
