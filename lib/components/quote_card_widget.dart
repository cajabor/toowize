import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/components/premium_paywall_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading_components/category_tag_shimmer/category_tag_shimmer_widget.dart';
import '/quote_options/my_quote_options/my_quote_options_widget.dart';
import '/quote_options/quote_card_options/quote_card_options_widget.dart';
import 'dart:async';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/admob_util.dart' as admob;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'quote_card_model.dart';
export 'quote_card_model.dart';

class QuoteCardWidget extends StatefulWidget {
  const QuoteCardWidget({
    super.key,
    required this.quoteDoc,
    this.parentPage,
    bool? dash,
  }) : dash = dash ?? false;

  final QuotesRecord? quoteDoc;
  final String? parentPage;
  final bool dash;

  @override
  State<QuoteCardWidget> createState() => _QuoteCardWidgetState();
}

class _QuoteCardWidgetState extends State<QuoteCardWidget>
    with TickerProviderStateMixin {
  late QuoteCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuoteCardModel());

    _model.switchValue1 = widget.quoteDoc!.qotdEligible;
    _model.switchValue2 = widget.quoteDoc!.categoriesPostedTo
        .contains(FFAppState().recommendedCategoryRef);
    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 750.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(1.0, 1.0),
          ),
          ScaleEffect(
            curve: Curves.easeOut,
            delay: 630.0.ms,
            duration: 340.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.0, 0.0),
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

    return Container(
      constraints: const BoxConstraints(
        maxHeight: 500.0,
      ),
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Align(
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  boxShadow: [
                    BoxShadow(
                      color: valueOrDefault<Color>(
                        widget.parentPage == 'QOTD'
                            ? const Color(0xB8E9B135)
                            : const Color(0x33000000),
                        const Color(0x33000000),
                      ),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0),
                  ),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'QUOTE_CARD_CircleImage_rk7klufw_ON_TAP');
                              logFirebaseEvent('CircleImage_expand_image');
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: Image.network(
                                      valueOrDefault<String>(
                                        widget.quoteDoc?.snippetPhotoUrl,
                                        'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    tag: valueOrDefault<String>(
                                      widget.quoteDoc?.snippetPhotoUrl,
                                      'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                    ),
                                    useHeroAnimation: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: valueOrDefault<String>(
                                widget.quoteDoc?.snippetPhotoUrl,
                                'https://clipground.com/images/profile-placeholder-clipart-1.png',
                              ),
                              transitionOnUserGestures: true,
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    widget.quoteDoc?.snippetPhotoUrl,
                                    'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'QUOTE_CARD_COMP_Text_fak86nd5_ON_TAP');
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed(
                                'userDetailPage',
                                pathParameters: {
                                  'userDetailRef': serializeParam(
                                    widget.quoteDoc?.postedBy,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Text(
                              valueOrDefault<String>(
                                widget.quoteDoc?.snippetDisplayName,
                                'user name',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.keyboard_control,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'QUOTE_CARD_keyboard_control_ICN_ON_TAP');
                            if (widget.quoteDoc?.postedBy ==
                                currentUserReference) {
                              logFirebaseEvent('IconButton_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.4,
                                        child: MyQuoteOptionsWidget(
                                          quoteDoc: widget.quoteDoc!,
                                          parentOfContainingPage:
                                              widget.parentPage,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else {
                              logFirebaseEvent('IconButton_bottom_sheet');
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.3,
                                        child: QuoteCardOptionsWidget(
                                          quoteDoc: widget.quoteDoc!,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          },
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onDoubleTap: () async {
                            logFirebaseEvent(
                                'QUOTE_CARD_Stack_wkdq4we0_ON_DOUBLE_TAP');
                            logFirebaseEvent('Stack_widget_animation');
                            if (animationsMap['iconOnActionTriggerAnimation'] !=
                                null) {
                              animationsMap['iconOnActionTriggerAnimation']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            logFirebaseEvent('Stack_haptic_feedback');
                            HapticFeedback.mediumImpact();
                            logFirebaseEvent('Stack_action_block');
                            await action_blocks.likeQuoteActions(
                              context,
                              quoteDoc: widget.quoteDoc,
                            );
                            logFirebaseEvent('Stack_backend_call');

                            await widget.quoteDoc!.reference.update({
                              ...mapToFirestore(
                                {
                                  'liked_by_users':
                                      FieldValue.arrayUnion([currentUserUid]),
                                },
                              ),
                            });
                          },
                          child: Stack(
                            children: [
                              if (valueOrDefault<bool>(
                                widget.quoteDoc?.backgroundImage == null ||
                                    widget.quoteDoc?.backgroundImage == '',
                                true,
                              ))
                                Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 60.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                widget.quoteDoc?.quoteText,
                                                'quote text',
                                              ),
                                              textAlign: TextAlign.center,
                                              minFontSize: 14.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    font: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    fontSize: 25.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w100,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        if (valueOrDefault<bool>(
                                          widget.quoteDoc?.context,
                                          false,
                                        ))
                                          Flexible(
                                            flex: 2,
                                            child: Container(
                                              width: double.infinity,
                                              height: 100.0,
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Expanded(
                                                        flex: 4,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      3.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.45,
                                                            height: 2.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                ],
                                                                stops: const [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0),
                                                                end:
                                                                    const AlignmentDirectional(
                                                                        1.0, 0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Container(
                                                          width: 8.0,
                                                          height: 8.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 4,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      3.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.45,
                                                            height: 2.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                ],
                                                                stops: const [
                                                                  0.0,
                                                                  1.0
                                                                ],
                                                                begin:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                end:
                                                                    const AlignmentDirectional(
                                                                        -1.0,
                                                                        0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      widget
                                                          .quoteDoc?.contextBy,
                                                      'author',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          fontSize: 25.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                  if (valueOrDefault<bool>(
                                                    widget.quoteDoc
                                                                ?.contextBackground !=
                                                            null &&
                                                        widget.quoteDoc
                                                                ?.contextBackground !=
                                                            '',
                                                    false,
                                                  ))
                                                    Text(
                                                      valueOrDefault<String>(
                                                        widget.quoteDoc
                                                            ?.contextBackground,
                                                        'context',
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
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
                              if (valueOrDefault<bool>(
                                widget.quoteDoc?.backgroundImage != null &&
                                    widget.quoteDoc?.backgroundImage != '',
                                false,
                              ))
                                Stack(
                                  children: [
                                    OctoImage(
                                      placeholderBuilder: (_) =>
                                          SizedBox.expand(
                                        child: Image(
                                          image: BlurHashImage(
                                              valueOrDefault<String>(
                                            widget.quoteDoc
                                                ?.backgroundImageBlurHash,
                                            'LdCG.Fx[M|xu*0W=M|W=%#t6aJoz',
                                          )),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      image: NetworkImage(
                                        widget.quoteDoc!.backgroundImage,
                                      ),
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            4.0, 80.0, 4.0, 4.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Flexible(
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: const BoxDecoration(
                                                    color: Color(0x97000000),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(8.0),
                                                      topRight:
                                                          Radius.circular(8.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(2.0),
                                                    child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        widget.quoteDoc
                                                            ?.quoteText,
                                                        'quote text',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      minFontSize: 12.0,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    valueOrDefault<
                                                                        double>(
                                                                  () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 18.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 20.0;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 20.0;
                                                                    } else {
                                                                      return 25.0;
                                                                    }
                                                                  }(),
                                                                  20.0,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w200,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (widget.quoteDoc?.context ??
                                                  true)
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    2.0,
                                                                    0.0,
                                                                    2.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.45,
                                                                  height: 2.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary
                                                                      ],
                                                                      stops: const [
                                                                        0.0,
                                                                        1.0
                                                                      ],
                                                                      begin: const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                      end: const AlignmentDirectional(
                                                                          1.0,
                                                                          0),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                width: 8.0,
                                                                height: 8.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            3.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.45,
                                                                  height: 2.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary
                                                                      ],
                                                                      stops: const [
                                                                        0.0,
                                                                        1.0
                                                                      ],
                                                                      begin: const AlignmentDirectional(
                                                                          1.0,
                                                                          0.0),
                                                                      end: const AlignmentDirectional(
                                                                          -1.0,
                                                                          0),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0x97000000),
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
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  2.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              AutoSizeText(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .quoteDoc
                                                                      ?.contextBy,
                                                                  'author',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                maxLines: 1,
                                                                minFontSize:
                                                                    12.0,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                      color: const Color(
                                                                          0xFF3FACB5),
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                    ),
                                                              ),
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                widget.quoteDoc
                                                                            ?.contextBackground !=
                                                                        null &&
                                                                    widget.quoteDoc
                                                                            ?.contextBackground !=
                                                                        '',
                                                                false,
                                                              ))
                                                                AutoSizeText(
                                                                  widget
                                                                      .quoteDoc!
                                                                      .contextBackground,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  maxLines: 1,
                                                                  minFontSize:
                                                                      11.0,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent3,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                      ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        2.0, 2.0, 2.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, -1.0),
                                          child: Builder(
                                            builder: (context) {
                                              final categoryTags = (widget
                                                          .quoteDoc
                                                          ?.categoriesPostedTo
                                                          .toList() ??
                                                      [])
                                                  .take(4)
                                                  .toList();

                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: List.generate(
                                                    categoryTags.length,
                                                    (categoryTagsIndex) {
                                                  final categoryTagsItem =
                                                      categoryTags[
                                                          categoryTagsIndex];
                                                  return FutureBuilder<
                                                      CategoriesRecord>(
                                                    future: FFAppState()
                                                        .getCategoryDocument(
                                                      uniqueQueryKey:
                                                          categoryTagsItem.id,
                                                      overrideCache:
                                                          functions.clearCache(
                                                              FFAppState()
                                                                  .lastCache!),
                                                      requestFn: () =>
                                                          CategoriesRecord
                                                              .getDocumentOnce(
                                                                  categoryTagsItem),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return const Center(
                                                          child:
                                                              CategoryTagShimmerWidget(),
                                                        );
                                                      }

                                                      final containerCategoriesRecord =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Visibility(
                                                          visible:
                                                              !valueOrDefault<
                                                                  bool>(
                                                            containerCategoriesRecord
                                                                .isDisabled,
                                                            true,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                    3.0),
                                                            child: InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                logFirebaseEvent(
                                                                    'QUOTE_CARD_Container_ipif0pyl_ON_TAP');
                                                                var shouldSetState =
                                                                    false;
                                                                logFirebaseEvent(
                                                                    'Container_revenue_cat');
                                                                final isEntitled =
                                                                    await revenue_cat
                                                                            .isEntitled('TooWize Premium') ??
                                                                        false;
                                                                if (!isEntitled) {
                                                                  await revenue_cat
                                                                      .loadOfferings();
                                                                }

                                                                if (!isEntitled) {
                                                                  if (categoryTagsItem ==
                                                                      FFAppState()
                                                                          .premiumQuotesCategoryRef) {
                                                                    logFirebaseEvent(
                                                                        'Container_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      isDismissible:
                                                                          false,
                                                                      useSafeArea:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                SizedBox(
                                                                              height: MediaQuery.sizeOf(context).height * 0.85,
                                                                              child: const PremiumPaywallWidget(),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));

                                                                    if (shouldSetState) {
                                                                      safeSetState(
                                                                          () {});
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

                                                                      shouldSetState =
                                                                          true;
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
                                                                FFAppState()
                                                                        .currentFeedCategoryRef =
                                                                    categoryTagsItem;
                                                                _model
                                                                    .updatePage(
                                                                        () {});
                                                                logFirebaseEvent(
                                                                    'Container_navigate_to');

                                                                context.goNamed(
                                                                    'homePage');

                                                                if (shouldSetState) {
                                                                  safeSetState(
                                                                      () {});
                                                                }
                                                              },
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            17.0),
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.15,
                                                                  height: 35.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        FlutterFlowTheme.of(context)
                                                                            .secondary
                                                                      ],
                                                                      stops: const [
                                                                        0.0,
                                                                        1.0
                                                                      ],
                                                                      begin: const AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                      end: const AlignmentDirectional(
                                                                          1.0,
                                                                          0),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            17.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            3.0),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(17.0),
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          if (Theme.of(context).brightness ==
                                                                              Brightness.light)
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  containerCategoriesRecord.categoryIcon,
                                                                                  width: 300.0,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.fitHeight,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (Theme.of(context).brightness ==
                                                                              Brightness.dark)
                                                                            Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 2.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  containerCategoriesRecord.categoryIconWhite,
                                                                                  width: 300.0,
                                                                                  height: 200.0,
                                                                                  fit: BoxFit.fitHeight,
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
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                        Flexible(
                                          child: SelectionArea(
                                              child: AutoSizeText(
                                            getRemoteConfigString(
                                                'tooWizeSocialTag'),
                                            minFontSize: 11.0,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 13.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.6,
                                    child: Icon(
                                      Icons.format_quote_sharp,
                                      color: valueOrDefault<Color>(
                                        widget.quoteDoc?.backgroundImage !=
                                                    null &&
                                                widget.quoteDoc
                                                        ?.backgroundImage !=
                                                    ''
                                            ? FlutterFlowTheme.of(context)
                                                .warning
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.favorite_rounded,
                                  color: FlutterFlowTheme.of(context).accent1,
                                  size: 150.0,
                                ).animateOnActionTrigger(
                                  animationsMap[
                                      'iconOnActionTriggerAnimation']!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (widget.dash)
            Container(
              width: double.infinity,
              height: 81.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).primaryBtnText,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  'quote_ID: ${widget.quoteDoc?.reference.id}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        letterSpacing: 0.0,
                                      ),
                                )),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'QUOTE_CARD_COMP_Icon_hbh53drh_ON_TAP');
                                  logFirebaseEvent('Icon_copy_to_clipboard');
                                  await Clipboard.setData(ClipboardData(
                                      text: widget.quoteDoc!.reference.id));
                                },
                                child: Icon(
                                  Icons.content_copy_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 15.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.0, 0.0),
                                child: SelectionArea(
                                    child: Text(
                                  'user_ID: ${widget.quoteDoc?.postedBy?.id}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        letterSpacing: 0.0,
                                      ),
                                )),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'QUOTE_CARD_COMP_Icon_2fgt3mk6_ON_TAP');
                                  logFirebaseEvent('Icon_copy_to_clipboard');
                                  await Clipboard.setData(ClipboardData(
                                      text: widget.quoteDoc!.postedBy!.id));
                                },
                                child: Icon(
                                  Icons.content_copy_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'QUOTE_CARD_COMP_Icon_tia5064b_ON_TAP');
                            while (true) {
                              logFirebaseEvent('Icon_ad_mob');

                              _model.interstitialAdSuccess2 =
                                  await admob.showInterstitialAd();

                              logFirebaseEvent('Icon_ad_mob');

                              admob.loadInterstitialAd(
                                "ca-app-pub-4396913314822848/4707868013",
                                "ca-app-pub-4396913314822848/5606016711",
                                false,
                              );

                              logFirebaseEvent('Icon_wait__delay');
                              await Future.delayed(
                                  const Duration(milliseconds: 121876));
                              logFirebaseEvent('Icon_ad_mob');

                              _model.interstitialAdSuccess3 =
                                  await admob.showInterstitialAd();

                              logFirebaseEvent('Icon_ad_mob');

                              admob.loadInterstitialAd(
                                "ca-app-pub-4396913314822848/4707868013",
                                "ca-app-pub-4396913314822848/5606016711",
                                false,
                              );

                              logFirebaseEvent('Icon_wait__delay');
                              await Future.delayed(
                                  const Duration(milliseconds: 183457));
                            }

                            safeSetState(() {});
                          },
                          child: const Icon(
                            Icons.replay_circle_filled_outlined,
                            color: Color(0xFF377474),
                            size: 24.0,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'QD',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue1!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue1 = newValue);
                                if (newValue) {
                                  logFirebaseEvent(
                                      'QUOTE_CARD_Switch_8f9dpn6l_ON_TOGGLE_ON');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.quoteDoc!.reference
                                      .update(createQuotesRecordData(
                                    qotdEligible: true,
                                  ));
                                } else {
                                  logFirebaseEvent(
                                      'QUOTE_CARD_Switch_8f9dpn6l_ON_TOGGLE_OFF');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.quoteDoc!.reference
                                      .update(createQuotesRecordData(
                                    qotdEligible: false,
                                  ));
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'RD',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Switch.adaptive(
                              value: _model.switchValue2!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.switchValue2 = newValue);
                                if (newValue) {
                                  logFirebaseEvent(
                                      'QUOTE_CARD_Switch_mycxgar6_ON_TOGGLE_ON');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.quoteDoc!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'categories_posted_to':
                                            FieldValue.arrayUnion([
                                          FFAppState().recommendedCategoryRef
                                        ]),
                                      },
                                    ),
                                  });
                                } else {
                                  logFirebaseEvent(
                                      'QUOTE_CARD_Switch_mycxgar6_ON_TOGGLE_OFF');
                                  logFirebaseEvent('Switch_backend_call');

                                  await widget.quoteDoc!.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'categories_posted_to':
                                            FieldValue.arrayRemove([
                                          FFAppState().recommendedCategoryRef
                                        ]),
                                      },
                                    ),
                                  });
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).accent1,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                            ),
                          ],
                        ),
                        FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: 10.0,
                          borderWidth: 1.0,
                          buttonSize: 20.0,
                          fillColor: FlutterFlowTheme.of(context).accent1,
                          icon: FaIcon(
                            FontAwesomeIcons.solidTrashAlt,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 5.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'QUOTE_CARD_COMP_solidTrashAlt_ICN_ON_TAP');
                            logFirebaseEvent('IconButton_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: const Text(
                                            'Are you sure you want to delete this quote?'),
                                        content: const Text(
                                            'Are you sure you want to delete this quote?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, false),
                                            child: const Text('Naa, nevermind'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, true),
                                            child: const Text('Yes'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              logFirebaseEvent('IconButton_cloud_function');
                              try {
                                final result = await FirebaseFunctions.instance
                                    .httpsCallable('deleteQuoteSubcollection')
                                    .call({
                                  "quoteID": widget.quoteDoc!.reference.id,
                                  "subcollectionName": 'liked_users',
                                });
                                _model.deleteSubcollectionReturn =
                                    DeleteQuoteSubcollectionCloudFunctionCallResponse(
                                  data: result.data,
                                  succeeded: true,
                                  resultAsString: result.data.toString(),
                                  jsonBody: result.data,
                                );
                              } on FirebaseFunctionsException catch (error) {
                                _model.deleteSubcollectionReturn =
                                    DeleteQuoteSubcollectionCloudFunctionCallResponse(
                                  errorCode: error.code,
                                  succeeded: false,
                                );
                              }

                              logFirebaseEvent('IconButton_backend_call');
                              await widget.quoteDoc!.reference.delete();
                              logFirebaseEvent('IconButton_show_snack_bar');
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Quote deleted successfully',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).success,
                                ),
                              );
                            }

                            safeSetState(() {});
                          },
                        ),
                      ],
                    ),
                    Builder(
                      builder: (context) {
                        final categoriesDash =
                            widget.quoteDoc?.categoriesPostedTo.toList() ??
                                [];

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(categoriesDash.length,
                              (categoriesDashIndex) {
                            final categoriesDashItem =
                                categoriesDash[categoriesDashIndex];
                            return FutureBuilder<CategoriesRecord>(
                              future: CategoriesRecord.getDocumentOnce(
                                  categoriesDashItem),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitFadingFour(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }

                                final containerCategoriesRecord =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          containerCategoriesRecord
                                              .categoryIcon,
                                          width: 25.0,
                                          height: 25.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          logFirebaseEvent(
                                              'QUOTE_CARD_COMP_Icon_jnxiw3l4_ON_TAP');
                                          logFirebaseEvent('Icon_alert_dialog');
                                          var confirmDialogResponse =
                                              await showDialog<bool>(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          title: const Text(
                                                              'Remove this category?'),
                                                          content: const Text(
                                                              'Are you sure you want to remove this category from this quote?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: const Text(
                                                                  'Cancel'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: const Text(
                                                                  'Confirm'),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                          if (confirmDialogResponse) {
                                            logFirebaseEvent(
                                                'Icon_backend_call');

                                            await widget.quoteDoc!.reference
                                                .update({
                                              ...mapToFirestore(
                                                {
                                                  'categories_posted_to':
                                                      FieldValue.arrayRemove(
                                                          [categoriesDashItem]),
                                                },
                                              ),
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove_circle,
                                          color: FlutterFlowTheme.of(context)
                                              .accent1,
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }).divide(const SizedBox(width: 30.0)),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
