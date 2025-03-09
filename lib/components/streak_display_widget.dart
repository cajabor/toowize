import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'streak_display_model.dart';
export 'streak_display_model.dart';

class StreakDisplayWidget extends StatefulWidget {
  const StreakDisplayWidget({super.key});

  @override
  State<StreakDisplayWidget> createState() => _StreakDisplayWidgetState();
}

class _StreakDisplayWidgetState extends State<StreakDisplayWidget>
    with TickerProviderStateMixin {
  late StreakDisplayModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StreakDisplayModel());

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 1450.0.ms,
            duration: 970.0.ms,
            color: const Color(0x80FFFFFF),
            angle: 0.524,
          ),
          ShakeEffect(
            curve: Curves.easeInOut,
            delay: 350.0.ms,
            duration: 1000.0.ms,
            hz: 10,
            offset: const Offset(0.0, 0.0),
            rotation: 0.087,
          ),
        ],
      ),
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 920.0.ms,
            begin: const Offset(-1.0, -1.0),
            end: const Offset(1.0, 1.0),
          ),
          RotateEffect(
            curve: Curves.easeOut,
            delay: 0.0.ms,
            duration: 920.0.ms,
            begin: 0.0,
            end: 3.0,
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
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.fire,
                          color: Color(0xFFECA63D),
                          size: 80.0,
                        ).animateOnPageLoad(
                            animationsMap['iconOnPageLoadAnimation']!),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => GradientText(
                                  valueOrDefault<String>(
                                    valueOrDefault(
                                            currentUserDocument?.streak, 0)
                                        .toString(),
                                    '1',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
                                      ),
                                  colors: [
                                    const Color(0xFFECA63D),
                                    FlutterFlowTheme.of(context).secondary
                                  ],
                                  gradientDirection: GradientDirection.ltr,
                                  gradientType: GradientType.linear,
                                ),
                              ),
                              GradientText(
                                'Days',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      letterSpacing: 0.0,
                                    ),
                                colors: [
                                  const Color(0xFFECA63D),
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                gradientDirection: GradientDirection.ttb,
                                gradientType: GradientType.linear,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      'Come back every day to grow your streak and get even wizer!',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: FlutterFlowTheme.of(context).bodyMedium,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'STREAK_DISPLAY_LETS_STREAK_BTN_ON_TAP');
                        logFirebaseEvent('Button_widget_animation');
                        if (animationsMap['imageOnActionTriggerAnimation'] !=
                            null) {
                          await animationsMap['imageOnActionTriggerAnimation']!
                              .controller
                              .forward(from: 0.0);
                        }
                        logFirebaseEvent('Button_wait__delay');
                        await Future.delayed(
                            const Duration(milliseconds: 1000));
                        logFirebaseEvent('Button_close_dialog_drawer_etc');
                        Navigator.pop(context);
                      },
                      text: 'Let\'s Streak!',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://media.giphy.com/media/yJFeycRK2DB4c/giphy.gif',
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ).animateOnActionTrigger(
                animationsMap['imageOnActionTriggerAnimation']!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
