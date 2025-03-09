import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/comment_components/comment_options/comment_options_widget.dart';
import '/comment_components/comment_reply_options/comment_reply_options_widget.dart';
import '/comment_components/comment_thread/comment_thread_widget.dart';
import '/comment_components/create_comment_reply/create_comment_reply_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'comment_entry_model.dart';
export 'comment_entry_model.dart';

class CommentEntryWidget extends StatefulWidget {
  const CommentEntryWidget({
    super.key,
    bool? isCommentliked,
    required this.commentDoc,
    required this.quoteOwnerRef,
    required this.quoteDoc,
  }) : isCommentliked = isCommentliked ?? false;

  final bool isCommentliked;
  final CommentsRecord? commentDoc;
  final DocumentReference? quoteOwnerRef;
  final QuotesRecord? quoteDoc;

  @override
  State<CommentEntryWidget> createState() => _CommentEntryWidgetState();
}

class _CommentEntryWidgetState extends State<CommentEntryWidget>
    with TickerProviderStateMixin {
  late CommentEntryModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentEntryModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
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
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                valueOrDefault<String>(
                  widget.commentDoc?.snippetPhotoUrl,
                  'https://clipground.com/images/profile-placeholder-clipart-1.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 8.0, 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'COMMENT_ENTRY_COMP_Text_hyyst1xk_ON_TAP');
                            logFirebaseEvent('Text_navigate_to');

                            context.pushNamed(
                              'userDetailPage',
                              pathParameters: {
                                'userDetailRef': serializeParam(
                                  widget.commentDoc?.postedBy,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          child: Text(
                            valueOrDefault<String>(
                              widget.commentDoc?.snippetDisplayName,
                              'user',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 0.0, 0.0),
                          child: Text(
                            dateTimeFormat(
                              "relative",
                              widget.commentDoc!.createdTime!,
                              locale: FFLocalizations.of(context)
                                      .languageShortCode ??
                                  FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: FlutterFlowTheme.of(context).labelSmall,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        if (valueOrDefault<bool>(
                          widget.commentDoc?.isPinned,
                          false,
                        ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.push_pin_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 15.0,
                            ),
                          ),
                        if ((widget.commentDoc?.postedBy ==
                                currentUserReference) ||
                            valueOrDefault<bool>(
                              widget.quoteOwnerRef == currentUserReference,
                              false,
                            ))
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'COMMENT_ENTRY_COMP_Icon_aw3ewkeu_ON_TAP');
                                logFirebaseEvent('Icon_bottom_sheet');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.3,
                                          child: CommentOptionsWidget(
                                            parentQuoteRef: widget
                                                .commentDoc!.parentReference,
                                            commentDoc: widget.commentDoc!,
                                            isParentQuoteOwner:
                                                widget.quoteOwnerRef ==
                                                    currentUserReference,
                                            reopenParentCommentThread:
                                                () async {
                                              logFirebaseEvent('_bottom_sheet');
                                              Navigator.pop(context);
                                              logFirebaseEvent('_bottom_sheet');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: SizedBox(
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.65,
                                                        child:
                                                            CommentThreadWidget(
                                                          quoteDoc:
                                                              widget.quoteDoc!,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            },
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.keyboard_control,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.commentDoc?.commentText,
                        'text',
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: FlutterFlowTheme.of(context).bodySmall,
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      logFirebaseEvent(
                          'COMMENT_ENTRY_commentNotLikedIcon_ON_TAP');
                      logFirebaseEvent('commentNotLikedIcon_backend_call');

                      await widget.commentDoc!.reference.update({
                        ...mapToFirestore(
                          {
                            'comment_liked_by_users':
                                FieldValue.arrayUnion([currentUserReference]),
                            'comment_approx_likes': FieldValue.increment(1),
                          },
                        ),
                      });
                    },
                    child: Icon(
                      Icons.favorite_border_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20.0,
                    ),
                  ),
                  if (valueOrDefault<bool>(
                    widget.commentDoc?.commentLikedByUsers
                        .contains(currentUserReference),
                    false,
                  ))
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'COMMENT_ENTRY_commentLikedIcon_ON_TAP');
                          logFirebaseEvent('commentLikedIcon_backend_call');

                          await widget.commentDoc!.reference.update({
                            ...mapToFirestore(
                              {
                                'comment_liked_by_users':
                                    FieldValue.arrayRemove(
                                        [currentUserReference]),
                                'comment_approx_likes':
                                    FieldValue.increment(-(1)),
                              },
                            ),
                          });
                        },
                        child: Icon(
                          Icons.favorite_rounded,
                          color: FlutterFlowTheme.of(context).error,
                          size: 20.0,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 0.0, 0.0),
              child: Text(
                '${widget.commentDoc?.commentLikedByUsers.length.toString()} Likes',
                style: FlutterFlowTheme.of(context).labelSmall.override(
                      font: FlutterFlowTheme.of(context).labelSmall,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('COMMENT_ENTRY_COMP_Text_0s4u5tq2_ON_TAP');
                logFirebaseEvent('Text_bottom_sheet');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: SizedBox(
                          height: 300.0,
                          child: CreateCommentReplyWidget(
                            commentDoc: widget.commentDoc!,
                          ),
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Text(
                'Reply',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: FlutterFlowTheme.of(context).bodyMedium,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ].divide(const SizedBox(width: 15.0)),
        ),
        Container(
          decoration: const BoxDecoration(),
          child: Visibility(
            visible: valueOrDefault<bool>(
              widget.commentDoc!.commentReplyRefs.isNotEmpty,
              false,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(40.0, 15.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!_model.repliesShown)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'COMMENT_ENTRY_COMP_Row_u0sgadmx_ON_TAP');
                        logFirebaseEvent('Row_update_component_state');
                        _model.repliesShown = true;
                        safeSetState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 50.0,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          Text(
                            'Show ${formatNumber(
                              widget.commentDoc?.commentReplyRefs.length,
                              formatType: FormatType.compact,
                            )} replies',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(const SizedBox(width: 15.0)),
                      ),
                    ),
                  if (_model.repliesShown)
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'COMMENT_ENTRY_COMP_Row_b1t6pknw_ON_TAP');
                        logFirebaseEvent('Row_update_component_state');
                        _model.repliesShown = false;
                        safeSetState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: 50.0,
                            height: 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          Text(
                            'Hide replies',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 11.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].divide(const SizedBox(width: 15.0)),
                      ),
                    ),
                ].divide(const SizedBox(width: 15.0)),
              ),
            ),
          ),
        ),
        if (_model.repliesShown)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Builder(
                  builder: (context) {
                    final commentRepliesRefs =
                        widget.commentDoc?.commentReplyRefs.toList() ?? [];

                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(commentRepliesRefs.length,
                            (commentRepliesRefsIndex) {
                          final commentRepliesRefsItem =
                              commentRepliesRefs[commentRepliesRefsIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: StreamBuilder<CommentRepliesRecord>(
                              stream: CommentRepliesRecord.getDocument(
                                  commentRepliesRefsItem),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitFadingFour(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }

                                final rowCommentRepliesRecord = snapshot.data!;

                                return Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40.0,
                                      height: 40.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          rowCommentRepliesRecord
                                              .snippetPhotoUrl,
                                          'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 8.0, 8.0, 8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    logFirebaseEvent(
                                                        'COMMENT_ENTRY_COMP_Text_zoa46c6l_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Text_navigate_to');

                                                    context.pushNamed(
                                                      'userDetailPage',
                                                      pathParameters: {
                                                        'userDetailRef':
                                                            serializeParam(
                                                          rowCommentRepliesRecord
                                                              .postedBy,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: Text(
                                                    rowCommentRepliesRecord
                                                        .snippetDisplayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                if (rowCommentRepliesRecord
                                                        .postedBy ==
                                                    currentUserReference)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'COMMENT_ENTRY_COMP_Icon_mft3gfuf_ON_TAP');
                                                        logFirebaseEvent(
                                                            'Icon_bottom_sheet');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          useSafeArea: true,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    SizedBox(
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.3,
                                                                  child:
                                                                      CommentReplyOptionsWidget(
                                                                    commentReplyRef:
                                                                        commentRepliesRefsItem,
                                                                    commentDoc:
                                                                        widget
                                                                            .commentDoc!,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      },
                                                      child: Icon(
                                                        Icons.keyboard_control,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Text(
                                              rowCommentRepliesRecord.replyText,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                            Text(
                                              '${rowCommentRepliesRecord.replyLikedBy.length.toString()} Likes',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        font:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ].divide(const SizedBox(height: 3.0)),
                                        ),
                                      ),
                                    ),
                                    ToggleIcon(
                                      onPressed: () async {
                                        final replyLikedByElement =
                                            currentUserReference;
                                        final replyLikedByUpdate =
                                            rowCommentRepliesRecord
                                                    .replyLikedBy
                                                    .contains(
                                                        replyLikedByElement)
                                                ? FieldValue.arrayRemove(
                                                    [replyLikedByElement])
                                                : FieldValue.arrayUnion(
                                                    [replyLikedByElement]);
                                        await rowCommentRepliesRecord.reference
                                            .update({
                                          ...mapToFirestore(
                                            {
                                              'reply_liked_by':
                                                  replyLikedByUpdate,
                                            },
                                          ),
                                        });
                                      },
                                      value: rowCommentRepliesRecord
                                          .replyLikedBy
                                          .contains(currentUserReference),
                                      onIcon: Icon(
                                        Icons.favorite_rounded,
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        size: 20.0,
                                      ),
                                      offIcon: Icon(
                                        Icons.favorite_border,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          );
                        }),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!);
                  },
                ),
                if (_model.repliesShown)
                  Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          logFirebaseEvent(
                              'COMMENT_ENTRY_COMP_Row_xs6snoyk_ON_TAP');
                          logFirebaseEvent('Row_update_component_state');
                          _model.repliesShown = false;
                          safeSetState(() {});
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 50.0,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                'Hide replies',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 11.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 15.0)),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
