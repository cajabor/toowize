import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuggestionsRecord extends FirestoreRecord {
  SuggestionsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "user_submitted_ref" field.
  DocumentReference? _userSubmittedRef;
  DocumentReference? get userSubmittedRef => _userSubmittedRef;
  bool hasUserSubmittedRef() => _userSubmittedRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "attached_image" field.
  String? _attachedImage;
  String get attachedImage => _attachedImage ?? '';
  bool hasAttachedImage() => _attachedImage != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _userSubmittedRef =
        snapshotData['user_submitted_ref'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _attachedImage = snapshotData['attached_image'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('suggestions');

  static Stream<SuggestionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuggestionsRecord.fromSnapshot(s));

  static Future<SuggestionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuggestionsRecord.fromSnapshot(s));

  static SuggestionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuggestionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuggestionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuggestionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuggestionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuggestionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuggestionsRecordData({
  DocumentReference? userSubmittedRef,
  String? title,
  String? description,
  String? attachedImage,
  String? displayName,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_submitted_ref': userSubmittedRef,
      'title': title,
      'description': description,
      'attached_image': attachedImage,
      'display_name': displayName,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuggestionsRecordDocumentEquality implements Equality<SuggestionsRecord> {
  const SuggestionsRecordDocumentEquality();

  @override
  bool equals(SuggestionsRecord? e1, SuggestionsRecord? e2) {
    return e1?.userSubmittedRef == e2?.userSubmittedRef &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.attachedImage == e2?.attachedImage &&
        e1?.displayName == e2?.displayName &&
        e1?.email == e2?.email;
  }

  @override
  int hash(SuggestionsRecord? e) => const ListEquality().hash([
        e?.userSubmittedRef,
        e?.title,
        e?.description,
        e?.attachedImage,
        e?.displayName,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is SuggestionsRecord;
}
