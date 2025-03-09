import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsRecord extends FirestoreRecord {
  CommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "comment_text" field.
  String? _commentText;
  String get commentText => _commentText ?? '';
  bool hasCommentText() => _commentText != null;

  // "posted_by" field.
  DocumentReference? _postedBy;
  DocumentReference? get postedBy => _postedBy;
  bool hasPostedBy() => _postedBy != null;

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

  // "comment_liked_by_users" field.
  List<DocumentReference>? _commentLikedByUsers;
  List<DocumentReference> get commentLikedByUsers =>
      _commentLikedByUsers ?? const [];
  bool hasCommentLikedByUsers() => _commentLikedByUsers != null;

  // "comment_approx_likes" field.
  int? _commentApproxLikes;
  int get commentApproxLikes => _commentApproxLikes ?? 0;
  bool hasCommentApproxLikes() => _commentApproxLikes != null;

  // "isPinned" field.
  bool? _isPinned;
  bool get isPinned => _isPinned ?? false;
  bool hasIsPinned() => _isPinned != null;

  // "comment_replies" field.
  List<CommentReplyStruct>? _commentReplies;
  List<CommentReplyStruct> get commentReplies => _commentReplies ?? const [];
  bool hasCommentReplies() => _commentReplies != null;

  // "comment_reply_refs" field.
  List<DocumentReference>? _commentReplyRefs;
  List<DocumentReference> get commentReplyRefs => _commentReplyRefs ?? const [];
  bool hasCommentReplyRefs() => _commentReplyRefs != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _commentText = snapshotData['comment_text'] as String?;
    _postedBy = snapshotData['posted_by'] as DocumentReference?;
    _snippetDisplayName = snapshotData['snippet_display_name'] as String?;
    _snippetPhotoUrl = snapshotData['snippet_photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _commentLikedByUsers = getDataList(snapshotData['comment_liked_by_users']);
    _commentApproxLikes = castToType<int>(snapshotData['comment_approx_likes']);
    _isPinned = snapshotData['isPinned'] as bool?;
    _commentReplies = getStructList(
      snapshotData['comment_replies'],
      CommentReplyStruct.fromMap,
    );
    _commentReplyRefs = getDataList(snapshotData['comment_reply_refs']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('comments')
          : FirebaseFirestore.instance.collectionGroup('comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('comments').doc(id);

  static Stream<CommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsRecord.fromSnapshot(s));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsRecord.fromSnapshot(s));

  static CommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsRecordData({
  String? commentText,
  DocumentReference? postedBy,
  String? snippetDisplayName,
  String? snippetPhotoUrl,
  DateTime? createdTime,
  int? commentApproxLikes,
  bool? isPinned,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_text': commentText,
      'posted_by': postedBy,
      'snippet_display_name': snippetDisplayName,
      'snippet_photo_url': snippetPhotoUrl,
      'created_time': createdTime,
      'comment_approx_likes': commentApproxLikes,
      'isPinned': isPinned,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsRecordDocumentEquality implements Equality<CommentsRecord> {
  const CommentsRecordDocumentEquality();

  @override
  bool equals(CommentsRecord? e1, CommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.commentText == e2?.commentText &&
        e1?.postedBy == e2?.postedBy &&
        e1?.snippetDisplayName == e2?.snippetDisplayName &&
        e1?.snippetPhotoUrl == e2?.snippetPhotoUrl &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.commentLikedByUsers, e2?.commentLikedByUsers) &&
        e1?.commentApproxLikes == e2?.commentApproxLikes &&
        e1?.isPinned == e2?.isPinned &&
        listEquality.equals(e1?.commentReplies, e2?.commentReplies) &&
        listEquality.equals(e1?.commentReplyRefs, e2?.commentReplyRefs);
  }

  @override
  int hash(CommentsRecord? e) => const ListEquality().hash([
        e?.commentText,
        e?.postedBy,
        e?.snippetDisplayName,
        e?.snippetPhotoUrl,
        e?.createdTime,
        e?.commentLikedByUsers,
        e?.commentApproxLikes,
        e?.isPinned,
        e?.commentReplies,
        e?.commentReplyRefs
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsRecord;
}
