import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserNotificationsRecord extends FirestoreRecord {
  UserNotificationsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "notification_type" field.
  String? _notificationType;
  String get notificationType => _notificationType ?? '';
  bool hasNotificationType() => _notificationType != null;

  // "notification_header" field.
  String? _notificationHeader;
  String get notificationHeader => _notificationHeader ?? '';
  bool hasNotificationHeader() => _notificationHeader != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "quote_ref" field.
  DocumentReference? _quoteRef;
  DocumentReference? get quoteRef => _quoteRef;
  bool hasQuoteRef() => _quoteRef != null;

  // "external_user_ref" field.
  DocumentReference? _externalUserRef;
  DocumentReference? get externalUserRef => _externalUserRef;
  bool hasExternalUserRef() => _externalUserRef != null;

  // "notification_body" field.
  String? _notificationBody;
  String get notificationBody => _notificationBody ?? '';
  bool hasNotificationBody() => _notificationBody != null;

  // "external_user_display_name" field.
  String? _externalUserDisplayName;
  String get externalUserDisplayName => _externalUserDisplayName ?? '';
  bool hasExternalUserDisplayName() => _externalUserDisplayName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _notificationType = snapshotData['notification_type'] as String?;
    _notificationHeader = snapshotData['notification_header'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _quoteRef = snapshotData['quote_ref'] as DocumentReference?;
    _externalUserRef = snapshotData['external_user_ref'] as DocumentReference?;
    _notificationBody = snapshotData['notification_body'] as String?;
    _externalUserDisplayName =
        snapshotData['external_user_display_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('userNotifications')
          : FirebaseFirestore.instance.collectionGroup('userNotifications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('userNotifications').doc(id);

  static Stream<UserNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserNotificationsRecord.fromSnapshot(s));

  static Future<UserNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserNotificationsRecord.fromSnapshot(s));

  static UserNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserNotificationsRecordData({
  String? notificationType,
  String? notificationHeader,
  DateTime? createdTime,
  DocumentReference? quoteRef,
  DocumentReference? externalUserRef,
  String? notificationBody,
  String? externalUserDisplayName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_type': notificationType,
      'notification_header': notificationHeader,
      'created_time': createdTime,
      'quote_ref': quoteRef,
      'external_user_ref': externalUserRef,
      'notification_body': notificationBody,
      'external_user_display_name': externalUserDisplayName,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserNotificationsRecordDocumentEquality
    implements Equality<UserNotificationsRecord> {
  const UserNotificationsRecordDocumentEquality();

  @override
  bool equals(UserNotificationsRecord? e1, UserNotificationsRecord? e2) {
    return e1?.notificationType == e2?.notificationType &&
        e1?.notificationHeader == e2?.notificationHeader &&
        e1?.createdTime == e2?.createdTime &&
        e1?.quoteRef == e2?.quoteRef &&
        e1?.externalUserRef == e2?.externalUserRef &&
        e1?.notificationBody == e2?.notificationBody &&
        e1?.externalUserDisplayName == e2?.externalUserDisplayName;
  }

  @override
  int hash(UserNotificationsRecord? e) => const ListEquality().hash([
        e?.notificationType,
        e?.notificationHeader,
        e?.createdTime,
        e?.quoteRef,
        e?.externalUserRef,
        e?.notificationBody,
        e?.externalUserDisplayName
      ]);

  @override
  bool isValidKey(Object? o) => o is UserNotificationsRecord;
}
