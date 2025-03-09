import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/user_options_widget.dart';
import '/empty_list_components/user_no_quotes/user_no_quotes_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_management/onboarding/verify_email/verify_email_widget.dart';
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:octo_image/octo_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'user_detail_page_model.dart';
export 'user_detail_page_model.dart';

class UserDetailPageWidget extends StatefulWidget {
  const UserDetailPageWidget({
    super.key,
    required this.userDetailRef,
  });

  final DocumentReference? userDetailRef;

  @override
  State<UserDetailPageWidget> createState() => _UserDetailPageWidgetState();
}

class _UserDetailPageWidgetState extends State<UserDetailPageWidget> {
  late UserDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserDetailPageModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'userDetailPage'});
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
              logFirebaseEvent('USER_DETAIL_chevron_left_rounded_ICN_ON_');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: FutureBuilder<UsersRecord>(
            future:
                (_model.documentRequestCompleter ??= Completer<UsersRecord>()
                      ..complete(
                          UsersRecord.getDocumentOnce(widget.userDetailRef!)))
                    .future,
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

              final userDetailContainerUsersRecord = snapshot.data!;

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (valueOrDefault<bool>(
                        userDetailContainerUsersRecord.reference !=
                            currentUserReference,
                        false,
                      ))
                        Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'USER_DETAIL_Icon_jidpr6py_ON_TAP');
                                logFirebaseEvent('Icon_bottom_sheet');
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
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.3,
                                            child: UserOptionsWidget(
                                              userDoc:
                                                  userDetailContainerUsersRecord,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.keyboard_control,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'USER_DETAIL_Column_0mfvck38_ON_TAP');
                                logFirebaseEvent('Column_navigate_to');

                                context.pushNamed(
                                  'userDetailFollowers',
                                  queryParameters: {
                                    'userDetailRef': serializeParam(
                                      widget.userDetailRef,
                                      ParamType.DocumentReference,
                                    ),
                                    'userDisplayName': serializeParam(
                                      userDetailContainerUsersRecord
                                          .displayName,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 12.0),
                                    child: FutureBuilder<int>(
                                      future: queryUsersRecordCount(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'following_users',
                                          arrayContains: widget.userDetailRef,
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitFadingFour(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        int followerCountTextCount =
                                            snapshot.data!;

                                        return Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              followerCountTextCount,
                                              formatType: FormatType.compact,
                                            ),
                                            '00',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                font:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                letterSpacing: 0.0,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                  Text(
                                    'Followers',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: Container(
                              width: 85.0,
                              height: 85.0,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).tertiary
                                  ],
                                  stops: const [0.0, 1.0],
                                  begin: const AlignmentDirectional(1.0, -1.0),
                                  end: const AlignmentDirectional(-1.0, 1.0),
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'USER_DETAIL_Image_29q1vlzv_ON_TAP');
                                    logFirebaseEvent('Image_expand_image');
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            valueOrDefault<String>(
                                              userDetailContainerUsersRecord
                                                  .photoUrl,
                                              'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: valueOrDefault<String>(
                                            userDetailContainerUsersRecord
                                                .photoUrl,
                                            'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                          ),
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: valueOrDefault<String>(
                                      userDetailContainerUsersRecord.photoUrl,
                                      'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          userDetailContainerUsersRecord
                                              .photoUrl,
                                          'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                        ),
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
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
                                    'USER_DETAIL_Column_j1awn5gc_ON_TAP');
                                logFirebaseEvent('Column_navigate_to');

                                context.pushNamed(
                                  'userDetailFollowing',
                                  queryParameters: {
                                    'userDoc': serializeParam(
                                      userDetailContainerUsersRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'userDoc': userDetailContainerUsersRecord,
                                  },
                                );
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!valueOrDefault<bool>(
                                    userDetailContainerUsersRecord
                                        .followingUsers.isNotEmpty,
                                    true,
                                  ))
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        '0',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .headlineSmall,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  if (valueOrDefault<bool>(
                                    userDetailContainerUsersRecord
                                        .followingUsers.isNotEmpty,
                                    false,
                                  ))
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: FutureBuilder<int>(
                                        future: queryUsersRecordCount(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.whereIn(
                                                  'uid',
                                                  userDetailContainerUsersRecord
                                                      .followingUsers
                                                      .map((e) => e.id)
                                                      .toList()),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitFadingFour(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          int textCount = snapshot.data!;

                                          return Text(
                                            formatNumber(
                                              textCount,
                                              formatType: FormatType.compact,
                                            ),
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  font: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineSmall,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          );
                                        },
                                      ),
                                    ),
                                  Text(
                                    'Following',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                userDetailContainerUsersRecord.displayName,
                                'User',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: FlutterFlowTheme.of(context)
                                        .headlineSmall,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (valueOrDefault<bool>(
                              widget.userDetailRef != currentUserReference,
                              false,
                            ))
                              SizedBox(
                                height: 35.0,
                                child: Stack(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    if (!(currentUserDocument?.followingUsers
                                                .toList() ??
                                            [])
                                        .contains(userDetailContainerUsersRecord
                                            .reference))
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Builder(
                                          builder: (context) =>
                                              AuthUserStreamWidget(
                                            builder: (context) =>
                                                FFButtonWidget(
                                              onPressed:
                                                  userDetailContainerUsersRecord
                                                          .blockedUsers
                                                          .contains(
                                                              currentUserReference)
                                                      ? null
                                                      : () async {
                                                          logFirebaseEvent(
                                                              'USER_DETAIL_PAGE_PAGE_FOLLOW_BTN_ON_TAP');
                                                          await authManager
                                                              .refreshUser();
                                                          if (!currentUserEmailVerified) {
                                                            logFirebaseEvent(
                                                                'Button_alert_dialog');
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: const AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        FocusScope.of(dialogContext)
                                                                            .unfocus();
                                                                        FocusManager
                                                                            .instance
                                                                            .primaryFocus
                                                                            ?.unfocus();
                                                                      },
                                                                      child:
                                                                          SizedBox(
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.5,
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            const VerifyEmailWidget(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );

                                                            return;
                                                          }
                                                          logFirebaseEvent(
                                                              'Button_backend_call');

                                                          await currentUserReference!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'following_users':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  widget
                                                                      .userDetailRef
                                                                ]),
                                                              },
                                                            ),
                                                          });
                                                          logFirebaseEvent(
                                                              'Button_refresh_database_request');
                                                          safeSetState(() =>
                                                              _model.documentRequestCompleter =
                                                                  null);
                                                          await _model
                                                              .waitForDocumentRequestCompleted(
                                                                  maxWait:
                                                                      15000);
                                                          logFirebaseEvent(
                                                              'Button_backend_call');
                                                          unawaited(
                                                            () async {
                                                              await UserNotificationsRecord
                                                                      .createDoc(
                                                                          userDetailContainerUsersRecord
                                                                              .reference)
                                                                  .set(
                                                                      createUserNotificationsRecordData(
                                                                notificationType:
                                                                    'new_follower',
                                                                notificationHeader:
                                                                    'New Follower!',
                                                                createdTime:
                                                                    getCurrentTimestamp,
                                                                externalUserRef:
                                                                    currentUserReference,
                                                                notificationBody:
                                                                    ' started following you!',
                                                                externalUserDisplayName:
                                                                    currentUserDisplayName,
                                                              ));
                                                            }(),
                                                          );
                                                          if (userDetailContainerUsersRecord
                                                              .settings
                                                              .followerNotfications) {
                                                            logFirebaseEvent(
                                                                'Button_trigger_push_notification');
                                                            triggerPushNotification(
                                                              notificationTitle:
                                                                  'New Follower!',
                                                              notificationText:
                                                                  '$currentUserDisplayName started following you!',
                                                              userRefs: [
                                                                userDetailContainerUsersRecord
                                                                    .reference
                                                              ],
                                                              initialPageName:
                                                                  'userDetailPage',
                                                              parameterData: {
                                                                'userDetailRef':
                                                                    currentUserReference,
                                                              },
                                                            );
                                                          }
                                                        },
                                              text: 'Follow',
                                              options: FFButtonOptions(
                                                width: 140.0,
                                                height: double.infinity,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        15.0, 0.0, 15.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .tertiary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleSmall,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                        ),
                                                elevation: 1.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                disabledColor:
                                                    const Color(0xFF424141),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    if ((currentUserDocument?.followingUsers
                                                .toList() ??
                                            [])
                                        .contains(userDetailContainerUsersRecord
                                            .reference))
                                      AuthUserStreamWidget(
                                        builder: (context) => FFButtonWidget(
                                          onPressed: () async {
                                            logFirebaseEvent(
                                                'USER_DETAIL_UNFOLLOW_BTN_ON_TAP');
                                            logFirebaseEvent(
                                                'Button_backend_call');

                                            await currentUserReference!.update({
                                              ...mapToFirestore(
                                                {
                                                  'following_users':
                                                      FieldValue.arrayRemove([
                                                    widget.userDetailRef
                                                  ]),
                                                },
                                              ),
                                            });
                                            logFirebaseEvent(
                                                'Button_refresh_database_request');
                                            safeSetState(() => _model
                                                    .documentRequestCompleter =
                                                null);
                                            await _model
                                                .waitForDocumentRequestCompleted(
                                                    maxWait: 15000);
                                          },
                                          text: 'Unfollow',
                                          options: FFButtonOptions(
                                            width: 170.0,
                                            height: double.infinity,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFFD1CFCF),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      font: FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall,
                                                      color: Colors.black,
                                                      letterSpacing: 0.0,
                                                    ),
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            Builder(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'USER_DETAIL_SHARE_PROFILE_BTN_ON_TAP');
                                  logFirebaseEvent('Button_share');
                                  await Share.share(
                                    'toowize://toowize.com${GoRouterState.of(context).uri.toString()}',
                                    sharePositionOrigin:
                                        getWidgetBoundingBox(context),
                                  );
                                },
                                text: 'Share profile',
                                options: FFButtonOptions(
                                  width: 140.0,
                                  height: 35.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 15.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 1.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 7.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: AutoSizeText(
                          userDetailContainerUsersRecord.bio,
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          minFontSize: 11.0,
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 14.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0.0,
                                    -1.0,
                                  ),
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).primary,
                                  FlutterFlowTheme.of(context).secondary
                                ],
                                stops: const [0.0, 1.0],
                                begin: const AlignmentDirectional(0.0, -1.0),
                                end: const AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  5.0, 8.0, 5.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 10.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: FutureBuilder<int>(
                                          future: queryQuotesRecordCount(
                                            queryBuilder: (quotesRecord) =>
                                                quotesRecord.where(
                                              'posted_by',
                                              isEqualTo: widget.userDetailRef,
                                            ),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitFadingFour(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            int quoteCountTextCount =
                                                snapshot.data!;

                                            return Text(
                                              '${valueOrDefault<String>(
                                                formatNumber(
                                                  quoteCountTextCount,
                                                  formatType:
                                                      FormatType.compact,
                                                ),
                                                '0',
                                              )} Quotes',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 20.0),
                                      child: RefreshIndicator(
                                        onRefresh: () async {
                                          logFirebaseEvent(
                                              'USER_DETAIL_StaggeredView_q9v8nmol_ON_PU');
                                          logFirebaseEvent(
                                              'StaggeredView_navigate_to');
                                          if (Navigator.of(context).canPop()) {
                                            context.pop();
                                          }
                                          context.pushNamed(
                                            'userDetailPage',
                                            pathParameters: {
                                              'userDetailRef': serializeParam(
                                                widget.userDetailRef,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        },
                                        child: PagedMasonryGridView<
                                            DocumentSnapshot<Object?>?,
                                            QuotesRecord>.count(
                                          pagingController:
                                              _model.setStaggeredViewController(
                                            QuotesRecord.collection
                                                .where(
                                                  'posted_by',
                                                  isEqualTo:
                                                      widget.userDetailRef,
                                                )
                                                .orderBy('isPinned',
                                                    descending: true)
                                                .orderBy('created_time',
                                                    descending: true),
                                          ),
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 10.0,
                                          builderDelegate:
                                              PagedChildBuilderDelegate<
                                                  QuotesRecord>(
                                            // Customize what your widget looks like when it's loading the first page.
                                            firstPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitFadingFour(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            ),
                                            // Customize what your widget looks like when it's loading another page.
                                            newPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitFadingFour(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            ),
                                            noItemsFoundIndicatorBuilder: (_) =>
                                                const UserNoQuotesWidget(),
                                            itemBuilder: (context, _,
                                                staggeredViewIndex) {
                                              final staggeredViewQuotesRecord =
                                                  _model.staggeredViewPagingController!
                                                          .itemList![
                                                      staggeredViewIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  logFirebaseEvent(
                                                      'USER_DETAIL_Column_pz5djjqh_ON_TAP');
                                                  logFirebaseEvent(
                                                      'Column_navigate_to');

                                                  context.pushNamed(
                                                    'quoteDetailPage',
                                                    pathParameters: {
                                                      'quoteRef':
                                                          serializeParam(
                                                        staggeredViewQuotesRecord
                                                            .reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    queryParameters: {
                                                      'parentPage':
                                                          serializeParam(
                                                        'userDetailPage',
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            if (valueOrDefault<
                                                                bool>(
                                                              staggeredViewQuotesRecord
                                                                          .backgroundImage ==
                                                                      '',
                                                              true,
                                                            ))
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  boxShadow: const [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4.0,
                                                                      color: Color(
                                                                          0x33000000),
                                                                      offset:
                                                                          Offset(
                                                                        0.0,
                                                                        2.0,
                                                                      ),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Icon(
                                                                        Icons
                                                                            .format_quote,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Text(
                                                                          staggeredViewQuotesRecord
                                                                              .quoteText
                                                                              .maybeHandleOverflow(
                                                                            maxChars:
                                                                                150,
                                                                            replacement:
                                                                                '…',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w200,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if (staggeredViewQuotesRecord
                                                                          .context)
                                                                        Container(
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.45,
                                                                                        height: 2.0,
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
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 1,
                                                                                    child: Container(
                                                                                      width: 8.0,
                                                                                      height: 8.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 4,
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.45,
                                                                                        height: 2.0,
                                                                                        decoration: BoxDecoration(
                                                                                          gradient: LinearGradient(
                                                                                            colors: [
                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                              FlutterFlowTheme.of(context).secondary
                                                                                            ],
                                                                                            stops: const [0.0, 1.0],
                                                                                            begin: const AlignmentDirectional(1.0, 0.0),
                                                                                            end: const AlignmentDirectional(-1.0, 0),
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                staggeredViewQuotesRecord.contextBy.maybeHandleOverflow(
                                                                                  maxChars: 25,
                                                                                  replacement: '…',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w300,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                staggeredViewQuotesRecord.contextBackground.maybeHandleOverflow(
                                                                                  maxChars: 40,
                                                                                  replacement: '…',
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            if (valueOrDefault<
                                                                bool>(
                                                              staggeredViewQuotesRecord
                                                                          .backgroundImage !=
                                                                      '',
                                                              false,
                                                            ))
                                                              Stack(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child:
                                                                        OctoImage(
                                                                      placeholderBuilder:
                                                                          (_) =>
                                                                              SizedBox.expand(
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              BlurHashImage(staggeredViewQuotesRecord.backgroundImageBlurHash),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      image:
                                                                          NetworkImage(
                                                                        staggeredViewQuotesRecord
                                                                            .backgroundImage,
                                                                      ),
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          200.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        200.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              3.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.format_quote,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent3,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Container(
                                                                                width: double.infinity,
                                                                                decoration: const BoxDecoration(
                                                                                  color: Color(0x97000000),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(8.0),
                                                                                    topRight: Radius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.all(2.0),
                                                                                  child: Text(
                                                                                    staggeredViewQuotesRecord.quoteText.maybeHandleOverflow(
                                                                                      maxChars: 70,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    textAlign: TextAlign.center,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                          color: Colors.white,
                                                                                          fontSize: 17.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w200,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              if (staggeredViewQuotesRecord.context)
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 4,
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 0.45,
                                                                                                height: 2.0,
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
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 1,
                                                                                            child: Container(
                                                                                              width: 8.0,
                                                                                              height: 8.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 4,
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                              child: Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 0.45,
                                                                                                height: 2.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  gradient: LinearGradient(
                                                                                                    colors: [
                                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                                      FlutterFlowTheme.of(context).secondary
                                                                                                    ],
                                                                                                    stops: const [0.0, 1.0],
                                                                                                    begin: const AlignmentDirectional(1.0, 0.0),
                                                                                                    end: const AlignmentDirectional(-1.0, 0),
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Container(
                                                                                        width: double.infinity,
                                                                                        decoration: const BoxDecoration(
                                                                                          color: Color(0x97000000),
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(8.0),
                                                                                            bottomRight: Radius.circular(8.0),
                                                                                            topLeft: Radius.circular(0.0),
                                                                                            topRight: Radius.circular(0.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              staggeredViewQuotesRecord.contextBy.maybeHandleOverflow(
                                                                                                maxChars: 20,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    color: const Color(0xFF14B4EB),
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w300,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              staggeredViewQuotesRecord.contextBackground.maybeHandleOverflow(
                                                                                                maxChars: 20,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    color: FlutterFlowTheme.of(context).accent3,
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            if (staggeredViewQuotesRecord
                                                                .isPinned)
                                                              Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                        1.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child: Icon(
                                                                    Icons
                                                                        .push_pin_rounded,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
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
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
