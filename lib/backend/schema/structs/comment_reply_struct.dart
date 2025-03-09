// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CommentReplyStruct extends FFFirebaseStruct {
  CommentReplyStruct({
    String? replyText,
    String? snippetDisplayName,
    String? snippetPhotoUrl,
    DateTime? createdTime,
    DocumentReference? postedBy,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _replyText = replyText,
        _snippetDisplayName = snippetDisplayName,
        _snippetPhotoUrl = snippetPhotoUrl,
        _createdTime = createdTime,
        _postedBy = postedBy,
        super(firestoreUtilData);

  // "reply_text" field.
  String? _replyText;
  String get replyText => _replyText ?? '';
  set replyText(String? val) => _replyText = val;

  bool hasReplyText() => _replyText != null;

  // "snippet_display_name" field.
  String? _snippetDisplayName;
  String get snippetDisplayName => _snippetDisplayName ?? '';
  set snippetDisplayName(String? val) => _snippetDisplayName = val;

  bool hasSnippetDisplayName() => _snippetDisplayName != null;

  // "snippet_photo_url" field.
  String? _snippetPhotoUrl;
  String get snippetPhotoUrl => _snippetPhotoUrl ?? '';
  set snippetPhotoUrl(String? val) => _snippetPhotoUrl = val;

  bool hasSnippetPhotoUrl() => _snippetPhotoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "posted_by" field.
  DocumentReference? _postedBy;
  DocumentReference? get postedBy => _postedBy;
  set postedBy(DocumentReference? val) => _postedBy = val;

  bool hasPostedBy() => _postedBy != null;

  static CommentReplyStruct fromMap(Map<String, dynamic> data) =>
      CommentReplyStruct(
        replyText: data['reply_text'] as String?,
        snippetDisplayName: data['snippet_display_name'] as String?,
        snippetPhotoUrl: data['snippet_photo_url'] as String?,
        createdTime: data['created_time'] as DateTime?,
        postedBy: data['posted_by'] as DocumentReference?,
      );

  static CommentReplyStruct? maybeFromMap(dynamic data) => data is Map
      ? CommentReplyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'reply_text': _replyText,
        'snippet_display_name': _snippetDisplayName,
        'snippet_photo_url': _snippetPhotoUrl,
        'created_time': _createdTime,
        'posted_by': _postedBy,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'reply_text': serializeParam(
          _replyText,
          ParamType.String,
        ),
        'snippet_display_name': serializeParam(
          _snippetDisplayName,
          ParamType.String,
        ),
        'snippet_photo_url': serializeParam(
          _snippetPhotoUrl,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'posted_by': serializeParam(
          _postedBy,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static CommentReplyStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentReplyStruct(
        replyText: deserializeParam(
          data['reply_text'],
          ParamType.String,
          false,
        ),
        snippetDisplayName: deserializeParam(
          data['snippet_display_name'],
          ParamType.String,
          false,
        ),
        snippetPhotoUrl: deserializeParam(
          data['snippet_photo_url'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        postedBy: deserializeParam(
          data['posted_by'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  static CommentReplyStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CommentReplyStruct(
        replyText: convertAlgoliaParam(
          data['reply_text'],
          ParamType.String,
          false,
        ),
        snippetDisplayName: convertAlgoliaParam(
          data['snippet_display_name'],
          ParamType.String,
          false,
        ),
        snippetPhotoUrl: convertAlgoliaParam(
          data['snippet_photo_url'],
          ParamType.String,
          false,
        ),
        createdTime: convertAlgoliaParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        postedBy: convertAlgoliaParam(
          data['posted_by'],
          ParamType.DocumentReference,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CommentReplyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CommentReplyStruct &&
        replyText == other.replyText &&
        snippetDisplayName == other.snippetDisplayName &&
        snippetPhotoUrl == other.snippetPhotoUrl &&
        createdTime == other.createdTime &&
        postedBy == other.postedBy;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [replyText, snippetDisplayName, snippetPhotoUrl, createdTime, postedBy]);
}

CommentReplyStruct createCommentReplyStruct({
  String? replyText,
  String? snippetDisplayName,
  String? snippetPhotoUrl,
  DateTime? createdTime,
  DocumentReference? postedBy,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentReplyStruct(
      replyText: replyText,
      snippetDisplayName: snippetDisplayName,
      snippetPhotoUrl: snippetPhotoUrl,
      createdTime: createdTime,
      postedBy: postedBy,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentReplyStruct? updateCommentReplyStruct(
  CommentReplyStruct? commentReply, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    commentReply
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentReplyStructData(
  Map<String, dynamic> firestoreData,
  CommentReplyStruct? commentReply,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (commentReply == null) {
    return;
  }
  if (commentReply.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && commentReply.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentReplyData =
      getCommentReplyFirestoreData(commentReply, forFieldValue);
  final nestedData =
      commentReplyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = commentReply.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentReplyFirestoreData(
  CommentReplyStruct? commentReply, [
  bool forFieldValue = false,
]) {
  if (commentReply == null) {
    return {};
  }
  final firestoreData = mapToFirestore(commentReply.toMap());

  // Add any Firestore field values
  commentReply.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentReplyListFirestoreData(
  List<CommentReplyStruct>? commentReplys,
) =>
    commentReplys?.map((e) => getCommentReplyFirestoreData(e, true)).toList() ??
    [];
