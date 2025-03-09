// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LikesMilestonesStruct extends FFFirebaseStruct {
  LikesMilestonesStruct({
    bool? milestone69,
    bool? milestone111,
    bool? milestone500,
    bool? milestone1000,
    bool? milestone10000,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _milestone69 = milestone69,
        _milestone111 = milestone111,
        _milestone500 = milestone500,
        _milestone1000 = milestone1000,
        _milestone10000 = milestone10000,
        super(firestoreUtilData);

  // "milestone_69" field.
  bool? _milestone69;
  bool get milestone69 => _milestone69 ?? false;
  set milestone69(bool? val) => _milestone69 = val;

  bool hasMilestone69() => _milestone69 != null;

  // "milestone_111" field.
  bool? _milestone111;
  bool get milestone111 => _milestone111 ?? false;
  set milestone111(bool? val) => _milestone111 = val;

  bool hasMilestone111() => _milestone111 != null;

  // "milestone_500" field.
  bool? _milestone500;
  bool get milestone500 => _milestone500 ?? false;
  set milestone500(bool? val) => _milestone500 = val;

  bool hasMilestone500() => _milestone500 != null;

  // "milestone_1000" field.
  bool? _milestone1000;
  bool get milestone1000 => _milestone1000 ?? false;
  set milestone1000(bool? val) => _milestone1000 = val;

  bool hasMilestone1000() => _milestone1000 != null;

  // "milestone_10_000" field.
  bool? _milestone10000;
  bool get milestone10000 => _milestone10000 ?? false;
  set milestone10000(bool? val) => _milestone10000 = val;

  bool hasMilestone10000() => _milestone10000 != null;

  static LikesMilestonesStruct fromMap(Map<String, dynamic> data) =>
      LikesMilestonesStruct(
        milestone69: data['milestone_69'] as bool?,
        milestone111: data['milestone_111'] as bool?,
        milestone500: data['milestone_500'] as bool?,
        milestone1000: data['milestone_1000'] as bool?,
        milestone10000: data['milestone_10_000'] as bool?,
      );

  static LikesMilestonesStruct? maybeFromMap(dynamic data) => data is Map
      ? LikesMilestonesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'milestone_69': _milestone69,
        'milestone_111': _milestone111,
        'milestone_500': _milestone500,
        'milestone_1000': _milestone1000,
        'milestone_10_000': _milestone10000,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'milestone_69': serializeParam(
          _milestone69,
          ParamType.bool,
        ),
        'milestone_111': serializeParam(
          _milestone111,
          ParamType.bool,
        ),
        'milestone_500': serializeParam(
          _milestone500,
          ParamType.bool,
        ),
        'milestone_1000': serializeParam(
          _milestone1000,
          ParamType.bool,
        ),
        'milestone_10_000': serializeParam(
          _milestone10000,
          ParamType.bool,
        ),
      }.withoutNulls;

  static LikesMilestonesStruct fromSerializableMap(Map<String, dynamic> data) =>
      LikesMilestonesStruct(
        milestone69: deserializeParam(
          data['milestone_69'],
          ParamType.bool,
          false,
        ),
        milestone111: deserializeParam(
          data['milestone_111'],
          ParamType.bool,
          false,
        ),
        milestone500: deserializeParam(
          data['milestone_500'],
          ParamType.bool,
          false,
        ),
        milestone1000: deserializeParam(
          data['milestone_1000'],
          ParamType.bool,
          false,
        ),
        milestone10000: deserializeParam(
          data['milestone_10_000'],
          ParamType.bool,
          false,
        ),
      );

  static LikesMilestonesStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LikesMilestonesStruct(
        milestone69: convertAlgoliaParam(
          data['milestone_69'],
          ParamType.bool,
          false,
        ),
        milestone111: convertAlgoliaParam(
          data['milestone_111'],
          ParamType.bool,
          false,
        ),
        milestone500: convertAlgoliaParam(
          data['milestone_500'],
          ParamType.bool,
          false,
        ),
        milestone1000: convertAlgoliaParam(
          data['milestone_1000'],
          ParamType.bool,
          false,
        ),
        milestone10000: convertAlgoliaParam(
          data['milestone_10_000'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LikesMilestonesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LikesMilestonesStruct &&
        milestone69 == other.milestone69 &&
        milestone111 == other.milestone111 &&
        milestone500 == other.milestone500 &&
        milestone1000 == other.milestone1000 &&
        milestone10000 == other.milestone10000;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [milestone69, milestone111, milestone500, milestone1000, milestone10000]);
}

LikesMilestonesStruct createLikesMilestonesStruct({
  bool? milestone69,
  bool? milestone111,
  bool? milestone500,
  bool? milestone1000,
  bool? milestone10000,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LikesMilestonesStruct(
      milestone69: milestone69,
      milestone111: milestone111,
      milestone500: milestone500,
      milestone1000: milestone1000,
      milestone10000: milestone10000,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LikesMilestonesStruct? updateLikesMilestonesStruct(
  LikesMilestonesStruct? likesMilestones, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    likesMilestones
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLikesMilestonesStructData(
  Map<String, dynamic> firestoreData,
  LikesMilestonesStruct? likesMilestones,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (likesMilestones == null) {
    return;
  }
  if (likesMilestones.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && likesMilestones.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final likesMilestonesData =
      getLikesMilestonesFirestoreData(likesMilestones, forFieldValue);
  final nestedData =
      likesMilestonesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = likesMilestones.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLikesMilestonesFirestoreData(
  LikesMilestonesStruct? likesMilestones, [
  bool forFieldValue = false,
]) {
  if (likesMilestones == null) {
    return {};
  }
  final firestoreData = mapToFirestore(likesMilestones.toMap());

  // Add any Firestore field values
  likesMilestones.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLikesMilestonesListFirestoreData(
  List<LikesMilestonesStruct>? likesMilestoness,
) =>
    likesMilestoness
        ?.map((e) => getLikesMilestonesFirestoreData(e, true))
        .toList() ??
    [];
