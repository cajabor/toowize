import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/comment_components/comment_thread/comment_thread_widget.dart';
import '/components/quote_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'quote_detail_page_model.dart';
export 'quote_detail_page_model.dart';

class QuoteDetailPageWidget extends StatefulWidget {
  const QuoteDetailPageWidget({
    super.key,
    required this.quoteRef,
    this.parentPage,
  });

  final DocumentReference? quoteRef;
  final String? parentPage;

  @override
  State<QuoteDetailPageWidget> createState() => _QuoteDetailPageWidgetState();
}

class _QuoteDetailPageWidgetState extends State<QuoteDetailPageWidget> {
  late QuoteDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuoteDetailPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'quoteDetailPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QUOTE_DETAIL_quoteDetailPage_ON_INIT_STA');
      if (widget.parentPage == 'commentNotification') {
        logFirebaseEvent('quoteDetailPage_backend_call');
        _model.readquoteDoc =
            await QuotesRecord.getDocumentOnce(widget.quoteRef!);
        logFirebaseEvent('quoteDetailPage_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.65,
                    child: CommentThreadWidget(
                      quoteDoc: _model.readquoteDoc!,
                    ),
                  ),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
              logFirebaseEvent('QUOTE_DETAIL_chevron_left_rounded_ICN_ON');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('QUOTE_DETAIL_Text_6kskq9xh_ON_TAP');
              if (valueOrDefault<bool>(currentUserDocument?.adrl, false)) {
                logFirebaseEvent('Text_update_page_state');
                _model.dash = !_model.dash;
                safeSetState(() {});
              }
            },
            child: Text(
              'Quote',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: FlutterFlowTheme.of(context).headlineMedium,
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<QuotesRecord>(
            stream: QuotesRecord.getDocument(widget.quoteRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitFadingFour(
                      color: FlutterFlowTheme.of(context).secondary,
                      size: 50.0,
                    ),
                  ),
                );
              }

              final containerQuotesRecord = snapshot.data!;

              return Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 5.0, 0.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.55,
                        decoration: const BoxDecoration(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: wrapWithModel(
                                model: _model.quoteCardModel,
                                updateCallback: () => safeSetState(() {}),
                                child: QuoteCardWidget(
                                  parentPage: 'quoteDetailPage',
                                  quoteDoc: containerQuotesRecord,
                                  dash: _model.dash,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ToggleIcon(
                                          onPressed: () async {
                                            final likedByUsersElement =
                                                currentUserReference?.id;
                                            final likedByUsersUpdate =
                                                containerQuotesRecord
                                                        .likedByUsers
                                                        .contains(
                                                            likedByUsersElement)
                                                    ? FieldValue.arrayRemove(
                                                        [likedByUsersElement])
                                                    : FieldValue.arrayUnion(
                                                        [likedByUsersElement]);
                                            await containerQuotesRecord
                                                .reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'liked_by_users':
                                                      likedByUsersUpdate,
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'QUOTE_DETAIL_ToggleIcon_80vikgkt_ON_TOGG');
                                            logFirebaseEvent(
                                                'ToggleIcon_action_block');
                                            await action_blocks
                                                .likeQuoteActions(
                                              context,
                                              quoteDoc: containerQuotesRecord,
                                            );
                                          },
                                          value: containerQuotesRecord
                                              .likedByUsers
                                              .contains(
                                                  currentUserReference?.id),
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
                                        SelectionArea(
                                            child: Text(
                                          formatNumber(
                                            containerQuotesRecord
                                                .likedByUsers.length,
                                            formatType: FormatType.compact,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                                letterSpacing: 0.0,
                                              ),
                                        )),
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
                                                  'QUOTE_DETAIL_comment_icon_ON_TAP');
                                              logFirebaseEvent(
                                                  'comment_icon_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: SizedBox(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.65,
                                                          child:
                                                              CommentThreadWidget(
                                                            quoteDoc:
                                                                containerQuotesRecord,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                            child: Icon(
                                              Icons.mode_comment_outlined,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 28.0,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          formatNumber(
                                            containerQuotesRecord.numComments,
                                            formatType: FormatType.compact,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
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
                                                  'QUOTE_DETAIL_Icon_wgne0x6u_ON_TAP');
                                              logFirebaseEvent('Icon_share');
                                              await Share.share(
                                                'toowize://toowize.com/quote/${containerQuotesRecord.reference.id}',
                                                sharePositionOrigin:
                                                    getWidgetBoundingBox(
                                                        context),
                                              );
                                            },
                                            child: Icon(
                                              Icons.ios_share,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                                font:
                                                    FlutterFlowTheme.of(context)
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
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 0.0, 5.0),
                        child: Text(
                          dateTimeFormat(
                            "relative",
                            containerQuotesRecord.createdTime!,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: FlutterFlowTheme.of(context).bodyMedium,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
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
    );
  }
}
