// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SettingsStruct extends FFFirebaseStruct {
  SettingsStruct({
    bool? likesMilestonesNotifications,
    bool? commentNotifications,
    bool? followerNotfications,
    bool? qOTDNotifications,
    bool? commentReplyNotifications,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _likesMilestonesNotifications = likesMilestonesNotifications,
        _commentNotifications = commentNotifications,
        _followerNotfications = followerNotfications,
        _qOTDNotifications = qOTDNotifications,
        _commentReplyNotifications = commentReplyNotifications,
        super(firestoreUtilData);

  // "likes_milestones_notifications" field.
  bool? _likesMilestonesNotifications;
  bool get likesMilestonesNotifications =>
      _likesMilestonesNotifications ?? false;
  set likesMilestonesNotifications(bool? val) =>
      _likesMilestonesNotifications = val;

  bool hasLikesMilestonesNotifications() =>
      _likesMilestonesNotifications != null;

  // "comment_notifications" field.
  bool? _commentNotifications;
  bool get commentNotifications => _commentNotifications ?? false;
  set commentNotifications(bool? val) => _commentNotifications = val;

  bool hasCommentNotifications() => _commentNotifications != null;

  // "follower_notfications" field.
  bool? _followerNotfications;
  bool get followerNotfications => _followerNotfications ?? false;
  set followerNotfications(bool? val) => _followerNotfications = val;

  bool hasFollowerNotfications() => _followerNotfications != null;

  // "QOTD_notifications" field.
  bool? _qOTDNotifications;
  bool get qOTDNotifications => _qOTDNotifications ?? false;
  set qOTDNotifications(bool? val) => _qOTDNotifications = val;

  bool hasQOTDNotifications() => _qOTDNotifications != null;

  // "comment_reply_notifications" field.
  bool? _commentReplyNotifications;
  bool get commentReplyNotifications => _commentReplyNotifications ?? false;
  set commentReplyNotifications(bool? val) => _commentReplyNotifications = val;

  bool hasCommentReplyNotifications() => _commentReplyNotifications != null;

  static SettingsStruct fromMap(Map<String, dynamic> data) => SettingsStruct(
        likesMilestonesNotifications:
            data['likes_milestones_notifications'] as bool?,
        commentNotifications: data['comment_notifications'] as bool?,
        followerNotfications: data['follower_notfications'] as bool?,
        qOTDNotifications: data['QOTD_notifications'] as bool?,
        commentReplyNotifications: data['comment_reply_notifications'] as bool?,
      );

  static SettingsStruct? maybeFromMap(dynamic data) =>
      data is Map ? SettingsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'likes_milestones_notifications': _likesMilestonesNotifications,
        'comment_notifications': _commentNotifications,
        'follower_notfications': _followerNotfications,
        'QOTD_notifications': _qOTDNotifications,
        'comment_reply_notifications': _commentReplyNotifications,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'likes_milestones_notifications': serializeParam(
          _likesMilestonesNotifications,
          ParamType.bool,
        ),
        'comment_notifications': serializeParam(
          _commentNotifications,
          ParamType.bool,
        ),
        'follower_notfications': serializeParam(
          _followerNotfications,
          ParamType.bool,
        ),
        'QOTD_notifications': serializeParam(
          _qOTDNotifications,
          ParamType.bool,
        ),
        'comment_reply_notifications': serializeParam(
          _commentReplyNotifications,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      SettingsStruct(
        likesMilestonesNotifications: deserializeParam(
          data['likes_milestones_notifications'],
          ParamType.bool,
          false,
        ),
        commentNotifications: deserializeParam(
          data['comment_notifications'],
          ParamType.bool,
          false,
        ),
        followerNotfications: deserializeParam(
          data['follower_notfications'],
          ParamType.bool,
          false,
        ),
        qOTDNotifications: deserializeParam(
          data['QOTD_notifications'],
          ParamType.bool,
          false,
        ),
        commentReplyNotifications: deserializeParam(
          data['comment_reply_notifications'],
          ParamType.bool,
          false,
        ),
      );

  static SettingsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SettingsStruct(
        likesMilestonesNotifications: convertAlgoliaParam(
          data['likes_milestones_notifications'],
          ParamType.bool,
          false,
        ),
        commentNotifications: convertAlgoliaParam(
          data['comment_notifications'],
          ParamType.bool,
          false,
        ),
        followerNotfications: convertAlgoliaParam(
          data['follower_notfications'],
          ParamType.bool,
          false,
        ),
        qOTDNotifications: convertAlgoliaParam(
          data['QOTD_notifications'],
          ParamType.bool,
          false,
        ),
        commentReplyNotifications: convertAlgoliaParam(
          data['comment_reply_notifications'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SettingsStruct &&
        likesMilestonesNotifications == other.likesMilestonesNotifications &&
        commentNotifications == other.commentNotifications &&
        followerNotfications == other.followerNotfications &&
        qOTDNotifications == other.qOTDNotifications &&
        commentReplyNotifications == other.commentReplyNotifications;
  }

  @override
  int get hashCode => const ListEquality().hash([
        likesMilestonesNotifications,
        commentNotifications,
        followerNotfications,
        qOTDNotifications,
        commentReplyNotifications
      ]);
}

SettingsStruct createSettingsStruct({
  bool? likesMilestonesNotifications,
  bool? commentNotifications,
  bool? followerNotfications,
  bool? qOTDNotifications,
  bool? commentReplyNotifications,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SettingsStruct(
      likesMilestonesNotifications: likesMilestonesNotifications,
      commentNotifications: commentNotifications,
      followerNotfications: followerNotfications,
      qOTDNotifications: qOTDNotifications,
      commentReplyNotifications: commentReplyNotifications,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SettingsStruct? updateSettingsStruct(
  SettingsStruct? settings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    settings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSettingsStructData(
  Map<String, dynamic> firestoreData,
  SettingsStruct? settings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (settings == null) {
    return;
  }
  if (settings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && settings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final settingsData = getSettingsFirestoreData(settings, forFieldValue);
  final nestedData = settingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = settings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSettingsFirestoreData(
  SettingsStruct? settings, [
  bool forFieldValue = false,
]) {
  if (settings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(settings.toMap());

  // Add any Firestore field values
  settings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSettingsListFirestoreData(
  List<SettingsStruct>? settingss,
) =>
    settingss?.map((e) => getSettingsFirestoreData(e, true)).toList() ?? [];
