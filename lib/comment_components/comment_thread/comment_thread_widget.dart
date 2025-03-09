import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/comment_components/comment_entry/comment_entry_widget.dart';
import '/empty_list_components/no_comments/no_comments_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading_components/comment_thread_shimmer/comment_thread_shimmer_widget.dart';
import '/user_management/onboarding/verify_email/verify_email_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'comment_thread_model.dart';
export 'comment_thread_model.dart';

class CommentThreadWidget extends StatefulWidget {
  const CommentThreadWidget({
    super.key,
    required this.quoteDoc,
  });

  final QuotesRecord? quoteDoc;

  @override
  State<CommentThreadWidget> createState() => _CommentThreadWidgetState();
}

class _CommentThreadWidgetState extends State<CommentThreadWidget> {
  late CommentThreadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommentThreadModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 64.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                      child: Container(
                        width: 50.0,
                        height: 3.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primary,
                              FlutterFlowTheme.of(context).secondary
                            ],
                            stops: const [0.0, 1.0],
                            begin: const AlignmentDirectional(0.0, -1.0),
                            end: const AlignmentDirectional(0, 1.0),
                          ),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Text(
                          'Comments',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                font: FlutterFlowTheme.of(context).titleLarge,
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PagedListView<DocumentSnapshot<Object?>?,
                    CommentsRecord>.separated(
                  pagingController: _model.setListViewController(
                      CommentsRecord.collection(widget.quoteDoc?.reference)
                          .orderBy('isPinned', descending: true)
                          .orderBy('comment_approx_likes', descending: true)
                          .orderBy('created_time', descending: true),
                      parent: widget.quoteDoc?.reference),
                  padding: EdgeInsets.zero,
                  primary: false,
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (_, __) => const SizedBox(height: 15.0),
                  builderDelegate: PagedChildBuilderDelegate<CommentsRecord>(
                    // Customize what your widget looks like when it's loading the first page.
                    firstPageProgressIndicatorBuilder: (_) =>
                        const CommentThreadShimmerWidget(),
                    // Customize what your widget looks like when it's loading another page.
                    newPageProgressIndicatorBuilder: (_) =>
                        const CommentThreadShimmerWidget(),
                    noItemsFoundIndicatorBuilder: (_) => const SizedBox(
                      width: double.infinity,
                      child: NoCommentsWidget(),
                    ),
                    itemBuilder: (context, _, listViewIndex) {
                      final listViewCommentsRecord = _model
                          .listViewPagingController!.itemList![listViewIndex];
                      return wrapWithModel(
                        model: _model.commentEntryModels.getModel(
                          listViewCommentsRecord.reference.id,
                          listViewIndex,
                        ),
                        updateCallback: () => safeSetState(() {}),
                        child: CommentEntryWidget(
                          key: Key(
                            'Keybbe_${listViewCommentsRecord.reference.id}',
                          ),
                          isCommentliked: listViewCommentsRecord
                              .commentLikedByUsers
                              .contains(currentUserReference),
                          commentDoc: listViewCommentsRecord,
                          quoteOwnerRef: widget.quoteDoc!.postedBy!,
                          quoteDoc: widget.quoteDoc!,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: double.infinity,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) => Container(
                              width: 40.0,
                              height: 40.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                valueOrDefault<String>(
                                  currentUserPhoto,
                                  'https://clipground.com/images/profile-placeholder-clipart-1.png',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                width: 387.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: false,
                                      textInputAction: TextInputAction.done,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText:
                                            'Comment on ${widget.quoteDoc?.snippetDisplayName}\'s post',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: FlutterFlowTheme.of(context)
                                                  .labelMedium,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                        contentPadding: const EdgeInsets.all(3.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Builder(
                            builder: (context) => FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context).primary,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.send_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              showLoadingIndicator: true,
                              onPressed: () async {
                                logFirebaseEvent(
                                    'COMMENT_THREAD_send_rounded_ICN_ON_TAP');
                                await authManager.refreshUser();
                                var shouldSetState = false;
                                if (!currentUserEmailVerified) {
                                  logFirebaseEvent('IconButton_alert_dialog');
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: WebViewAware(
                                          child: SizedBox(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.5,
                                            width: double.infinity,
                                            child: const VerifyEmailWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  );

                                  if (shouldSetState) safeSetState(() {});
                                  return;
                                }
                                if (_model.textController.text != '') {
                                  logFirebaseEvent('IconButton_backend_call');
                                  _model.quotePostedBy =
                                      await UsersRecord.getDocumentOnce(
                                          widget.quoteDoc!.postedBy!);
                                  shouldSetState = true;
                                  if (_model.quotePostedBy!.blockedUsers
                                      .contains(currentUserReference)) {
                                    logFirebaseEvent('IconButton_bottom_sheet');
                                    Navigator.pop(context);
                                    logFirebaseEvent(
                                        'IconButton_show_snack_bar');
                                    ScaffoldMessenger.of(context)
                                        .clearSnackBars();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'You have been blocked from interacting with this user.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                      ),
                                    );
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  logFirebaseEvent('IconButton_backend_call');
                                  _model.moderateTextReturn =
                                      await ModerateTextCall.call(
                                    screenedText: _model.textController.text,
                                    key: getRemoteConfigString(
                                        'azureModerationApiKey'),
                                  );

                                  shouldSetState = true;
                                  if (valueOrDefault<bool>(
                                        ModerateTextCall.pii(
                                              (_model.moderateTextReturn
                                                      ?.jsonBody ??
                                                  ''),
                                            ) !=
                                            null,
                                        false,
                                      ) ||
                                      ((double sexplicitScore,
                                              double sexuallySuggestiveScore,
                                              double offensiveScore,
                                              double maxRating) {
                                        return (sexplicitScore +
                                                sexuallySuggestiveScore +
                                                offensiveScore) >=
                                            maxRating;
                                      }(
                                          valueOrDefault<double>(
                                            ModerateTextCall.score1(
                                              (_model.moderateTextReturn
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            0.0,
                                          ),
                                          valueOrDefault<double>(
                                            ModerateTextCall.score2(
                                              (_model.moderateTextReturn
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            0.0,
                                          ),
                                          valueOrDefault<double>(
                                            ModerateTextCall.score3(
                                              (_model.moderateTextReturn
                                                      ?.jsonBody ??
                                                  ''),
                                            ),
                                            0.0,
                                          ),
                                          getRemoteConfigDouble(
                                              'textMaxFoulRating')))) {
                                    logFirebaseEvent('IconButton_alert_dialog');
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: const Text('Whoa whoa!'),
                                            content: const Text(
                                                'It looks like your comment may be too sexual, offensive or reveal personal information. '),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: const Text('Ok, my bad'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    if (shouldSetState) safeSetState(() {});
                                    return;
                                  }
                                  logFirebaseEvent('IconButton_backend_call');

                                  await CommentsRecord.createDoc(
                                          widget.quoteDoc!.reference)
                                      .set(createCommentsRecordData(
                                    commentText: _model.textController.text,
                                    postedBy: currentUserReference,
                                    snippetDisplayName: currentUserDisplayName,
                                    snippetPhotoUrl: currentUserPhoto,
                                    createdTime: getCurrentTimestamp,
                                    commentApproxLikes: 0,
                                    isPinned: false,
                                  ));
                                  // update comment count and random index
                                  logFirebaseEvent(
                                      'IconButton_updatecommentcountandrandomin');

                                  await widget.quoteDoc!.reference.update({
                                    ...createQuotesRecordData(
                                      randomIndex: random_data.randomString(
                                        12,
                                        12,
                                        true,
                                        true,
                                        true,
                                      ),
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'num_comments': FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  if (widget.quoteDoc?.postedBy !=
                                      currentUserReference) {
                                    // create notifications document
                                    logFirebaseEvent(
                                        'IconButton_createnotificationsdocument');
                                    unawaited(
                                      () async {
                                        await UserNotificationsRecord.createDoc(
                                                widget.quoteDoc!.postedBy!)
                                            .set(
                                                createUserNotificationsRecordData(
                                          notificationType: 'new_comment',
                                          notificationHeader:
                                              'New comment on your post!',
                                          createdTime: getCurrentTimestamp,
                                          quoteRef: widget.quoteDoc?.reference,
                                          externalUserRef: currentUserReference,
                                          notificationBody:
                                              ' commented \"${functions.getFirstNChars(_model.textController.text, 15)}\"on your post: \"${functions.getFirstNChars(widget.quoteDoc!.quoteText, 10)}\"',
                                          externalUserDisplayName:
                                              currentUserDisplayName,
                                        ));
                                      }(),
                                    );
                                    if (_model.quotePostedBy!.settings
                                        .commentNotifications) {
                                      logFirebaseEvent(
                                          'IconButton_trigger_push_notification');
                                      triggerPushNotification(
                                        notificationTitle:
                                            'New comment on your post!',
                                        notificationText:
                                            '@$currentUserDisplayName commented \"${functions.getFirstNChars(_model.textController.text, 15)}...\"',
                                        notificationImageUrl:
                                            widget.quoteDoc?.backgroundImage,
                                        notificationSound: 'default',
                                        userRefs: [widget.quoteDoc!.postedBy!],
                                        initialPageName: 'quoteDetailPage',
                                        parameterData: {
                                          'quoteRef':
                                              widget.quoteDoc?.reference,
                                          'parentPage': 'commentNotification',
                                        },
                                      );
                                    }
                                  }
                                  // reopen the bottom sheet to reflect changes
                                  logFirebaseEvent(
                                      'IconButton_reopenthebottomsheettoreflect');
                                  Navigator.pop(context);
                                  logFirebaseEvent('IconButton_bottom_sheet');
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
                                                0.65,
                                            child: CommentThreadWidget(
                                              quoteDoc: widget.quoteDoc!,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                }
                                if (shouldSetState) safeSetState(() {});
                              },
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
    );
  }
}
