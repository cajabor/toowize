import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "short_name" field.
  String? _shortName;
  String get shortName => _shortName ?? '';
  bool hasShortName() => _shortName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "isPopular" field.
  bool? _isPopular;
  bool get isPopular => _isPopular ?? false;
  bool hasIsPopular() => _isPopular != null;

  // "category_icon" field.
  String? _categoryIcon;
  String get categoryIcon => _categoryIcon ?? '';
  bool hasCategoryIcon() => _categoryIcon != null;

  // "ranking" field.
  int? _ranking;
  int get ranking => _ranking ?? 0;
  bool hasRanking() => _ranking != null;

  // "category_icon_white" field.
  String? _categoryIconWhite;
  String get categoryIconWhite => _categoryIconWhite ?? '';
  bool hasCategoryIconWhite() => _categoryIconWhite != null;

  // "isDisabled" field.
  bool? _isDisabled;
  bool get isDisabled => _isDisabled ?? false;
  bool hasIsDisabled() => _isDisabled != null;

  void _initializeFields() {
    _categoryName = snapshotData['category_name'] as String?;
    _shortName = snapshotData['short_name'] as String?;
    _description = snapshotData['description'] as String?;
    _isPopular = snapshotData['isPopular'] as bool?;
    _categoryIcon = snapshotData['category_icon'] as String?;
    _ranking = castToType<int>(snapshotData['ranking']);
    _categoryIconWhite = snapshotData['category_icon_white'] as String?;
    _isDisabled = snapshotData['isDisabled'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? categoryName,
  String? shortName,
  String? description,
  bool? isPopular,
  String? categoryIcon,
  int? ranking,
  String? categoryIconWhite,
  bool? isDisabled,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category_name': categoryName,
      'short_name': shortName,
      'description': description,
      'isPopular': isPopular,
      'category_icon': categoryIcon,
      'ranking': ranking,
      'category_icon_white': categoryIconWhite,
      'isDisabled': isDisabled,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.categoryName == e2?.categoryName &&
        e1?.shortName == e2?.shortName &&
        e1?.description == e2?.description &&
        e1?.isPopular == e2?.isPopular &&
        e1?.categoryIcon == e2?.categoryIcon &&
        e1?.ranking == e2?.ranking &&
        e1?.categoryIconWhite == e2?.categoryIconWhite &&
        e1?.isDisabled == e2?.isDisabled;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality().hash([
        e?.categoryName,
        e?.shortName,
        e?.description,
        e?.isPopular,
        e?.categoryIcon,
        e?.ranking,
        e?.categoryIconWhite,
        e?.isDisabled
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
