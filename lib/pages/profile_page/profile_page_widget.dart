import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/empty_list_components/my_no_quotes/my_no_quotes_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:octo_image/octo_image.dart';
import 'package:share_plus/share_plus.dart';
import 'profile_page_model.dart';
export 'profile_page_model.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  late ProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfilePageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'profilePage'});
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
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(1.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'PROFILE_PAGE_PAGE_Icon_bqpzk7vu_ON_TAP');
                            logFirebaseEvent('Icon_navigate_to');

                            context.pushNamed('settings');
                          },
                          child: Icon(
                            Icons.settings,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 30.0,
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
                                  'PROFILE_PAGE_PAGE_Column_lak9yocp_ON_TAP');
                              logFirebaseEvent('Column_navigate_to');

                              context.pushNamed('myFollowers');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: FutureBuilder<int>(
                                    future: _model.myFollowerCount(
                                      requestFn: () => queryUsersRecordCount(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'following_users',
                                          arrayContains: currentUserReference,
                                        ),
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
                                      int myFollowerCountTextCount =
                                          snapshot.data!;

                                      return Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            myFollowerCountTextCount,
                                            formatType: FormatType.compact,
                                          ),
                                          '0',
                                        ),
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
                              child: AuthUserStreamWidget(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'PROFILE_PAGE_PAGE_Image_k462ek9i_ON_TAP');
                                    logFirebaseEvent('Image_expand_image');
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: valueOrDefault<String>(
                                            currentUserPhoto,
                                            'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                          ),
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: valueOrDefault<String>(
                                      currentUserPhoto,
                                      'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                    ),
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50.0),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          currentUserPhoto,
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
                        ),
                        Expanded(
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PROFILE_PAGE_PAGE_Column_xk9rwnf9_ON_TAP');
                              logFirebaseEvent('Column_navigate_to');

                              context.pushNamed('myFollowing');
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (!valueOrDefault<bool>(
                                      (currentUserDocument?.followingUsers
                                                  .toList() ??
                                              [])
                                          .isNotEmpty,
                                      true,
                                    ))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            '0',
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
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                      (currentUserDocument?.followingUsers
                                                  .toList() ??
                                              [])
                                          .isNotEmpty,
                                      false,
                                    ))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) =>
                                              FutureBuilder<int>(
                                            future: _model.myFollowingCount(
                                              requestFn: () =>
                                                  queryUsersRecordCount(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.whereIn(
                                                        'uid',
                                                        (currentUserDocument
                                                                    ?.followingUsers
                                                                    .toList() ??
                                                                [])
                                                            .map((e) => e.id)
                                                            .toList()),
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              int textCount = snapshot.data!;

                                              return Text(
                                                valueOrDefault<String>(
                                                  formatNumber(
                                                    textCount,
                                                    formatType:
                                                        FormatType.compact,
                                                  ),
                                                  '0',
                                                ),
                                                textAlign: TextAlign.center,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .headlineSmall
                                                    .override(
                                                      font: FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AuthUserStreamWidget(
                                builder: (context) => Text(
                                  valueOrDefault<String>(
                                    currentUserDisplayName,
                                    'UserName',
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
                              ),
                              if (valueOrDefault<bool>(
                                revenue_cat.activeEntitlementIds
                                    .contains('TooWize Premium'),
                                false,
                              ))
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/premium-account.png',
                                    width: 35.0,
                                    height: 35.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                            ].addToStart(SizedBox(
                                width: valueOrDefault<double>(
                              valueOrDefault<bool>(
                                revenue_cat.activeEntitlementIds
                                    .contains('TooWize Premium'),
                                false,
                              )
                                  ? 35.0
                                  : 0.0,
                              0.0,
                            ))),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) => Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PROFILE_SHARE_PROFILE_BTN_ON_TAP');
                            logFirebaseEvent('Button_share');
                            await Share.share(
                              'toowize://toowize.com/user/${currentUserReference?.id}',
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                          },
                          text: 'Share profile',
                          options: FFButtonOptions(
                            height: 35.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: FlutterFlowTheme.of(context).titleSmall,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
                      ),
                    ),
                    if (valueOrDefault<bool>(
                      valueOrDefault(currentUserDocument?.bio, '') != '',
                      false,
                    ))
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 12.0, 24.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => AutoSizeText(
                            valueOrDefault(currentUserDocument?.bio, ''),
                            textAlign: TextAlign.center,
                            maxLines: 5,
                            minFontSize: 11.0,
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
                    if (valueOrDefault<bool>(
                      valueOrDefault(currentUserDocument?.bio, '') == '',
                      true,
                    ))
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'PROFILE_PAGE_PAGE_Row_yd0b0p67_ON_TAP');
                              logFirebaseEvent('Row_navigate_to');

                              context.pushNamed('editProfile');
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Add a bio',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Icon(
                                  Icons.add_rounded,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  size: 13.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
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
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: FutureBuilder<int>(
                                        future: queryQuotesRecordCount(
                                          queryBuilder: (quotesRecord) =>
                                              quotesRecord.where(
                                            'posted_by',
                                            isEqualTo: currentUserReference,
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
                                          int myQuoteCountTextCount =
                                              snapshot.data!;

                                          return Text(
                                            '${valueOrDefault<String>(
                                              formatNumber(
                                                myQuoteCountTextCount,
                                                formatType: FormatType.compact,
                                              ),
                                              '0',
                                            )} Quotes',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium
                                                .override(
                                                  font: FlutterFlowTheme.of(
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
                                            'PROFILE_StaggeredView_t30l4ec4_ON_PULL_T');
                                        logFirebaseEvent(
                                            'StaggeredView_navigate_to');

                                        context.goNamed(
                                          'profilePage',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
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
                                                isEqualTo: currentUserReference,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                size: 50.0,
                                              ),
                                            ),
                                          ),
                                          noItemsFoundIndicatorBuilder: (_) =>
                                              const MyNoQuotesWidget(),
                                          itemBuilder:
                                              (context, _, staggeredViewIndex) {
                                            final staggeredViewQuotesRecord = _model
                                                .staggeredViewPagingController!
                                                .itemList![staggeredViewIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PROFILE_PAGE_PAGE_Column_ddhvutwf_ON_TAP');
                                                logFirebaseEvent(
                                                    'Column_navigate_to');

                                                context.pushNamed(
                                                  'quoteDetailPage',
                                                  pathParameters: {
                                                    'quoteRef': serializeParam(
                                                      staggeredViewQuotesRecord
                                                          .reference,
                                                      ParamType
                                                          .DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                  queryParameters: {
                                                    'parentPage':
                                                        serializeParam(
                                                      'profilePage',
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
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
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child:
                                                                      OctoImage(
                                                                    placeholderBuilder: (_) =>
                                                                        SizedBox
                                                                            .expand(
                                                                      child:
                                                                          Image(
                                                                        image: BlurHashImage(
                                                                            staggeredViewQuotesRecord.backgroundImageBlurHash),
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
                                                                  height: 200.0,
                                                                  decoration:
                                                                      BoxDecoration(
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
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Icon(
                                                                          Icons
                                                                              .format_quote,
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
                                                                                decoration: const BoxDecoration(
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
                                                                padding:
                                                                    const EdgeInsetsDirectional
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
            ),
          ),
        ),
      ),
    );
  }
}
