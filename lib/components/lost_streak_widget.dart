import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/admob_util.dart' as admob;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'lost_streak_model.dart';
export 'lost_streak_model.dart';

class LostStreakWidget extends StatefulWidget {
  const LostStreakWidget({
    super.key,
    required this.streak,
  });

  final int? streak;

  @override
  State<LostStreakWidget> createState() => _LostStreakWidgetState();
}

class _LostStreakWidgetState extends State<LostStreakWidget>
    with TickerProviderStateMixin {
  late LostStreakModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LostStreakModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 1510.0.ms,
            duration: 370.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 130.0.ms,
            duration: 1070.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400.0,
          maxHeight: 400.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: const AlignmentDirectional(1.0, -1.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('LOST_STREAK_COMP_Icon_ckr5br4j_ON_TAP');
                    logFirebaseEvent('Icon_close_dialog_drawer_etc');
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 34.0,
                  ),
                ).animateOnPageLoad(animationsMap['iconOnPageLoadAnimation']!),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.fire,
                    color: Color(0xFF3DECC9),
                    size: 54.0,
                  ),
                  GradientText(
                    widget.streak!.toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: FlutterFlowTheme.of(context).bodyMedium,
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                        ),
                    colors: [
                      const Color(0xFF3DECC9),
                      FlutterFlowTheme.of(context).secondary
                    ],
                    gradientDirection: GradientDirection.ltr,
                    gradientType: GradientType.linear,
                  ),
                ].divide(const SizedBox(width: 5.0)),
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GradientText(
                      'Oh No!',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: FlutterFlowTheme.of(context).bodyMedium,
                            fontSize: 32.0,
                            letterSpacing: 0.0,
                          ),
                      colors: [
                        const Color(0xFF3DECC9),
                        FlutterFlowTheme.of(context).secondary
                      ],
                      gradientDirection: GradientDirection.ltr,
                      gradientType: GradientType.linear,
                    ),
                  ].divide(const SizedBox(width: 4.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Text(
                  'It looks like you\'re about to lose your ${widget.streak?.toString()} day streak! Watch a short video to save it!',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: FlutterFlowTheme.of(context).bodyMedium,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('LOST_STREAK_SAVE_MY_STREAK_BTN_ON_TAP');
                    logFirebaseEvent('Button_close_dialog_drawer_etc');
                    Navigator.pop(context);
                    logFirebaseEvent('Button_ad_mob');
                    unawaited(
                      () async {
                        _model.interstitialAdSuccess =
                            await admob.showInterstitialAd();
                      }(),
                    );
                    logFirebaseEvent('Button_ad_mob');
                    unawaited(
                      () async {
                        admob.loadInterstitialAd(
                          "ca-app-pub-4396913314822848/4707868013",
                          "ca-app-pub-4396913314822848/5606016711",
                          false,
                        );
                      }(),
                    );
                    logFirebaseEvent('Button_backend_call');

                    await currentUserReference!.update(createUsersRecordData(
                      streak: widget.streak,
                    ));

                    safeSetState(() {});
                  },
                  text: 'Save my streak',
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).tertiary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: FlutterFlowTheme.of(context).titleSmall,
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  showLoadingIndicator: false,
                ),
              ),
            ].divide(const SizedBox(height: 10.0)),
          ),
        ),
      ),
    );
  }
}
