import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/comment_components/comment_thread/comment_thread_widget.dart';
import '/components/lost_streak_widget.dart';
import '/components/premium_paywall_widget.dart';
import '/components/quote_card_widget.dart';
import '/components/streak_display_widget.dart';
import '/empty_list_components/no_users/no_users_widget.dart';
import '/empty_list_components/user_no_quotes/user_no_quotes_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading_components/category_row_shimmer/category_row_shimmer_widget.dart';
import '/loading_components/current_category_shimmer/current_category_shimmer_widget.dart';
import '/loading_components/quote_card_shimmer/quote_card_shimmer_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/admob_util.dart' as admob;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'homePage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_PAGE_homePage_ON_INIT_STATE');
      logFirebaseEvent('homePage_ad_mob');
      unawaited(
        () async {
          admob.loadInterstitialAd(
            "ca-app-pub-4396913314822848/4707868013",
            "ca-app-pub-4396913314822848/5606016711",
            false,
          );
        }(),
      );
      if (valueOrDefault<bool>(
            currentUserDocument?.lastAppOpen != null,
            false,
          ) &&
          (functions.daysBetween(
                  currentUserDocument!.lastAppOpen!, getCurrentTimestamp) ==
              1)) {
        logFirebaseEvent('homePage_backend_call');
        unawaited(
          () async {
            await currentUserReference!.update({
              ...createUsersRecordData(
                lastAppOpen: getCurrentTimestamp,
              ),
              ...mapToFirestore(
                {
                  'streak': FieldValue.increment(1),
                },
              ),
            });
          }(),
        );
      } else {
        if (valueOrDefault<bool>(
              currentUserDocument?.lastAppOpen == null,
              true,
            ) ||
            (functions.daysBetween(
                    currentUserDocument!.lastAppOpen!, getCurrentTimestamp)! >
                1)) {
          if (valueOrDefault(currentUserDocument?.streak, 0) > 1) {
            logFirebaseEvent('homePage_alert_dialog');
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: const AlignmentDirectional(0.0, 0.0)
                      .resolve(Directionality.of(context)),
                  child: WebViewAware(
                    child: GestureDetector(
                      onTap: () {
                        FocusScope.of(dialogContext).unfocus();
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        width: MediaQuery.sizeOf(context).width * 0.85,
                        child: LostStreakWidget(
                          streak:
                              valueOrDefault(currentUserDocument?.streak, 0),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );

            logFirebaseEvent('homePage_backend_call');

            await currentUserReference!.update(createUsersRecordData(
              streak: 1,
            ));
          } else {
            logFirebaseEvent('homePage_backend_call');

            await currentUserReference!.update(createUsersRecordData(
              streak: 1,
            ));
          }
        }
        logFirebaseEvent('homePage_backend_call');

        await currentUserReference!.update(createUsersRecordData(
          lastAppOpen: getCurrentTimestamp,
        ));
      }

      if (functions.clearCache(FFAppState().lastCache!)) {
        logFirebaseEvent('homePage_clear_query_cache');
        FFAppState().clearGetAllCategoriesCache();
        logFirebaseEvent('homePage_wait__delay');
        await Future.delayed(const Duration(milliseconds: 30000));
        logFirebaseEvent('homePage_update_app_state');
        FFAppState().lastCache = getCurrentTimestamp;
      }
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        applyInitialState: true,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 910.0.ms,
            duration: 1640.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 960.0.ms,
            duration: 1430.0.ms,
            hz: 10,
            offset: const Offset(0.0, 0.0),
            rotation: 0.332,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 530.0.ms,
            duration: 600.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onLongPress: () async {
                        logFirebaseEvent('HOME_Text_1ulkhy14_ON_LONG_PRESS');
                        if (valueOrDefault<bool>(
                            currentUserDocument?.adrl, false)) {
                          logFirebaseEvent('Text_update_page_state');
                          _model.dashShow = !_model.dashShow;
                          safeSetState(() {});
                        }
                      },
                      child: GradientText(
                        'TooWize',
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              font: GoogleFonts.junge(),
                              color: FlutterFlowTheme.of(context).primary,
                              fontSize: 30.0,
                              letterSpacing: 0.0,
                            ),
                        colors: [
                          FlutterFlowTheme.of(context).primary,
                          FlutterFlowTheme.of(context).secondary
                        ],
                        gradientDirection: GradientDirection.ltr,
                        gradientType: GradientType.linear,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) => Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'HOME_PAGE_PAGE_Row_9tzsa0kf_ON_TAP');
                          logFirebaseEvent('Row_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: const AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: WebViewAware(
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(dialogContext).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.4,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.85,
                                      child: const StreakDisplayWidget(),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.fire,
                              color: Color(0xFFECA63D),
                              size: 24.0,
                            )
                                .animateOnPageLoad(
                                    animationsMap['iconOnPageLoadAnimation']!)
                                .animateOnActionTrigger(
                                  animationsMap[
                                      'iconOnActionTriggerAnimation']!,
                                ),
                            AuthUserStreamWidget(
                              builder: (context) => GradientText(
                                valueOrDefault<String>(
                                  valueOrDefault(currentUserDocument?.streak, 0)
                                      .toString(),
                                  '1',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                                colors: [
                                  const Color(0xFFECA63D),
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                gradientDirection: GradientDirection.ltr,
                                gradientType: GradientType.linear,
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation']!),
                            ),
                          ].divide(const SizedBox(width: 3.0)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'HOME_PAGE_PAGE_Stack_pjt7f7py_ON_TAP');
                        logFirebaseEvent('Stack_update_app_state');
                        FFAppState().QOTDLastView = getCurrentTimestamp;
                        logFirebaseEvent('Stack_navigate_to');

                        context.pushNamed('QOTD');
                      },
                      child: Stack(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FaIcon(
                              FontAwesomeIcons.calendarDay,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                          ),
                          if (!valueOrDefault<bool>(
                            functions.isQOTDViewed(FFAppState().QOTDLastView),
                            true,
                          ))
                            Container(
                              width: 13.0,
                              height: 13.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).error,
                                shape: BoxShape.circle,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              actions: const [],
              centerTitle: false,
              elevation: 1.0,
            ),
            body: Stack(
              children: [
                Builder(
                  builder: (context) {
                    if (valueOrDefault<bool>(
                      FFAppState().currentFeedCategoryRef !=
                          FFAppState().followingCategoryReference,
                      true,
                    )) {
                      return Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 53.0, 0.0, 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: PagedPageView<DocumentSnapshot<Object?>?,
                              QuotesRecord>(
                            pagingController: _model.setHomePageViewController(
                              QuotesRecord.collection
                                  .where(
                                    'categories_posted_to',
                                    arrayContains:
                                        FFAppState().currentFeedCategoryRef,
                                  )
                                  .orderBy('random_index'),
                            ),
                            pageController: _model.homePageViewController ??=
                                PageController(
                                    initialPage: max(
                                        0,
                                        min(
                                            0,
                                            _model.homePageViewLoadedLength -
                                                1))),
                            onPageChanged: (_) => safeSetState(() {
                              _model.homePageViewLoadedLength = _model
                                  .homePageViewPagingController!
                                  .itemList!
                                  .length;
                            }),
                            scrollDirection: Axis.vertical,
                            builderDelegate:
                                PagedChildBuilderDelegate<QuotesRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) =>
                                  const QuoteCardShimmerWidget(),
                              // Customize what your widget looks like when it's loading another page.
                              newPageProgressIndicatorBuilder: (_) =>
                                  const QuoteCardShimmerWidget(),
                              noItemsFoundIndicatorBuilder: (_) =>
                                  const UserNoQuotesWidget(),
                              itemBuilder: (context, _, homePageViewIndex) {
                                final homePageViewQuotesRecord = _model
                                    .homePageViewPagingController!
                                    .itemList![homePageViewIndex];
                                return Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 2.0, 5.0, 0.0),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.55,
                                      constraints: const BoxConstraints(
                                        maxWidth: 700.0,
                                      ),
                                      decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 4.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: wrapWithModel(
                                              model: _model.quoteCardModels1
                                                  .getModel(
                                                homePageViewQuotesRecord
                                                    .reference.id,
                                                homePageViewIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: QuoteCardWidget(
                                                key: Key(
                                                  'Keyw0c_${homePageViewQuotesRecord.reference.id}',
                                                ),
                                                parentPage: 'homePage',
                                                quoteDoc:
                                                    homePageViewQuotesRecord,
                                                dash: _model.dashShow,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(1.0, 1.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(8.0),
                                                  bottomRight:
                                                      Radius.circular(8.0),
                                                  topLeft: Radius.circular(0.0),
                                                  topRight:
                                                      Radius.circular(0.0),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ToggleIcon(
                                                        onPressed: () async {
                                                          final likedByUsersElement =
                                                              currentUserReference
                                                                  ?.id;
                                                          final likedByUsersUpdate =
                                                              homePageViewQuotesRecord
                                                                      .likedByUsers
                                                                      .contains(
                                                                          likedByUsersElement)
                                                                  ? FieldValue
                                                                      .arrayRemove([
                                                                      likedByUsersElement
                                                                    ])
                                                                  : FieldValue
                                                                      .arrayUnion([
                                                                      likedByUsersElement
                                                                    ]);
                                                          await homePageViewQuotesRecord
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
                                                              'HOME_ToggleIcon_tnnm8nr1_ON_TOGGLE');
                                                          logFirebaseEvent(
                                                              'ToggleIcon_action_block');
                                                          await action_blocks
                                                              .likeQuoteActions(
                                                            context,
                                                            quoteDoc:
                                                                homePageViewQuotesRecord,
                                                          );
                                                        },
                                                        value: homePageViewQuotesRecord
                                                            .likedByUsers
                                                            .contains(
                                                                currentUserReference
                                                                    ?.id),
                                                        onIcon: Icon(
                                                          Icons
                                                              .favorite_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          size: 28.0,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons
                                                              .favorite_border_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 28.0,
                                                        ),
                                                      ),
                                                      SelectionArea(
                                                          child: Text(
                                                        formatNumber(
                                                          homePageViewQuotesRecord
                                                              .likedByUsers
                                                              .length,
                                                          formatType: FormatType
                                                              .compact,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      )),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets.all(7.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_PAGE_comment_icon_ON_TAP');
                                                            logFirebaseEvent(
                                                                'comment_icon_bottom_sheet');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          SizedBox(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.65,
                                                                        child:
                                                                            CommentThreadWidget(
                                                                          quoteDoc:
                                                                              homePageViewQuotesRecord,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .mode_comment_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 28.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          homePageViewQuotesRecord
                                                              .numComments,
                                                          formatType: FormatType
                                                              .compact,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 2.0)),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Builder(
                                                        builder: (context) =>
                                                            InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_PAGE_Icon_1k6tfz20_ON_TAP');
                                                            logFirebaseEvent(
                                                                'Icon_share');
                                                            await Share.share(
                                                              'toowize://toowize.com/quote/${homePageViewQuotesRecord.reference.id}',
                                                              sharePositionOrigin:
                                                                  getWidgetBoundingBox(
                                                                      context),
                                                            );
                                                          },
                                                          child: Icon(
                                                            Icons.ios_share,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 28.0,
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        ' ',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 2.0)),
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
                        ),
                      );
                    } else {
                      return Stack(
                        children: [
                          if (valueOrDefault<bool>(
                            (currentUserDocument?.followingUsers.toList() ??
                                        []).isEmpty,
                            true,
                          ))
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => wrapWithModel(
                                  model: _model.noUsersModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: const NoUsersWidget(),
                                ),
                              ),
                            ),
                          if (valueOrDefault<bool>(
                            (currentUserDocument?.followingUsers.toList() ??
                                        []).isNotEmpty,
                            false,
                          ))
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 53.0, 0.0, 0.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: PagedPageView<
                                        DocumentSnapshot<Object?>?,
                                        QuotesRecord>(
                                      pagingController:
                                          _model.setFollowingPageViewController(
                                        QuotesRecord.collection
                                            .whereIn(
                                                'posted_by',
                                                (currentUserDocument
                                                        ?.followingUsers
                                                        .toList() ??
                                                    []))
                                            .orderBy('created_time',
                                                descending: true),
                                      ),
                                      pageController: _model
                                              .followingPageViewController ??=
                                          PageController(
                                              initialPage: max(
                                                  0,
                                                  min(
                                                      0,
                                                      _model.followingPageViewLoadedLength -
                                                          1))),
                                      onPageChanged: (_) => safeSetState(() {
                                        _model.followingPageViewLoadedLength =
                                            _model
                                                .followingPageViewPagingController!
                                                .itemList!
                                                .length;
                                      }),
                                      scrollDirection: Axis.vertical,
                                      builderDelegate:
                                          PagedChildBuilderDelegate<
                                              QuotesRecord>(
                                        // Customize what your widget looks like when it's loading the first page.
                                        firstPageProgressIndicatorBuilder:
                                            (_) => const QuoteCardShimmerWidget(),
                                        // Customize what your widget looks like when it's loading another page.
                                        newPageProgressIndicatorBuilder: (_) =>
                                            const QuoteCardShimmerWidget(),
                                        noItemsFoundIndicatorBuilder: (_) =>
                                            const NoUsersWidget(),
                                        itemBuilder: (context, _,
                                            followingPageViewIndex) {
                                          final followingPageViewQuotesRecord =
                                              _model.followingPageViewPagingController!
                                                      .itemList![
                                                  followingPageViewIndex];
                                          return Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 2.0, 5.0, 0.0),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.55,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: wrapWithModel(
                                                          model: _model
                                                              .quoteCardModels2
                                                              .getModel(
                                                            followingPageViewQuotesRecord
                                                                .reference.id,
                                                            followingPageViewIndex,
                                                          ),
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              QuoteCardWidget(
                                                            key: Key(
                                                              'Keygeq_${followingPageViewQuotesRecord.reference.id}',
                                                            ),
                                                            parentPage:
                                                                'followingFeedPage',
                                                            quoteDoc:
                                                                followingPageViewQuotesRecord,
                                                            dash:
                                                                _model.dashShow,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              1.0, 1.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    8.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                ToggleIcon(
                                                                  onPressed:
                                                                      () async {
                                                                    final likedByUsersElement =
                                                                        currentUserReference
                                                                            ?.id;
                                                                    final likedByUsersUpdate = followingPageViewQuotesRecord
                                                                            .likedByUsers
                                                                            .contains(
                                                                                likedByUsersElement)
                                                                        ? FieldValue
                                                                            .arrayRemove([
                                                                            likedByUsersElement
                                                                          ])
                                                                        : FieldValue
                                                                            .arrayUnion([
                                                                            likedByUsersElement
                                                                          ]);
                                                                    await followingPageViewQuotesRecord
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
                                                                        'HOME_ToggleIcon_r21wcm5o_ON_TOGGLE');
                                                                    logFirebaseEvent(
                                                                        'ToggleIcon_action_block');
                                                                    await action_blocks
                                                                        .likeQuoteActions(
                                                                      context,
                                                                      quoteDoc:
                                                                          followingPageViewQuotesRecord,
                                                                    );
                                                                  },
                                                                  value: followingPageViewQuotesRecord
                                                                      .likedByUsers
                                                                      .contains(
                                                                          currentUserReference
                                                                              ?.id),
                                                                  onIcon: Icon(
                                                                    Icons
                                                                        .favorite_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent1,
                                                                    size: 28.0,
                                                                  ),
                                                                  offIcon: Icon(
                                                                    Icons
                                                                        .favorite_border_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 28.0,
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    formatNumber(
                                                                      followingPageViewQuotesRecord
                                                                          .likedByUsers
                                                                          .length,
                                                                      formatType:
                                                                          FormatType
                                                                              .compact,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              6.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_PAGE_comment_icon_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'comment_icon_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        useSafeArea:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return WebViewAware(
                                                                            child:
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(context).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: Padding(
                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                child: SizedBox(
                                                                                  height: MediaQuery.sizeOf(context).height * 0.65,
                                                                                  child: CommentThreadWidget(
                                                                                    quoteDoc: followingPageViewQuotesRecord,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .mode_comment_outlined,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          28.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  formatNumber(
                                                                    followingPageViewQuotesRecord
                                                                        .numComments,
                                                                    formatType:
                                                                        FormatType
                                                                            .compact,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height: 2.0)),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Builder(
                                                                  builder:
                                                                      (context) =>
                                                                          InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      logFirebaseEvent(
                                                                          'HOME_PAGE_PAGE_Icon_oh3d5t8j_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Icon_share');
                                                                      await Share
                                                                          .share(
                                                                        'toowize://toowize.com/quote/${followingPageViewQuotesRecord.reference.id}',
                                                                        sharePositionOrigin:
                                                                            getWidgetBoundingBox(context),
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .ios_share,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          28.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  ' ',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  height: 2.0)),
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 25.0)),
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
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(-1.0, 0.0),
                            child: FutureBuilder<CategoriesRecord>(
                              future: FFAppState().getCategoryDocument(
                                uniqueQueryKey:
                                    FFAppState().currentFeedCategoryRef?.id,
                                overrideCache: functions
                                    .clearCache(FFAppState().lastCache!),
                                requestFn: () =>
                                    CategoriesRecord.getDocumentOnce(
                                        FFAppState().currentFeedCategoryRef!),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const CurrentCategoryShimmerWidget();
                                }

                                final containerCategoriesRecord =
                                    snapshot.data!;

                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'HOME_PAGE_PAGE_Container_v7kgzrf9_ON_TAP');
                                    logFirebaseEvent('Container_navigate_to');

                                    context.goNamed(
                                      'homePage',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: const TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                          duration: Duration(milliseconds: 0),
                                        ),
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 84.0,
                                    constraints: const BoxConstraints(
                                      maxWidth: 170.0,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context).primary,
                                          FlutterFlowTheme.of(context).secondary
                                        ],
                                        stops: const [0.0, 1.0],
                                        begin: const AlignmentDirectional(-1.0, 0.0),
                                        end: const AlignmentDirectional(1.0, 0),
                                      ),
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          3.0, 0.0, 3.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Stack(
                                              children: [
                                                if (Theme.of(context)
                                                        .brightness ==
                                                    Brightness.light)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(5.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        containerCategoriesRecord
                                                            .categoryIcon,
                                                        width: 30.0,
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                  ),
                                                if (Theme.of(context)
                                                        .brightness ==
                                                    Brightness.dark)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(5.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        containerCategoriesRecord
                                                            .categoryIconWhite,
                                                        width: 30.0,
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 2.0, 2.0, 2.0),
                                              child: Text(
                                                containerCategoriesRecord
                                                    .categoryName,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
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
                          Expanded(
                            child: FutureBuilder<List<CategoriesRecord>>(
                              future: FFAppState().getAllCategories(
                                requestFn: () => queryCategoriesRecordOnce(
                                  queryBuilder: (categoriesRecord) =>
                                      categoriesRecord
                                          .where(
                                            'isDisabled',
                                            isEqualTo: false,
                                          )
                                          .orderBy('ranking'),
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return const CategoryRowShimmerWidget();
                                }
                                List<CategoriesRecord> rowCategoriesRecordList =
                                    snapshot.data!;

                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(
                                        rowCategoriesRecordList.length,
                                        (rowIndex) {
                                      final rowCategoriesRecord =
                                          rowCategoriesRecordList[rowIndex];
                                      return Visibility(
                                        visible: valueOrDefault<bool>(
                                          rowCategoriesRecord.reference !=
                                              FFAppState()
                                                  .currentFeedCategoryRef,
                                          true,
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_PAGE_Container_d2ph9ego_ON_TAP');
                                              var shouldSetState = false;
                                              logFirebaseEvent(
                                                  'Container_revenue_cat');
                                              final isEntitled =
                                                  await revenue_cat.isEntitled(
                                                          'TooWize Premium') ??
                                                      false;
                                              if (!isEntitled) {
                                                await revenue_cat
                                                    .loadOfferings();
                                              }

                                              if (!isEntitled) {
                                                if (rowCategoriesRecord
                                                        .reference ==
                                                    FFAppState()
                                                        .premiumQuotesCategoryRef) {
                                                  logFirebaseEvent(
                                                      'Container_bottom_sheet');
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    isDismissible: false,
                                                    useSafeArea: true,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            FocusManager
                                                                .instance
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
                                                                  0.85,
                                                              child:
                                                                  const PremiumPaywallWidget(),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));

                                                  if (shouldSetState) {
                                                    safeSetState(() {});
                                                  }
                                                  return;
                                                } else {
                                                  if (functions.isNumberInString(
                                                      getRemoteConfigString(
                                                          'categorySwitchAdIntervals'),
                                                      FFAppState()
                                                          .categorySwitches)) {
                                                    logFirebaseEvent(
                                                        'Container_ad_mob');

                                                    _model.interstitialAdSuccess =
                                                        await admob
                                                            .showInterstitialAd();

                                                    shouldSetState = true;
                                                    logFirebaseEvent(
                                                        'Container_ad_mob');
                                                    unawaited(
                                                      () async {
                                                        admob
                                                            .loadInterstitialAd(
                                                          "ca-app-pub-4396913314822848/4707868013",
                                                          "ca-app-pub-4396913314822848/5606016711",
                                                          false,
                                                        );
                                                      }(),
                                                    );
                                                  }
                                                }
                                              }
                                              logFirebaseEvent(
                                                  'Container_update_app_state');
                                              FFAppState().categorySwitches =
                                                  FFAppState()
                                                          .categorySwitches +
                                                      1;
                                              FFAppState()
                                                      .currentFeedCategoryRef =
                                                  rowCategoriesRecord.reference;
                                              safeSetState(() {});
                                              if (shouldSetState) {
                                                safeSetState(() {});
                                              }
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  rowCategoriesRecord
                                                      .categoryName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).divide(
                                      const SizedBox(width: 12.0),
                                      filterFn: (rowIndex) {
                                        final rowCategoriesRecord =
                                            rowCategoriesRecordList[rowIndex];
                                        return valueOrDefault<bool>(
                                          rowCategoriesRecord.reference !=
                                              FFAppState()
                                                  .currentFeedCategoryRef,
                                          true,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'HOME_PAGE_PAGE_Column_vkqbfjuv_ON_TAP');
                              logFirebaseEvent('Column_navigate_to');

                              context.pushNamed('categories');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.category_rounded,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 20.0,
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'See all',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ].divide(const SizedBox(width: 4.0)),
                      ),
                    ),
                  ),
                ),
                if (!revenue_cat.activeEntitlementIds
                    .contains('TooWize Premium'))
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.07,
                      decoration: const BoxDecoration(),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: FlutterFlowAdBanner(
                              showsTestAd: false,
                              iOSAdUnitID:
                                  'ca-app-pub-4396913314822848/6899966832',
                              androidAdUnitID:
                                  'ca-app-pub-4396913314822848/3670334112',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
