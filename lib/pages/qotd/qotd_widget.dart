import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/cloud_functions/cloud_functions.dart';
import '/comment_components/comment_thread/comment_thread_widget.dart';
import '/components/quote_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'qotd_model.dart';
export 'qotd_model.dart';

class QotdWidget extends StatefulWidget {
  const QotdWidget({super.key});

  @override
  State<QotdWidget> createState() => _QotdWidgetState();
}

class _QotdWidgetState extends State<QotdWidget> with TickerProviderStateMixin {
  late QotdModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QotdModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'QOTD'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('QOTD_PAGE_QOTD_ON_INIT_STATE');
      if (FFAppState().appFirstOpen) {
        logFirebaseEvent('QOTD_custom_action');
        _model.subSuccess = await actions.subscribeToQOTDTopic();
        if (_model.subSuccess!) {
          logFirebaseEvent('QOTD_update_app_state');
          FFAppState().QOTDNotifications = true;
          FFAppState().appFirstOpen = false;
        }
      }
      if (!valueOrDefault<bool>(
          currentUserDocument?.oneSignalSubscribed, false)) {
        logFirebaseEvent('QOTD_one_signal');
        await makeCloudCall(
          'addUser',
          {
            'user_id': currentUserUid,
            'subscriptions': [
              {
                'type': 'Email',
                'token': currentUserEmail,
              },
            ],
          },
        );

        logFirebaseEvent('QOTD_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          oneSignalSubscribed: true,
        ));
      }
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1710.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFFD4AF37),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.chevron_left_rounded,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('QOTD_chevron_left_rounded_ICN_ON_TAP');
              logFirebaseEvent('IconButton_navigate_back');
              context.safePop();
            },
          ),
          title: Container(
            width: double.infinity,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: AutoSizeText(
                    'Quote of The Day',
                    textAlign: TextAlign.center,
                    minFontSize: 14.0,
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          font: GoogleFonts.junge(),
                          color: Colors.black,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: FutureBuilder<List<QotdRecord>>(
          future: queryQotdRecordOnce(
            singleRecord: true,
          ),
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
            List<QotdRecord> containerQotdRecordList = snapshot.data!;
            final containerQotdRecord = containerQotdRecordList.isNotEmpty
                ? containerQotdRecordList.first
                : null;

            return Container(
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFD4AF37),
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: const [0.0, 0.6],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 45.0),
                child: StreamBuilder<QuotesRecord>(
                  stream: QuotesRecord.getDocument(
                      containerQotdRecord!.ogQuoteRef!),
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
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 40.0, 5.0, 0.0),
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.55,
                          constraints: const BoxConstraints(
                            maxWidth: 700.0,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0xB8E9B135),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(
                              color: const Color(0xB8E9B135),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: wrapWithModel(
                                  model: _model.quoteCardModel,
                                  updateCallback: () => safeSetState(() {}),
                                  updateOnChange: true,
                                  child: QuoteCardWidget(
                                    parentPage: 'homePage',
                                    quoteDoc: containerQuotesRecord,
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
                                                  containerQuotesRecord
                                                          .likedByUsers
                                                          .contains(
                                                              likedByUsersElement)
                                                      ? FieldValue.arrayRemove(
                                                          [likedByUsersElement])
                                                      : FieldValue.arrayUnion([
                                                          likedByUsersElement
                                                        ]);
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
                                                  'QOTD_PAGE_ToggleIcon_pchvqb54_ON_TOGGLE');
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent1,
                                              size: 28.0,
                                            ),
                                            offIcon: Icon(
                                              Icons.favorite_border_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 28.0,
                                            ),
                                          ),
                                          Text(
                                            formatNumber(
                                              containerQuotesRecord
                                                  .likedByUsers.length,
                                              formatType: FormatType.compact,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'QOTD_PAGE_comment_icon_ON_TAP');
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
                                                            height: MediaQuery
                                                                        .sizeOf(
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
                                                  font: FlutterFlowTheme.of(
                                                          context)
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
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'QOTD_PAGE_Icon_8pcbamyq_ON_TAP');
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
                                                  font: FlutterFlowTheme.of(
                                                          context)
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
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
