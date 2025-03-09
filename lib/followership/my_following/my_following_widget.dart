import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/empty_list_components/no_users/no_users_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/user_management/onboarding/verify_email/verify_email_widget.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'my_following_model.dart';
export 'my_following_model.dart';

class MyFollowingWidget extends StatefulWidget {
  const MyFollowingWidget({super.key});

  @override
  State<MyFollowingWidget> createState() => _MyFollowingWidgetState();
}

class _MyFollowingWidgetState extends State<MyFollowingWidget> {
  late MyFollowingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyFollowingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'myFollowing'});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
              logFirebaseEvent('MY_FOLLOWING_chevron_left_rounded_ICN_ON');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AuthUserStreamWidget(
                builder: (context) => Text(
                  currentUserDisplayName,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: FlutterFlowTheme.of(context).bodyMedium,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Text(
                'Following',
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      font: FlutterFlowTheme.of(context).headlineMedium,
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                if (valueOrDefault<bool>(
                  (currentUserDocument?.followingUsers.toList() ?? [])
                      .isNotEmpty,
                  false,
                ))
                  AuthUserStreamWidget(
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: PagedListView<DocumentSnapshot<Object?>?,
                                UsersRecord>.separated(
                              pagingController: _model.setListViewController(
                                UsersRecord.collection
                                    .whereIn(
                                        'uid',
                                        (currentUserDocument?.followingUsers
                                                    .toList() ??
                                                [])
                                            .map((e) => e.id)
                                            .toList())
                                    .orderBy('display_name'),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15.0),
                              reverse: false,
                              scrollDirection: Axis.vertical,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(height: 15.0),
                              builderDelegate:
                                  PagedChildBuilderDelegate<UsersRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingFour(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                // Customize what your widget looks like when it's loading another page.
                                newPageProgressIndicatorBuilder: (_) => Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: SpinKitFadingFour(
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 50.0,
                                    ),
                                  ),
                                ),
                                noItemsFoundIndicatorBuilder: (_) =>
                                    const NoUsersWidget(),
                                itemBuilder: (context, _, listViewIndex) {
                                  final listViewUsersRecord = _model
                                      .listViewPagingController!
                                      .itemList![listViewIndex];
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 5.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              valueOrDefault<String>(
                                                listViewUsersRecord.photoUrl,
                                                'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'MY_FOLLOWING_PAGE_Text_9jwj0xxf_ON_TAP');
                                                logFirebaseEvent(
                                                    'Text_navigate_to');

                                                context.pushNamed(
                                                  'userDetailPage',
                                                  pathParameters: {
                                                    'userDetailRef':
                                                        serializeParam(
                                                      listViewUsersRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Text(
                                                listViewUsersRecord.displayName,
                                                maxLines: 1,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: SizedBox(
                                            width: 115.0,
                                            height: 30.0,
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) =>
                                                        FFButtonWidget(
                                                      onPressed: () async {
                                                        logFirebaseEvent(
                                                            'MY_FOLLOWING_PAGE_FOLLOW_BTN_ON_TAP');
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
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              dialogContext)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          MediaQuery.sizeOf(context).height *
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
                                                                listViewUsersRecord
                                                                    .reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        logFirebaseEvent(
                                                            'Button_backend_call');
                                                        unawaited(
                                                          () async {
                                                            await UserNotificationsRecord
                                                                    .createDoc(
                                                                        listViewUsersRecord
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
                                                        if (listViewUsersRecord
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
                                                              listViewUsersRecord
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
                                                        width: double.infinity,
                                                        height: 40.0,
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  font: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall,
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                        elevation: 3.0,
                                                        borderSide: const BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                if ((currentUserDocument
                                                            ?.followingUsers
                                                            .toList() ??
                                                        [])
                                                    .contains(
                                                        listViewUsersRecord
                                                            .reference))
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'MY_FOLLOWING_PAGE_UNFOLLOW_BTN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'Button_backend_call');

                                                      await currentUserReference!
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'following_users':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              listViewUsersRecord
                                                                  .reference
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      logFirebaseEvent(
                                                          'Button_update_app_state');

                                                      safeSetState(() {});
                                                    },
                                                    text: 'Unfollow',
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFFD1CFCF),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall,
                                                                color: Colors
                                                                    .black,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Unfollow all users?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MY_FOLLOWING_UNFOLLOW_ALL_BTN_ON_TAP');
                                  logFirebaseEvent('Button_alert_dialog');
                                  var confirmDialogResponse =
                                      await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: const Text(
                                                      'Unfollow all users?'),
                                                  content: const Text(
                                                      'Are you sure you want to unfollow all users? This cannot be undone. Users can still be followed individually after.'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: const Text('Cancel'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child: const Text('Confirm'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ) ??
                                          false;
                                  if (confirmDialogResponse) {
                                    logFirebaseEvent('Button_backend_call');

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'following_users':
                                              FieldValue.delete(),
                                        },
                                      ),
                                    });
                                    logFirebaseEvent('Button_update_app_state');

                                    safeSetState(() {});
                                  } else {
                                    logFirebaseEvent(
                                        'Button_close_dialog_drawer_etc');
                                    Navigator.pop(context);
                                  }
                                },
                                text: 'Unfollow all',
                                options: FFButtonOptions(
                                  height: 30.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: const Color(0x86EF393C),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .titleSmall,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                if (valueOrDefault<bool>(
                  (currentUserDocument?.followingUsers.toList() ?? []).isEmpty,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
