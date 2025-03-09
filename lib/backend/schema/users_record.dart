import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "total_likes" field.
  int? _totalLikes;
  int get totalLikes => _totalLikes ?? 0;
  bool hasTotalLikes() => _totalLikes != null;

  // "favorite_categories" field.
  List<DocumentReference>? _favoriteCategories;
  List<DocumentReference> get favoriteCategories =>
      _favoriteCategories ?? const [];
  bool hasFavoriteCategories() => _favoriteCategories != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "last_posted_time" field.
  DateTime? _lastPostedTime;
  DateTime? get lastPostedTime => _lastPostedTime;
  bool hasLastPostedTime() => _lastPostedTime != null;

  // "following_users" field.
  List<DocumentReference>? _followingUsers;
  List<DocumentReference> get followingUsers => _followingUsers ?? const [];
  bool hasFollowingUsers() => _followingUsers != null;

  // "blocked_users" field.
  List<DocumentReference>? _blockedUsers;
  List<DocumentReference> get blockedUsers => _blockedUsers ?? const [];
  bool hasBlockedUsers() => _blockedUsers != null;

  // "user_foul_rating" field.
  int? _userFoulRating;
  int get userFoulRating => _userFoulRating ?? 0;
  bool hasUserFoulRating() => _userFoulRating != null;

  // "settings" field.
  SettingsStruct? _settings;
  SettingsStruct get settings => _settings ?? SettingsStruct();
  bool hasSettings() => _settings != null;

  // "adrl" field.
  bool? _adrl;
  bool get adrl => _adrl ?? false;
  bool hasAdrl() => _adrl != null;

  // "oneSignalSubscribed" field.
  bool? _oneSignalSubscribed;
  bool get oneSignalSubscribed => _oneSignalSubscribed ?? false;
  bool hasOneSignalSubscribed() => _oneSignalSubscribed != null;

  // "streak" field.
  int? _streak;
  int get streak => _streak ?? 0;
  bool hasStreak() => _streak != null;

  // "lastAppOpen" field.
  DateTime? _lastAppOpen;
  DateTime? get lastAppOpen => _lastAppOpen;
  bool hasLastAppOpen() => _lastAppOpen != null;

  void _initializeFields() {
    _displayName = snapshotData['display_name'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _email = snapshotData['email'] as String?;
    _totalLikes = castToType<int>(snapshotData['total_likes']);
    _favoriteCategories = getDataList(snapshotData['favorite_categories']);
    _bio = snapshotData['bio'] as String?;
    _lastPostedTime = snapshotData['last_posted_time'] as DateTime?;
    _followingUsers = getDataList(snapshotData['following_users']);
    _blockedUsers = getDataList(snapshotData['blocked_users']);
    _userFoulRating = castToType<int>(snapshotData['user_foul_rating']);
    _settings = snapshotData['settings'] is SettingsStruct
        ? snapshotData['settings']
        : SettingsStruct.maybeFromMap(snapshotData['settings']);
    _adrl = snapshotData['adrl'] as bool?;
    _oneSignalSubscribed = snapshotData['oneSignalSubscribed'] as bool?;
    _streak = castToType<int>(snapshotData['streak']);
    _lastAppOpen = snapshotData['lastAppOpen'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'display_name': snapshot.data['display_name'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'email': snapshot.data['email'],
          'total_likes': convertAlgoliaParam(
            snapshot.data['total_likes'],
            ParamType.int,
            false,
          ),
          'favorite_categories': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['favorite_categories'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'bio': snapshot.data['bio'],
          'last_posted_time': convertAlgoliaParam(
            snapshot.data['last_posted_time'],
            ParamType.DateTime,
            false,
          ),
          'following_users': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['following_users'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'blocked_users': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['blocked_users'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'user_foul_rating': convertAlgoliaParam(
            snapshot.data['user_foul_rating'],
            ParamType.int,
            false,
          ),
          'settings':
              SettingsStruct.fromAlgoliaData(snapshot.data['settings'] ?? {})
                  .toMap(),
          'adrl': snapshot.data['adrl'],
          'oneSignalSubscribed': snapshot.data['oneSignalSubscribed'],
          'streak': convertAlgoliaParam(
            snapshot.data['streak'],
            ParamType.int,
            false,
          ),
          'lastAppOpen': convertAlgoliaParam(
            snapshot.data['lastAppOpen'],
            ParamType.DateTime,
            false,
          ),
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? displayName,
  DateTime? createdTime,
  String? phoneNumber,
  String? photoUrl,
  String? uid,
  String? email,
  int? totalLikes,
  String? bio,
  DateTime? lastPostedTime,
  int? userFoulRating,
  SettingsStruct? settings,
  bool? adrl,
  bool? oneSignalSubscribed,
  int? streak,
  DateTime? lastAppOpen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'display_name': displayName,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'uid': uid,
      'email': email,
      'total_likes': totalLikes,
      'bio': bio,
      'last_posted_time': lastPostedTime,
      'user_foul_rating': userFoulRating,
      'settings': SettingsStruct().toMap(),
      'adrl': adrl,
      'oneSignalSubscribed': oneSignalSubscribed,
      'streak': streak,
      'lastAppOpen': lastAppOpen,
    }.withoutNulls,
  );

  // Handle nested data for "settings" field.
  addSettingsStructData(firestoreData, settings, 'settings');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.displayName == e2?.displayName &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.email == e2?.email &&
        e1?.totalLikes == e2?.totalLikes &&
        listEquality.equals(e1?.favoriteCategories, e2?.favoriteCategories) &&
        e1?.bio == e2?.bio &&
        e1?.lastPostedTime == e2?.lastPostedTime &&
        listEquality.equals(e1?.followingUsers, e2?.followingUsers) &&
        listEquality.equals(e1?.blockedUsers, e2?.blockedUsers) &&
        e1?.userFoulRating == e2?.userFoulRating &&
        e1?.settings == e2?.settings &&
        e1?.adrl == e2?.adrl &&
        e1?.oneSignalSubscribed == e2?.oneSignalSubscribed &&
        e1?.streak == e2?.streak &&
        e1?.lastAppOpen == e2?.lastAppOpen;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.displayName,
        e?.createdTime,
        e?.phoneNumber,
        e?.photoUrl,
        e?.uid,
        e?.email,
        e?.totalLikes,
        e?.favoriteCategories,
        e?.bio,
        e?.lastPostedTime,
        e?.followingUsers,
        e?.blockedUsers,
        e?.userFoulRating,
        e?.settings,
        e?.adrl,
        e?.oneSignalSubscribed,
        e?.streak,
        e?.lastAppOpen
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
