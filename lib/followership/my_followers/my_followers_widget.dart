import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/empty_list_components/no_users/no_users_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'my_followers_model.dart';
export 'my_followers_model.dart';

class MyFollowersWidget extends StatefulWidget {
  const MyFollowersWidget({super.key});

  @override
  State<MyFollowersWidget> createState() => _MyFollowersWidgetState();
}

class _MyFollowersWidgetState extends State<MyFollowersWidget> {
  late MyFollowersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyFollowersModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'myFollowers'});
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
              logFirebaseEvent('MY_FOLLOWERS_chevron_left_rounded_ICN_ON');
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
                'Followers',
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
            child: PagedListView<DocumentSnapshot<Object?>?,
                UsersRecord>.separated(
              pagingController: _model.setListViewController(
                UsersRecord.collection
                    .where(
                      'following_users',
                      arrayContains: currentUserReference,
                    )
                    .orderBy('display_name'),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              reverse: false,
              scrollDirection: Axis.vertical,
              separatorBuilder: (_, __) => const SizedBox(height: 15.0),
              builderDelegate: PagedChildBuilderDelegate<UsersRecord>(
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
                noItemsFoundIndicatorBuilder: (_) => const NoUsersWidget(),
                itemBuilder: (context, _, listViewIndex) {
                  final listViewUsersRecord =
                      _model.listViewPagingController!.itemList![listViewIndex];
                  return Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'MY_FOLLOWERS_CircleImage_7py9s4h7_ON_TAP');
                          logFirebaseEvent('CircleImage_expand_image');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: FlutterFlowExpandedImageView(
                                image: Image.network(
                                  valueOrDefault<String>(
                                    listViewUsersRecord.photoUrl,
                                    'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                  ),
                                  fit: BoxFit.contain,
                                ),
                                allowRotation: false,
                                tag: valueOrDefault<String>(
                                  listViewUsersRecord.photoUrl,
                                  'https://clipground.com/images/profile-placeholder-clipart-1.png' '$listViewIndex',
                                ),
                                useHeroAnimation: true,
                              ),
                            ),
                          );
                        },
                        child: Hero(
                          tag: valueOrDefault<String>(
                            listViewUsersRecord.photoUrl,
                            'https://clipground.com/images/profile-placeholder-clipart-1.png' '$listViewIndex',
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
                                listViewUsersRecord.photoUrl,
                                'https://clipground.com/images/profile-placeholder-clipart-1.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MY_FOLLOWERS_PAGE_Text_lvenqno3_ON_TAP');
                              logFirebaseEvent('Text_navigate_to');

                              context.pushNamed(
                                'userDetailPage',
                                pathParameters: {
                                  'userDetailRef': serializeParam(
                                    listViewUsersRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Text(
                              listViewUsersRecord.displayName,
                              maxLines: 1,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'MY_FOLLOWERS_PAGE_REMOVE_BTN_ON_TAP');
                          logFirebaseEvent('Button_backend_call');

                          await listViewUsersRecord.reference.update({
                            ...mapToFirestore(
                              {
                                'following_users': FieldValue.arrayRemove(
                                    [currentUserReference]),
                              },
                            ),
                          });
                        },
                        text: 'Remove',
                        options: FFButtonOptions(
                          width: 115.0,
                          height: 30.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 24.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: const Color(0xFFD1CFCF),
                          textStyle: FlutterFlowTheme.of(context)
                              .titleSmall
                              .override(
                                font: FlutterFlowTheme.of(context).titleSmall,
                                color: Colors.black,
                                letterSpacing: 0.0,
                              ),
                          elevation: 2.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
