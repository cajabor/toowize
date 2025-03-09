import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QotdRecord extends FirestoreRecord {
  QotdRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "og_quote_ref" field.
  DocumentReference? _ogQuoteRef;
  DocumentReference? get ogQuoteRef => _ogQuoteRef;
  bool hasOgQuoteRef() => _ogQuoteRef != null;

  void _initializeFields() {
    _ogQuoteRef = snapshotData['og_quote_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QOTD');

  static Stream<QotdRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QotdRecord.fromSnapshot(s));

  static Future<QotdRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QotdRecord.fromSnapshot(s));

  static QotdRecord fromSnapshot(DocumentSnapshot snapshot) => QotdRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QotdRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QotdRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QotdRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QotdRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQotdRecordData({
  DocumentReference? ogQuoteRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'og_quote_ref': ogQuoteRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class QotdRecordDocumentEquality implements Equality<QotdRecord> {
  const QotdRecordDocumentEquality();

  @override
  bool equals(QotdRecord? e1, QotdRecord? e2) {
    return e1?.ogQuoteRef == e2?.ogQuoteRef;
  }

  @override
  int hash(QotdRecord? e) => const ListEquality().hash([e?.ogQuoteRef]);

  @override
  bool isValidKey(Object? o) => o is QotdRecord;
}
