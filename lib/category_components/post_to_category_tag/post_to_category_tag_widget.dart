import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'post_to_category_tag_model.dart';
export 'post_to_category_tag_model.dart';

class PostToCategoryTagWidget extends StatefulWidget {
  const PostToCategoryTagWidget({
    super.key,
    required this.categoryDoc,
  });

  final CategoriesRecord? categoryDoc;

  @override
  State<PostToCategoryTagWidget> createState() =>
      _PostToCategoryTagWidgetState();
}

class _PostToCategoryTagWidgetState extends State<PostToCategoryTagWidget>
    with TickerProviderStateMixin {
  late PostToCategoryTagModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostToCategoryTagModel());

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
                            const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 3.0),
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
                                      5.0, 5.0, 0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'POST_TO_CATEGORY_TAG_closeDescriptionIco');
                                      logFirebaseEvent(
                                          'closeDescriptionIcon_update_component_st');
                                      _model.isFlipped = false;
                                      safeSetState(() {});
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
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.categoryDoc?.categoryName,
                                      'oops, category not found, our bad',
                                    ),
                                    textAlign: TextAlign.center,
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
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      3.0, 0.0, 3.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.categoryDoc?.description,
                                      'working on a description, one sec',
                                    ),
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
                padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 3.0),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                                      'POST_TO_CATEGORY_TAG_infoIcon_ON_TAP');
                                  logFirebaseEvent('infoIcon_widget_animation');
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation2'] !=
                                      null) {
                                    animationsMap[
                                            'containerOnActionTriggerAnimation2']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  logFirebaseEvent('infoIcon_widget_animation');
                                  if (animationsMap[
                                          'containerOnActionTriggerAnimation1'] !=
                                      null) {
                                    animationsMap[
                                            'containerOnActionTriggerAnimation1']!
                                        .controller
                                        .forward(from: 0.0);
                                  }
                                  logFirebaseEvent(
                                      'infoIcon_update_component_state');
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
                            if (FFAppState()
                                .selectedCategories
                                .contains(widget.categoryDoc?.reference))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 3.0, 3.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'POST_TO_CATEGORY_TAG_Icon_hqtssqwf_ON_TA');
                                    logFirebaseEvent('Icon_update_app_state');
                                    FFAppState().removeFromSelectedCategories(
                                        widget.categoryDoc!.reference);
                                    FFAppState().numCategoriesSelected =
                                        FFAppState().numCategoriesSelected + -1;
                                    safeSetState(() {});
                                  },
                                  child: Icon(
                                    Icons.check_circle_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'POST_TO_CATEGORY_TAG_Column_pulvo0q5_ON_');
                            if (FFAppState()
                                .selectedCategories
                                .contains(widget.categoryDoc?.reference)) {
                              logFirebaseEvent('Column_update_app_state');
                              FFAppState().removeFromSelectedCategories(
                                  widget.categoryDoc!.reference);
                              FFAppState().numCategoriesSelected =
                                  FFAppState().numCategoriesSelected + -1;
                              safeSetState(() {});
                            } else {
                              logFirebaseEvent('Column_update_app_state');
                              FFAppState().addToSelectedCategories(
                                  widget.categoryDoc!.reference);
                              FFAppState().numCategoriesSelected =
                                  FFAppState().numCategoriesSelected + 1;
                              safeSetState(() {});
                            }
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 227.0,
                                height: 100.0,
                                decoration: const BoxDecoration(),
                                child: Stack(
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
                                        ),
                                      ),
                                    if (Theme.of(context).brightness ==
                                        Brightness.dark)
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          widget
                                              .categoryDoc!.categoryIconWhite,
                                          width: 300.0,
                                          height: 200.0,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      widget.categoryDoc?.categoryName,
                                      'oops category not found, our bad',
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
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
          if (!FFAppState()
                  .selectedCategories
                  .contains(widget.categoryDoc?.reference) &&
              (FFAppState().numCategoriesSelected == 2))
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xBC9C9393),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: Text(
                      'Max Categories Selected',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: FlutterFlowTheme.of(context).bodyMedium,
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
