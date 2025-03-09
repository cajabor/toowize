import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/empty_list_components/no_notifications/no_notifications_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'notifications'});
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
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Text(
              'Notifications',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    font: FlutterFlowTheme.of(context).headlineMedium,
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: const [],
            centerTitle: true,
            elevation: 0.0,
          ),
          body: SafeArea(
            top: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    FlutterFlowTheme.of(context).primaryBackground,
                    FlutterFlowTheme.of(context).secondary
                  ],
                  stops: const [0.2, 1.0],
                  begin: const AlignmentDirectional(0.0, -1.0),
                  end: const AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: PagedListView<DocumentSnapshot<Object?>?,
                      UserNotificationsRecord>.separated(
                    pagingController: _model.setListViewController(
                        UserNotificationsRecord.collection(currentUserReference)
                            .orderBy('created_time', descending: true),
                        parent: currentUserReference),
                    padding: const EdgeInsets.fromLTRB(
                      0,
                      4.0,
                      0,
                      44.0,
                    ),
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (_, __) => const SizedBox(height: 8.0),
                    builderDelegate:
                        PagedChildBuilderDelegate<UserNotificationsRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitFadingFour(
                            color: FlutterFlowTheme.of(context).secondary,
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
                            color: FlutterFlowTheme.of(context).secondary,
                            size: 50.0,
                          ),
                        ),
                      ),
                      noItemsFoundIndicatorBuilder: (_) => const Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: NoNotificationsWidget(),
                        ),
                      ),
                      itemBuilder: (context, _, listViewIndex) {
                        final listViewUserNotificationsRecord = _model
                            .listViewPagingController!.itemList![listViewIndex];
                        return Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'NOTIFICATIONS_Container_e9qwym70_ON_TAP');
                              if (listViewUserNotificationsRecord
                                      .notificationType ==
                                  'new_follower') {
                                logFirebaseEvent('Container_navigate_to');

                                context.pushNamed(
                                  'userDetailPage',
                                  pathParameters: {
                                    'userDetailRef': serializeParam(
                                      listViewUserNotificationsRecord
                                          .externalUserRef,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              } else {
                                logFirebaseEvent('Container_navigate_to');

                                context.pushNamed(
                                  'quoteDetailPage',
                                  pathParameters: {
                                    'quoteRef': serializeParam(
                                      listViewUserNotificationsRecord.quoteRef,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                  queryParameters: {
                                    'parentPage': serializeParam(
                                      listViewUserNotificationsRecord
                                                  .notificationType ==
                                              'new_comment'
                                          ? 'commentNotification'
                                          : 'quoteNotification',
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                );
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Color(0x33000000),
                                    offset: Offset(
                                      0.0,
                                      1.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 8.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (listViewUserNotificationsRecord
                                                .notificationType ==
                                            'new_follower')
                                          Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x543F51B5),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.person_add_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                          ),
                                        if ((listViewUserNotificationsRecord
                                                    .notificationType ==
                                                'new_comment') ||
                                            (listViewUserNotificationsRecord
                                                    .notificationType ==
                                                'new_comment_reply'))
                                          Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x543F51B5),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.comment,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                          ),
                                        if (listViewUserNotificationsRecord
                                                .notificationType ==
                                            'likes_milestone')
                                          Container(
                                            width: 32.0,
                                            height: 32.0,
                                            decoration: const BoxDecoration(
                                              color: Color(0x543F51B5),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.favorite_border,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 16.0,
                                            ),
                                          ),
                                      ].divide(const SizedBox(height: 5.0)),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              listViewUserNotificationsRecord
                                                  .notificationHeader,
                                              minFontSize: 12.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyLarge
                                                  .override(
                                                    font: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text:
                                                        listViewUserNotificationsRecord.externalUserDisplayName,
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
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                    mouseCursor:
                                                        SystemMouseCursors
                                                            .click,
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () async {
                                                            logFirebaseEvent(
                                                                'NOTIFICATIONS_RichTextSpan_ybu2d963_ON_T');
                                                            logFirebaseEvent(
                                                                'RichTextSpan_navigate_to');

                                                            context.pushNamed(
                                                              'userDetailPage',
                                                              pathParameters: {
                                                                'userDetailRef':
                                                                    serializeParam(
                                                                  listViewUserNotificationsRecord
                                                                      .externalUserRef,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        listViewUserNotificationsRecord.notificationBody,
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                    ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 4.0),
                                              child: Text(
                                                dateTimeFormat(
                                                  "relative",
                                                  listViewUserNotificationsRecord
                                                      .createdTime!,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelSmall
                                                    .override(
                                                      font: FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmall,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
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
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
