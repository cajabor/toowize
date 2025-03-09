import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/premium_paywall_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/admob_util.dart' as admob;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'category_card_model.dart';
export 'category_card_model.dart';

class CategoryCardWidget extends StatefulWidget {
  const CategoryCardWidget({
    super.key,
    required this.categoryDoc,
    bool? isFavorite,
  }) : isFavorite = isFavorite ?? false;

  final CategoriesRecord? categoryDoc;
  final bool isFavorite;

  @override
  State<CategoryCardWidget> createState() => _CategoryCardWidgetState();
}

class _CategoryCardWidgetState extends State<CategoryCardWidget>
    with TickerProviderStateMixin {
  late CategoryCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryCardModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CATEGORY_CARD_categoryCard_ON_INIT_STATE');
      logFirebaseEvent('categoryCard_update_component_state');
      _model.liked = widget.isFavorite;
      _model.updatePage(() {});
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0, -3.142),
            end: const Offset(0, 0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: const Offset(0, 0),
            end: const Offset(0, 3.142),
          ),
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 1.0,
            end: 0.0,
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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SizedBox(
      width: 177.0,
      height: 230.0,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
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
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).secondaryBackground,
                  FlutterFlowTheme.of(context).secondary
                ],
                stops: const [0.0, 1.0],
                begin: const AlignmentDirectional(0.0, -1.0),
                end: const AlignmentDirectional(0, 1.0),
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.categoryDoc!.categoryIcon,
                    fit: BoxFit.fitHeight,
                    alignment: const Alignment(0.0, 0.0),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Opacity(
                      opacity: 0.8,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 4.0),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 0.0, 8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'CATEGORY_CARD_closeDescriptionIcon_ON_TA');
                                      logFirebaseEvent(
                                          'closeDescriptionIcon_update_component_st');
                                      _model.isFlipped = false;
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'closeDescriptionIcon_widget_animation');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation2'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation2']!
                                            .controller
                                            .reverse();
                                      }
                                      logFirebaseEvent(
                                          'closeDescriptionIcon_widget_animation');
                                      if (animationsMap[
                                              'containerOnActionTriggerAnimation1'] !=
                                          null) {
                                        animationsMap[
                                                'containerOnActionTriggerAnimation1']!
                                            .controller
                                            .reverse();
                                      }
                                    },
                                    child: Icon(
                                      Icons.close_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    widget.categoryDoc?.categoryName,
                                    'oops, category not found, our bad',
                                  ),
                                  textAlign: TextAlign.center,
                                  minFontSize: 15.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 3.0, 0.0),
                                  child: AutoSizeText(
                                    valueOrDefault<String>(
                                      widget.categoryDoc?.description,
                                      'working on a description, one sec',
                                    ),
                                    minFontSize: 12.0,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ).animateOnActionTrigger(
            animationsMap['containerOnActionTriggerAnimation1']!,
          ),
          if (!_model.isFlipped)
            Container(
              width: double.infinity,
              height: double.infinity,
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
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).secondaryBackground,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: const [0.0, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 4.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  3.0, 3.0, 0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CATEGORY_CARD_COMP_Icon_zt0b2mos_ON_TAP');
                                  logFirebaseEvent('Icon_widget_animation');
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation2'] !=
                                      null) {
                                    animationsMap[
                                            'containerOnActionTriggerAnimation2']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  logFirebaseEvent('Icon_widget_animation');
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation1'] !=
                                      null) {
                                    animationsMap[
                                            'containerOnActionTriggerAnimation1']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  logFirebaseEvent(
                                      'Icon_update_component_state');
                                  _model.isFlipped = true;
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.info_outline_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            if (valueOrDefault<bool>(
                              widget.categoryDoc?.reference ==
                                  FFAppState().currentFeedCategoryRef,
                              false,
                            ))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 3.0, 0.0),
                                child: Icon(
                                  Icons.check_circle_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CATEGORY_CARD_Column_0cchu66p_ON_TAP');
                            var shouldSetState = false;
                            logFirebaseEvent('Column_revenue_cat');
                            final isEntitled = await revenue_cat
                                    .isEntitled('TooWize Premium') ??
                                false;
                            if (!isEntitled) {
                              await revenue_cat.loadOfferings();
                            }

                            if (!isEntitled) {
                              if (widget.categoryDoc?.reference ==
                                  FFAppState().premiumQuotesCategoryRef) {
                                logFirebaseEvent('Column_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  isDismissible: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.85,
                                          child: const PremiumPaywallWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                if (shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                if (functions.isNumberInString(
                                    getRemoteConfigString(
                                        'categorySwitchAdIntervals'),
                                    FFAppState().categorySwitches)) {
                                  logFirebaseEvent('Column_ad_mob');

                                  _model.interstitialAdSuccess =
                                      await admob.showInterstitialAd();

                                  shouldSetState = true;
                                  logFirebaseEvent('Column_ad_mob');
                                  unawaited(
                                    () async {
                                      admob.loadInterstitialAd(
                                        "ca-app-pub-4396913314822848/4707868013",
                                        "ca-app-pub-4396913314822848/5606016711",
                                        false,
                                      );
                                    }(),
                                  );
                                }
                              }
                            }
                            logFirebaseEvent('Column_update_app_state');
                            FFAppState().categorySwitches =
                                FFAppState().categorySwitches + 1;
                            FFAppState().currentFeedCategoryRef =
                                widget.categoryDoc?.reference;
                            _model.updatePage(() {});
                            logFirebaseEvent('Column_navigate_to');

                            context.goNamed('homePage');

                            if (shouldSetState) safeSetState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  decoration: const BoxDecoration(),
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Stack(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        if (valueOrDefault<bool>(
                                          Theme.of(context).brightness ==
                                              Brightness.light,
                                          true,
                                        ))
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              widget.categoryDoc!.categoryIcon,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.fitHeight,
                                              alignment: const Alignment(0.0, 0.0),
                                            ),
                                          ),
                                        if (Theme.of(context).brightness ==
                                            Brightness.dark)
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              widget.categoryDoc!
                                                  .categoryIconWhite,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.fitHeight,
                                              alignment: const Alignment(0.0, 0.0),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    4.0, 4.0, 0.0, 0.0),
                                child: AutoSizeText(
                                  valueOrDefault<String>(
                                    widget.categoryDoc?.categoryName,
                                    'oops category not found, our bad',
                                  ),
                                  textAlign: TextAlign.start,
                                  minFontSize: 14.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              3.0, 0.0, 0.0, 3.0),
                          child: Stack(
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'CATEGORY_CARD_COMP_Icon_w06hqht2_ON_TAP');
                                  logFirebaseEvent('Icon_backend_call');

                                  await currentUserReference!.update({
                                    ...mapToFirestore(
                                      {
                                        'favorite_categories':
                                            FieldValue.arrayUnion([
                                          widget.categoryDoc?.reference
                                        ]),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent(
                                      'Icon_update_component_state');
                                  _model.liked = true;
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.favorite_border,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 22.0,
                                ),
                              ),
                              if (_model.liked)
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'CATEGORY_CARD_COMP_Icon_8siaus95_ON_TAP');
                                    logFirebaseEvent('Icon_backend_call');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'favorite_categories':
                                              FieldValue.arrayRemove([
                                            widget.categoryDoc?.reference
                                          ]),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent(
                                        'Icon_update_component_state');
                                    _model.liked = false;
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.favorite_sharp,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 22.0,
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
            ).animateOnActionTrigger(
              animationsMap['containerOnActionTriggerAnimation2']!,
            ),
        ],
      ),
    );
  }
}
