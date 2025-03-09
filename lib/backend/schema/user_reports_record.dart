import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserReportsRecord extends FirestoreRecord {
  UserReportsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "report_reason" field.
  String? _reportReason;
  String get reportReason => _reportReason ?? '';
  bool hasReportReason() => _reportReason != null;

  // "report_context" field.
  String? _reportContext;
  String get reportContext => _reportContext ?? '';
  bool hasReportContext() => _reportContext != null;

  // "report_posted_by" field.
  DocumentReference? _reportPostedBy;
  DocumentReference? get reportPostedBy => _reportPostedBy;
  bool hasReportPostedBy() => _reportPostedBy != null;

  // "user_summary" field.
  String? _userSummary;
  String get userSummary => _userSummary ?? '';
  bool hasUserSummary() => _userSummary != null;

  // "user_foul_number" field.
  int? _userFoulNumber;
  int get userFoulNumber => _userFoulNumber ?? 0;
  bool hasUserFoulNumber() => _userFoulNumber != null;

  // "reported_user_ref" field.
  DocumentReference? _reportedUserRef;
  DocumentReference? get reportedUserRef => _reportedUserRef;
  bool hasReportedUserRef() => _reportedUserRef != null;

  void _initializeFields() {
    _reportReason = snapshotData['report_reason'] as String?;
    _reportContext = snapshotData['report_context'] as String?;
    _reportPostedBy = snapshotData['report_posted_by'] as DocumentReference?;
    _userSummary = snapshotData['user_summary'] as String?;
    _userFoulNumber = castToType<int>(snapshotData['user_foul_number']);
    _reportedUserRef = snapshotData['reported_user_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_reports');

  static Stream<UserReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserReportsRecord.fromSnapshot(s));

  static Future<UserReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserReportsRecord.fromSnapshot(s));

  static UserReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserReportsRecordData({
  String? reportReason,
  String? reportContext,
  DocumentReference? reportPostedBy,
  String? userSummary,
  int? userFoulNumber,
  DocumentReference? reportedUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'report_reason': reportReason,
      'report_context': reportContext,
      'report_posted_by': reportPostedBy,
      'user_summary': userSummary,
      'user_foul_number': userFoulNumber,
      'reported_user_ref': reportedUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserReportsRecordDocumentEquality implements Equality<UserReportsRecord> {
  const UserReportsRecordDocumentEquality();

  @override
  bool equals(UserReportsRecord? e1, UserReportsRecord? e2) {
    return e1?.reportReason == e2?.reportReason &&
        e1?.reportContext == e2?.reportContext &&
        e1?.reportPostedBy == e2?.reportPostedBy &&
        e1?.userSummary == e2?.userSummary &&
        e1?.userFoulNumber == e2?.userFoulNumber &&
        e1?.reportedUserRef == e2?.reportedUserRef;
  }

  @override
  int hash(UserReportsRecord? e) => const ListEquality().hash([
        e?.reportReason,
        e?.reportContext,
        e?.reportPostedBy,
        e?.userSummary,
        e?.userFoulNumber,
        e?.reportedUserRef
      ]);

  @override
  bool isValidKey(Object? o) => o is UserReportsRecord;
}
