import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/user_management/onboarding/verify_email/verify_email_widget.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'create_comment_reply_model.dart';
export 'create_comment_reply_model.dart';

class CreateCommentReplyWidget extends StatefulWidget {
  const CreateCommentReplyWidget({
    super.key,
    required this.commentDoc,
  });

  final CommentsRecord? commentDoc;

  @override
  State<CreateCommentReplyWidget> createState() =>
      _CreateCommentReplyWidgetState();
}

class _CreateCommentReplyWidgetState extends State<CreateCommentReplyWidget> {
  late CreateCommentReplyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateCommentReplyModel());

    _model.replyTextFieldTextController ??= TextEditingController();
    _model.replyTextFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 20.0),
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
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.replyTextFieldTextController,
                            focusNode: _model.replyTextFieldFocusNode,
                            autofocus: true,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Reply to ${valueOrDefault<String>(
                                widget.commentDoc?.snippetDisplayName,
                                'user',
                              )}',
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
                                  font: FlutterFlowTheme.of(context).bodyMedium,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                ),
                            validator: _model
                                .replyTextFieldTextControllerValidator
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
                          'CREATE_COMMENT_REPLY_send_rounded_ICN_ON');
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
                              alignment: const AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.5,
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
                      if (_model.replyTextFieldTextController.text != '') {
                        logFirebaseEvent('IconButton_backend_call');
                        _model.commentPostedBy =
                            await UsersRecord.getDocumentOnce(
                                widget.commentDoc!.postedBy!);
                        shouldSetState = true;
                        if ((_model.commentPostedBy?.displayName !=
                                widget.commentDoc?.snippetDisplayName) ||
                            (_model.commentPostedBy?.photoUrl !=
                                widget.commentDoc?.snippetPhotoUrl)) {
                          logFirebaseEvent('IconButton_backend_call');

                          await widget.commentDoc!.reference
                              .update(createCommentsRecordData(
                            snippetDisplayName:
                                _model.commentPostedBy?.displayName,
                            snippetPhotoUrl: _model.commentPostedBy?.photoUrl,
                          ));
                        }
                        if (_model.commentPostedBy!.blockedUsers
                            .contains(currentUserReference)) {
                          logFirebaseEvent('IconButton_bottom_sheet');
                          Navigator.pop(context);
                          logFirebaseEvent('IconButton_show_snack_bar');
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'You have been blocked from interacting with this user.',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: const Duration(milliseconds: 4000),
                              backgroundColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                          );
                          if (shouldSetState) safeSetState(() {});
                          return;
                        }
                        logFirebaseEvent('IconButton_backend_call');
                        _model.moderateTextReturn = await ModerateTextCall.call(
                          screenedText:
                              _model.replyTextFieldTextController.text,
                          key: getRemoteConfigString('azureModerationApiKey'),
                        );

                        shouldSetState = true;
                        if (valueOrDefault<bool>(
                              ModerateTextCall.pii(
                                    (_model.moderateTextReturn?.jsonBody ?? ''),
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
                                    (_model.moderateTextReturn?.jsonBody ?? ''),
                                  ),
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  ModerateTextCall.score2(
                                    (_model.moderateTextReturn?.jsonBody ?? ''),
                                  ),
                                  0.0,
                                ),
                                valueOrDefault<double>(
                                  ModerateTextCall.score3(
                                    (_model.moderateTextReturn?.jsonBody ?? ''),
                                  ),
                                  0.0,
                                ),
                                getRemoteConfigDouble('textMaxFoulRating')))) {
                          logFirebaseEvent('IconButton_alert_dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return WebViewAware(
                                child: AlertDialog(
                                  title: const Text('Whoa whoa!'),
                                  content: const Text(
                                      'It looks like your reply may be too sexual, offensive or reveal personal information. '),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
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

                        var commentRepliesRecordReference =
                            CommentRepliesRecord.collection.doc();
                        await commentRepliesRecordReference
                            .set(createCommentRepliesRecordData(
                          snippetDisplayName: currentUserDisplayName,
                          snippetPhotoUrl: currentUserPhoto,
                          createdTime: getCurrentTimestamp,
                          replyText: _model.replyTextFieldTextController.text,
                          postedBy: currentUserReference,
                          parentCommentRef: widget.commentDoc?.reference,
                        ));
                        _model.replycreated =
                            CommentRepliesRecord.getDocumentFromData(
                                createCommentRepliesRecordData(
                                  snippetDisplayName: currentUserDisplayName,
                                  snippetPhotoUrl: currentUserPhoto,
                                  createdTime: getCurrentTimestamp,
                                  replyText:
                                      _model.replyTextFieldTextController.text,
                                  postedBy: currentUserReference,
                                  parentCommentRef:
                                      widget.commentDoc?.reference,
                                ),
                                commentRepliesRecordReference);
                        shouldSetState = true;
                        logFirebaseEvent('IconButton_backend_call');

                        await widget.commentDoc!.reference.update({
                          ...mapToFirestore(
                            {
                              'comment_reply_refs': FieldValue.arrayUnion(
                                  [_model.replycreated?.reference]),
                            },
                          ),
                        });
                        if (widget.commentDoc?.postedBy !=
                            currentUserReference) {
                          // create notifications document
                          logFirebaseEvent(
                              'IconButton_createnotificationsdocument');
                          unawaited(
                            () async {
                              await UserNotificationsRecord.createDoc(
                                      widget.commentDoc!.postedBy!)
                                  .set(createUserNotificationsRecordData(
                                notificationType: 'new_comment_reply',
                                notificationHeader:
                                    '$currentUserDisplayName replied to your comment!',
                                createdTime: getCurrentTimestamp,
                                quoteRef: widget.commentDoc?.parentReference,
                                externalUserRef: currentUserReference,
                                notificationBody:
                                    ' replied \"${functions.getFirstNChars(_model.replyTextFieldTextController.text, 15)}...\"',
                                externalUserDisplayName: currentUserDisplayName,
                              ));
                            }(),
                          );
                          if (_model.commentPostedBy!.settings
                              .commentReplyNotifications) {
                            logFirebaseEvent(
                                'IconButton_trigger_push_notification');
                            triggerPushNotification(
                              notificationTitle:
                                  '$currentUserDisplayName replied to your comment!',
                              notificationText:
                                  _model.replyTextFieldTextController.text,
                              notificationSound: 'default',
                              userRefs: [widget.commentDoc!.postedBy!],
                              initialPageName: 'quoteDetailPage',
                              parameterData: {
                                'quoteRef': widget.commentDoc?.parentReference,
                                'parentPage': 'pushNotification',
                              },
                            );
                          }
                        }
                        // dismiss reply create
                        logFirebaseEvent('IconButton_dismissreplycreate');
                        Navigator.pop(context);
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
    );
  }
}
