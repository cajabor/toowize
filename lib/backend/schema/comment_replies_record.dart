import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentRepliesRecord extends FirestoreRecord {
  CommentRepliesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reply_text" field.
  String? _replyText;
  String get replyText => _replyText ?? '';
  bool hasReplyText() => _replyText != null;

  // "snippet_display_name" field.
  String? _snippetDisplayName;
  String get snippetDisplayName => _snippetDisplayName ?? '';
  bool hasSnippetDisplayName() => _snippetDisplayName != null;

  // "snippet_photo_url" field.
  String? _snippetPhotoUrl;
  String get snippetPhotoUrl => _snippetPhotoUrl ?? '';
  bool hasSnippetPhotoUrl() => _snippetPhotoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "posted_by" field.
  DocumentReference? _postedBy;
  DocumentReference? get postedBy => _postedBy;
  bool hasPostedBy() => _postedBy != null;

  // "reply_liked_by" field.
  List<DocumentReference>? _replyLikedBy;
  List<DocumentReference> get replyLikedBy => _replyLikedBy ?? const [];
  bool hasReplyLikedBy() => _replyLikedBy != null;

  // "parent_comment_ref" field.
  DocumentReference? _parentCommentRef;
  DocumentReference? get parentCommentRef => _parentCommentRef;
  bool hasParentCommentRef() => _parentCommentRef != null;

  void _initializeFields() {
    _replyText = snapshotData['reply_text'] as String?;
    _snippetDisplayName = snapshotData['snippet_display_name'] as String?;
    _snippetPhotoUrl = snapshotData['snippet_photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _postedBy = snapshotData['posted_by'] as DocumentReference?;
    _replyLikedBy = getDataList(snapshotData['reply_liked_by']);
    _parentCommentRef =
        snapshotData['parent_comment_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comment_replies');

  static Stream<CommentRepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentRepliesRecord.fromSnapshot(s));

  static Future<CommentRepliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentRepliesRecord.fromSnapshot(s));

  static CommentRepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentRepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentRepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentRepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentRepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentRepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentRepliesRecordData({
  String? replyText,
  String? snippetDisplayName,
  String? snippetPhotoUrl,
  DateTime? createdTime,
  DocumentReference? postedBy,
  DocumentReference? parentCommentRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reply_text': replyText,
      'snippet_display_name': snippetDisplayName,
      'snippet_photo_url': snippetPhotoUrl,
      'created_time': createdTime,
      'posted_by': postedBy,
      'parent_comment_ref': parentCommentRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentRepliesRecordDocumentEquality
    implements Equality<CommentRepliesRecord> {
  const CommentRepliesRecordDocumentEquality();

  @override
  bool equals(CommentRepliesRecord? e1, CommentRepliesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.replyText == e2?.replyText &&
        e1?.snippetDisplayName == e2?.snippetDisplayName &&
        e1?.snippetPhotoUrl == e2?.snippetPhotoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.postedBy == e2?.postedBy &&
        listEquality.equals(e1?.replyLikedBy, e2?.replyLikedBy) &&
        e1?.parentCommentRef == e2?.parentCommentRef;
  }

  @override
  int hash(CommentRepliesRecord? e) => const ListEquality().hash([
        e?.replyText,
        e?.snippetDisplayName,
        e?.snippetPhotoUrl,
        e?.createdTime,
        e?.postedBy,
        e?.replyLikedBy,
        e?.parentCommentRef
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentRepliesRecord;
}
