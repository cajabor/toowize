import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifications_settings_model.dart';
export 'notifications_settings_model.dart';

class NotificationsSettingsWidget extends StatefulWidget {
  const NotificationsSettingsWidget({super.key});

  @override
  State<NotificationsSettingsWidget> createState() =>
      _NotificationsSettingsWidgetState();
}

class _NotificationsSettingsWidgetState
    extends State<NotificationsSettingsWidget> {
  late NotificationsSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsSettingsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'notificationsSettings'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
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
            logFirebaseEvent('NOTIFICATIONS_SETTINGS_chevron_left_roun');
            logFirebaseEvent('IconButton_navigate_back');
            context.pop();
          },
        ),
        title: Text(
          'Notifications settings',
          style: FlutterFlowTheme.of(context).headlineSmall.override(
                font: FlutterFlowTheme.of(context).headlineSmall,
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
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          'Choose what notifcations you would like to recieve below.',
                          style: FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                                font: FlutterFlowTheme.of(context).labelMedium,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (getRemoteConfigBool('QOTDShowSetting'))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 0.0),
                    child: Material(
                      color: Colors.transparent,
                      child: SwitchListTile.adaptive(
                        value: _model.switchListTileValue ??=
                            FFAppState().QOTDNotifications,
                        onChanged: (newValue) async {
                          safeSetState(
                              () => _model.switchListTileValue = newValue);
                          if (newValue) {
                            logFirebaseEvent(
                                'NOTIFICATIONS_SETTINGS_SwitchListTile_bc');
                            logFirebaseEvent('SwitchListTile_custom_action');
                            _model.subSuccess =
                                await actions.subscribeToQOTDTopic();
                            if (_model.subSuccess!) {
                              logFirebaseEvent(
                                  'SwitchListTile_update_app_state');
                              FFAppState().QOTDNotifications = true;
                            } else {
                              logFirebaseEvent('SwitchListTile_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Unable to enable QOTD notifications. Please try again later.',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              );
                            }

                            safeSetState(() {});
                          } else {
                            logFirebaseEvent(
                                'NOTIFICATIONS_SETTINGS_SwitchListTile_bc');
                            logFirebaseEvent('SwitchListTile_custom_action');
                            _model.unSubSuccess =
                                await actions.unsubscribeFromQOTDTopic();
                            if (_model.unSubSuccess!) {
                              logFirebaseEvent(
                                  'SwitchListTile_update_app_state');
                              FFAppState().QOTDNotifications = false;
                            } else {
                              logFirebaseEvent('SwitchListTile_show_snack_bar');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Unable to turn off QOTD notifications',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                              );
                            }

                            safeSetState(() {});
                          }
                        },
                        title: Text(
                          'QOTD Notifications',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: FlutterFlowTheme.of(context).bodyLarge,
                                letterSpacing: 0.0,
                                lineHeight: 2.0,
                              ),
                        ),
                        subtitle: Text(
                          'Receive push notifications when the TooWize Quote Of The Day drops.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: FlutterFlowTheme.of(context).bodyMedium,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).tertiary,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Material(
                      color: Colors.transparent,
                      child: SwitchListTile.adaptive(
                        value: _model.likesSwitchValue ??= currentUserDocument!
                            .settings.likesMilestonesNotifications,
                        onChanged: (newValue) async {
                          safeSetState(
                              () => _model.likesSwitchValue = newValue);
                        },
                        title: Text(
                          'Quote likes milestones',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: FlutterFlowTheme.of(context).bodyLarge,
                                letterSpacing: 0.0,
                                lineHeight: 2.0,
                              ),
                        ),
                        subtitle: Text(
                          'Receive push notifications when your quote reaches certain numbers of likes.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: FlutterFlowTheme.of(context).bodyMedium,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).tertiary,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Material(
                      color: Colors.transparent,
                      child: SwitchListTile.adaptive(
                        value: _model.commentsSwitchValue ??=
                            currentUserDocument!.settings.commentNotifications,
                        onChanged: (newValue) async {
                          safeSetState(
                              () => _model.commentsSwitchValue = newValue);
                        },
                        title: Text(
                          'Comments',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: FlutterFlowTheme.of(context).bodyLarge,
                                letterSpacing: 0.0,
                                lineHeight: 2.0,
                              ),
                        ),
                        subtitle: Text(
                          'Receive push notifications when someone comments on your quote.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: FlutterFlowTheme.of(context).bodyMedium,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).tertiary,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Material(
                      color: Colors.transparent,
                      child: SwitchListTile.adaptive(
                        value: _model.followerSwitchValue ??=
                            currentUserDocument!.settings.followerNotfications,
                        onChanged: (newValue) async {
                          safeSetState(
                              () => _model.followerSwitchValue = newValue);
                        },
                        title: Text(
                          'New follower',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: FlutterFlowTheme.of(context).bodyLarge,
                                letterSpacing: 0.0,
                                lineHeight: 2.0,
                              ),
                        ),
                        subtitle: Text(
                          'Receive push notifications when someone starts following you.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: FlutterFlowTheme.of(context).bodyMedium,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).tertiary,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(5.0, 12.0, 5.0, 0.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Material(
                      color: Colors.transparent,
                      child: SwitchListTile.adaptive(
                        value: _model.commentReplySwitchValue ??=
                            currentUserDocument!
                                .settings.commentReplyNotifications,
                        onChanged: (newValue) async {
                          safeSetState(
                              () => _model.commentReplySwitchValue = newValue);
                        },
                        title: Text(
                          'Comment replies',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: FlutterFlowTheme.of(context).bodyLarge,
                                letterSpacing: 0.0,
                                lineHeight: 2.0,
                              ),
                        ),
                        subtitle: Text(
                          'Receive push notifications when someone replies to your comment.',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                font: FlutterFlowTheme.of(context).bodyMedium,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        tileColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        activeColor: FlutterFlowTheme.of(context).primary,
                        activeTrackColor: FlutterFlowTheme.of(context).tertiary,
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 24.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'NOTIFICATIONS_SETTINGS_Button-Login_ON_T');
                      logFirebaseEvent('Button-Login_backend_call');

                      await currentUserReference!.update(createUsersRecordData(
                        settings: createSettingsStruct(
                          likesMilestonesNotifications: _model.likesSwitchValue,
                          commentNotifications: _model.commentsSwitchValue,
                          followerNotfications: _model.followerSwitchValue,
                          commentReplyNotifications:
                              _model.commentReplySwitchValue,
                          clearUnsetFields: false,
                        ),
                      ));
                      logFirebaseEvent('Button-Login_show_snack_bar');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Notification settings updated!',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).success,
                        ),
                      );
                      logFirebaseEvent('Button-Login_navigate_back');
                      context.safePop();
                    },
                    text: 'Save changes',
                    options: FFButtonOptions(
                      width: 190.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                      borderRadius: BorderRadius.circular(12.0),
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
