import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cheating_user_positivity_message_model.dart';
export 'cheating_user_positivity_message_model.dart';

class CheatingUserPositivityMessageWidget extends StatefulWidget {
  const CheatingUserPositivityMessageWidget({super.key});

  @override
  State<CheatingUserPositivityMessageWidget> createState() =>
      _CheatingUserPositivityMessageWidgetState();
}

class _CheatingUserPositivityMessageWidgetState
    extends State<CheatingUserPositivityMessageWidget>
    with TickerProviderStateMixin {
  late CheatingUserPositivityMessageModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheatingUserPositivityMessageModel());

    animationsMap.addAll({
      'imageOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 920.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(2.0, 2.0),
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
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: Text(
              'A Message ',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    font: GoogleFonts.outfit(),
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Stack(
            alignment: const AlignmentDirectional(0.0, 0.0),
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Text(
                            'Dear $currentUserDisplayName,',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                      child: Text(
                        'We do not know if you landed here out of curiosity or if you genuinely wanted to report this user for infidelity. Whatever the case is, we want you to know that we are here for you no matter what. We value you as a wizer and even more, as a person. We want you to know you are royalty. Life on this space rock was never going to be easy, but the beauty is in the journey. Never forget: life is too short to not be smiling. Follow your heart, listen to your gut and use your brain. You dropped this 👑',
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: FlutterFlowTheme.of(context).bodyMedium,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Stay wize,',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: FlutterFlowTheme.of(context).bodyMedium,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Text(
                        'Your friendly neighborhood TooWize Team ❤️',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: FlutterFlowTheme.of(context).bodyMedium,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://media.giphy.com/media/yJFeycRK2DB4c/giphy.gif',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                ).animateOnActionTrigger(
                  animationsMap['imageOnActionTriggerAnimation']!,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () async {
                logFirebaseEvent('CHEATING_USER_POSITIVITY_MESSAGE_I_ACCEP');
                logFirebaseEvent('Button_widget_animation');
                if (animationsMap['imageOnActionTriggerAnimation'] != null) {
                  await animationsMap['imageOnActionTriggerAnimation']!
                      .controller
                      .forward(from: 0.0);
                }
                logFirebaseEvent('Button_wait__delay');
                await Future.delayed(const Duration(milliseconds: 1000));
                logFirebaseEvent('Button_navigate_back');
                context.safePop();
                logFirebaseEvent('Button_navigate_back');
                context.safePop();
                logFirebaseEvent('Button_navigate_back');
                context.safePop();
              },
              text: ' I accept this message of positivity',
              options: FFButtonOptions(
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
            ),
          ),
        ],
      ),
    );
  }
}
