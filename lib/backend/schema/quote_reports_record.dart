import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuoteReportsRecord extends FirestoreRecord {
  QuoteReportsRecord._(
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

  // "quote_summary" field.
  String? _quoteSummary;
  String get quoteSummary => _quoteSummary ?? '';
  bool hasQuoteSummary() => _quoteSummary != null;

  // "quote_ref" field.
  DocumentReference? _quoteRef;
  DocumentReference? get quoteRef => _quoteRef;
  bool hasQuoteRef() => _quoteRef != null;

  // "quote_foul_number" field.
  int? _quoteFoulNumber;
  int get quoteFoulNumber => _quoteFoulNumber ?? 0;
  bool hasQuoteFoulNumber() => _quoteFoulNumber != null;

  // "categories_posted_to" field.
  List<DocumentReference>? _categoriesPostedTo;
  List<DocumentReference> get categoriesPostedTo =>
      _categoriesPostedTo ?? const [];
  bool hasCategoriesPostedTo() => _categoriesPostedTo != null;

  void _initializeFields() {
    _reportReason = snapshotData['report_reason'] as String?;
    _reportContext = snapshotData['report_context'] as String?;
    _reportPostedBy = snapshotData['report_posted_by'] as DocumentReference?;
    _quoteSummary = snapshotData['quote_summary'] as String?;
    _quoteRef = snapshotData['quote_ref'] as DocumentReference?;
    _quoteFoulNumber = castToType<int>(snapshotData['quote_foul_number']);
    _categoriesPostedTo = getDataList(snapshotData['categories_posted_to']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quote_reports');

  static Stream<QuoteReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuoteReportsRecord.fromSnapshot(s));

  static Future<QuoteReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuoteReportsRecord.fromSnapshot(s));

  static QuoteReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuoteReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuoteReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuoteReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuoteReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuoteReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuoteReportsRecordData({
  String? reportReason,
  String? reportContext,
  DocumentReference? reportPostedBy,
  String? quoteSummary,
  DocumentReference? quoteRef,
  int? quoteFoulNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'report_reason': reportReason,
      'report_context': reportContext,
      'report_posted_by': reportPostedBy,
      'quote_summary': quoteSummary,
      'quote_ref': quoteRef,
      'quote_foul_number': quoteFoulNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuoteReportsRecordDocumentEquality
    implements Equality<QuoteReportsRecord> {
  const QuoteReportsRecordDocumentEquality();

  @override
  bool equals(QuoteReportsRecord? e1, QuoteReportsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.reportReason == e2?.reportReason &&
        e1?.reportContext == e2?.reportContext &&
        e1?.reportPostedBy == e2?.reportPostedBy &&
        e1?.quoteSummary == e2?.quoteSummary &&
        e1?.quoteRef == e2?.quoteRef &&
        e1?.quoteFoulNumber == e2?.quoteFoulNumber &&
        listEquality.equals(e1?.categoriesPostedTo, e2?.categoriesPostedTo);
  }

  @override
  int hash(QuoteReportsRecord? e) => const ListEquality().hash([
        e?.reportReason,
        e?.reportContext,
        e?.reportPostedBy,
        e?.quoteSummary,
        e?.quoteRef,
        e?.quoteFoulNumber,
        e?.categoriesPostedTo
      ]);

  @override
  bool isValidKey(Object? o) => o is QuoteReportsRecord;
}
