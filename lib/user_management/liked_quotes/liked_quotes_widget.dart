import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/comment_components/comment_thread/comment_thread_widget.dart';
import '/components/quote_card_widget.dart';
import '/empty_list_components/user_no_quotes/user_no_quotes_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'liked_quotes_model.dart';
export 'liked_quotes_model.dart';

class LikedQuotesWidget extends StatefulWidget {
  const LikedQuotesWidget({super.key});

  @override
  State<LikedQuotesWidget> createState() => _LikedQuotesWidgetState();
}

class _LikedQuotesWidgetState extends State<LikedQuotesWidget> {
  late LikedQuotesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LikedQuotesModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'likedQuotes'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('LIKED_QUOTES_chevron_left_rounded_ICN_ON');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Liked Quotes',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: FlutterFlowTheme.of(context).headlineMedium,
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: PagedListView<DocumentSnapshot<Object?>?,
                QuotesRecord>.separated(
              pagingController: _model.setListViewController(
                QuotesRecord.collection
                    .where(
                      'liked_by_users',
                      arrayContains: currentUserUid,
                    )
                    .orderBy('created_time'),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              reverse: false,
              scrollDirection: Axis.vertical,
              separatorBuilder: (_, __) => const SizedBox(height: 15.0),
              builderDelegate: PagedChildBuilderDelegate<QuotesRecord>(
                // Customize what your widget looks like when it's loading the first page.
                firstPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitFadingFour(
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 50.0,
                    ),
                  ),
                ),
                // Customize what your widget looks like when it's loading another page.
                newPageProgressIndicatorBuilder: (_) => Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitFadingFour(
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 50.0,
                    ),
                  ),
                ),
                noItemsFoundIndicatorBuilder: (_) => const Center(
                  child: UserNoQuotesWidget(),
                ),
                itemBuilder: (context, _, listViewIndex) {
                  final listViewQuotesRecord =
                      _model.listViewPagingController!.itemList![listViewIndex];
                  return Container(
                    height: MediaQuery.sizeOf(context).height * 0.55,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: Color(0x33000000),
                          offset: Offset(
                            0.0,
                            2.0,
                          ),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: wrapWithModel(
                            model: _model.quoteCardModels.getModel(
                              listViewQuotesRecord.reference.id,
                              listViewIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: QuoteCardWidget(
                              key: Key(
                                'Keyl9y_${listViewQuotesRecord.reference.id}',
                              ),
                              parentPage: 'likedQuotes',
                              quoteDoc: listViewQuotesRecord,
                              dash: false,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, 1.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ToggleIcon(
                                      onPressed: () async {
                                        final likedByUsersElement =
                                            currentUserReference?.id;
                                        final likedByUsersUpdate =
                                            listViewQuotesRecord.likedByUsers
                                                    .contains(
                                                        likedByUsersElement)
                                                ? FieldValue.arrayRemove(
                                                    [likedByUsersElement])
                                                : FieldValue.arrayUnion(
                                                    [likedByUsersElement]);
                                        await listViewQuotesRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'liked_by_users':
                                                  likedByUsersUpdate,
                                            },
                                          ),
                                        });
                                        logFirebaseEvent(
                                            'LIKED_QUOTES_ToggleIcon_6r49td30_ON_TOGG');
                                        logFirebaseEvent(
                                            'ToggleIcon_action_block');
                                        await action_blocks.likeQuoteActions(
                                          context,
                                          quoteDoc: listViewQuotesRecord,
                                        );
                                      },
                                      value: listViewQuotesRecord.likedByUsers
                                          .contains(currentUserReference?.id),
                                      onIcon: Icon(
                                        Icons.favorite_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        size: 28.0,
                                      ),
                                      offIcon: Icon(
                                        Icons.favorite_border_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 28.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        formatNumber(
                                          listViewQuotesRecord
                                              .likedByUsers.length,
                                          formatType: FormatType.compact,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .bodyMedium,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'LIKED_QUOTES_PAGE_comment_icon_ON_TAP');
                                          logFirebaseEvent(
                                              'comment_icon_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            useSafeArea: true,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(context)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: SizedBox(
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          0.65,
                                                      child:
                                                          CommentThreadWidget(
                                                        quoteDoc:
                                                            listViewQuotesRecord,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                        child: Icon(
                                          Icons.mode_comment_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 28.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      formatNumber(
                                        listViewQuotesRecord.numComments,
                                        formatType: FormatType.compact,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 2.0)),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'LIKED_QUOTES_PAGE_Icon_9z5fphpc_ON_TAP');
                                          logFirebaseEvent('Icon_share');
                                          await Share.share(
                                            'toowize://toowize.com/quote/${listViewQuotesRecord.reference.id}',
                                            sharePositionOrigin:
                                                getWidgetBoundingBox(context),
                                          );
                                        },
                                        child: Icon(
                                          Icons.ios_share,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 28.0,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      ' ',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 2.0)),
                                ),
                              ].divide(const SizedBox(width: 25.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
