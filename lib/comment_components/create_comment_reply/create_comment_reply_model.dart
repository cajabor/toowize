import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_comment_reply_widget.dart' show CreateCommentReplyWidget;
import 'package:flutter/material.dart';

class CreateCommentReplyModel
    extends FlutterFlowModel<CreateCommentReplyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ReplyTextField widget.
  FocusNode? replyTextFieldFocusNode;
  TextEditingController? replyTextFieldTextController;
  String? Function(BuildContext, String?)?
      replyTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  UsersRecord? commentPostedBy;
  // Stores action output result for [Backend Call - API (moderateText)] action in IconButton widget.
  ApiCallResponse? moderateTextReturn;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  CommentRepliesRecord? replycreated;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    replyTextFieldFocusNode?.dispose();
    replyTextFieldTextController?.dispose();
  }
}
