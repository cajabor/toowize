import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuotesRecord extends FirestoreRecord {
  QuotesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "quote_text" field.
  String? _quoteText;
  String get quoteText => _quoteText ?? '';
  bool hasQuoteText() => _quoteText != null;

  // "num_likes" field.
  int? _numLikes;
  int get numLikes => _numLikes ?? 0;
  bool hasNumLikes() => _numLikes != null;

  // "context" field.
  bool? _context;
  bool get context => _context ?? false;
  bool hasContext() => _context != null;

  // "context_by" field.
  String? _contextBy;
  String get contextBy => _contextBy ?? '';
  bool hasContextBy() => _contextBy != null;

  // "context_background" field.
  String? _contextBackground;
  String get contextBackground => _contextBackground ?? '';
  bool hasContextBackground() => _contextBackground != null;

  // "posted_by" field.
  DocumentReference? _postedBy;
  DocumentReference? get postedBy => _postedBy;
  bool hasPostedBy() => _postedBy != null;

  // "snippet_display_name" field.
  String? _snippetDisplayName;
  String get snippetDisplayName => _snippetDisplayName ?? '';
  bool hasSnippetDisplayName() => _snippetDisplayName != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "random_index" field.
  String? _randomIndex;
  String get randomIndex => _randomIndex ?? '';
  bool hasRandomIndex() => _randomIndex != null;

  // "background_image" field.
  String? _backgroundImage;
  String get backgroundImage => _backgroundImage ?? '';
  bool hasBackgroundImage() => _backgroundImage != null;

  // "snippet_photo_url" field.
  String? _snippetPhotoUrl;
  String get snippetPhotoUrl => _snippetPhotoUrl ?? '';
  bool hasSnippetPhotoUrl() => _snippetPhotoUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "qotd_eligible" field.
  bool? _qotdEligible;
  bool get qotdEligible => _qotdEligible ?? false;
  bool hasQotdEligible() => _qotdEligible != null;

  // "likes_milestones" field.
  LikesMilestonesStruct? _likesMilestones;
  LikesMilestonesStruct get likesMilestones =>
      _likesMilestones ?? LikesMilestonesStruct();
  bool hasLikesMilestones() => _likesMilestones != null;

  // "isImageUploaded" field.
  bool? _isImageUploaded;
  bool get isImageUploaded => _isImageUploaded ?? false;
  bool hasIsImageUploaded() => _isImageUploaded != null;

  // "foulRating" field.
  int? _foulRating;
  int get foulRating => _foulRating ?? 0;
  bool hasFoulRating() => _foulRating != null;

  // "categories_posted_to" field.
  List<DocumentReference>? _categoriesPostedTo;
  List<DocumentReference> get categoriesPostedTo =>
      _categoriesPostedTo ?? const [];
  bool hasCategoriesPostedTo() => _categoriesPostedTo != null;

  // "background_image_blur_hash" field.
  String? _backgroundImageBlurHash;
  String get backgroundImageBlurHash => _backgroundImageBlurHash ?? '';
  bool hasBackgroundImageBlurHash() => _backgroundImageBlurHash != null;

  // "isPinned" field.
  bool? _isPinned;
  bool get isPinned => _isPinned ?? false;
  bool hasIsPinned() => _isPinned != null;

  // "liked_by_users" field.
  List<String>? _likedByUsers;
  List<String> get likedByUsers => _likedByUsers ?? const [];
  bool hasLikedByUsers() => _likedByUsers != null;

  void _initializeFields() {
    _quoteText = snapshotData['quote_text'] as String?;
    _numLikes = castToType<int>(snapshotData['num_likes']);
    _context = snapshotData['context'] as bool?;
    _contextBy = snapshotData['context_by'] as String?;
    _contextBackground = snapshotData['context_background'] as String?;
    _postedBy = snapshotData['posted_by'] as DocumentReference?;
    _snippetDisplayName = snapshotData['snippet_display_name'] as String?;
    _numComments = castToType<int>(snapshotData['num_comments']);
    _randomIndex = snapshotData['random_index'] as String?;
    _backgroundImage = snapshotData['background_image'] as String?;
    _snippetPhotoUrl = snapshotData['snippet_photo_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _qotdEligible = snapshotData['qotd_eligible'] as bool?;
    _likesMilestones = snapshotData['likes_milestones'] is LikesMilestonesStruct
        ? snapshotData['likes_milestones']
        : LikesMilestonesStruct.maybeFromMap(snapshotData['likes_milestones']);
    _isImageUploaded = snapshotData['isImageUploaded'] as bool?;
    _foulRating = castToType<int>(snapshotData['foulRating']);
    _categoriesPostedTo = getDataList(snapshotData['categories_posted_to']);
    _backgroundImageBlurHash =
        snapshotData['background_image_blur_hash'] as String?;
    _isPinned = snapshotData['isPinned'] as bool?;
    _likedByUsers = getDataList(snapshotData['liked_by_users']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quotes');

  static Stream<QuotesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuotesRecord.fromSnapshot(s));

  static Future<QuotesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuotesRecord.fromSnapshot(s));

  static QuotesRecord fromSnapshot(DocumentSnapshot snapshot) => QuotesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuotesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuotesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuotesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuotesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuotesRecordData({
  String? quoteText,
  int? numLikes,
  bool? context,
  String? contextBy,
  String? contextBackground,
  DocumentReference? postedBy,
  String? snippetDisplayName,
  int? numComments,
  String? randomIndex,
  String? backgroundImage,
  String? snippetPhotoUrl,
  DateTime? createdTime,
  bool? qotdEligible,
  LikesMilestonesStruct? likesMilestones,
  bool? isImageUploaded,
  int? foulRating,
  String? backgroundImageBlurHash,
  bool? isPinned,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quote_text': quoteText,
      'num_likes': numLikes,
      'context': context,
      'context_by': contextBy,
      'context_background': contextBackground,
      'posted_by': postedBy,
      'snippet_display_name': snippetDisplayName,
      'num_comments': numComments,
      'random_index': randomIndex,
      'background_image': backgroundImage,
      'snippet_photo_url': snippetPhotoUrl,
      'created_time': createdTime,
      'qotd_eligible': qotdEligible,
      'likes_milestones': LikesMilestonesStruct().toMap(),
      'isImageUploaded': isImageUploaded,
      'foulRating': foulRating,
      'background_image_blur_hash': backgroundImageBlurHash,
      'isPinned': isPinned,
    }.withoutNulls,
  );

  // Handle nested data for "likes_milestones" field.
  addLikesMilestonesStructData(
      firestoreData, likesMilestones, 'likes_milestones');

  return firestoreData;
}

class QuotesRecordDocumentEquality implements Equality<QuotesRecord> {
  const QuotesRecordDocumentEquality();

  @override
  bool equals(QuotesRecord? e1, QuotesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.quoteText == e2?.quoteText &&
        e1?.numLikes == e2?.numLikes &&
        e1?.context == e2?.context &&
        e1?.contextBy == e2?.contextBy &&
        e1?.contextBackground == e2?.contextBackground &&
        e1?.postedBy == e2?.postedBy &&
        e1?.snippetDisplayName == e2?.snippetDisplayName &&
        e1?.numComments == e2?.numComments &&
        e1?.randomIndex == e2?.randomIndex &&
        e1?.backgroundImage == e2?.backgroundImage &&
        e1?.snippetPhotoUrl == e2?.snippetPhotoUrl &&
        e1?.createdTime == e2?.createdTime &&
        e1?.qotdEligible == e2?.qotdEligible &&
        e1?.likesMilestones == e2?.likesMilestones &&
        e1?.isImageUploaded == e2?.isImageUploaded &&
        e1?.foulRating == e2?.foulRating &&
        listEquality.equals(e1?.categoriesPostedTo, e2?.categoriesPostedTo) &&
        e1?.backgroundImageBlurHash == e2?.backgroundImageBlurHash &&
        e1?.isPinned == e2?.isPinned &&
        listEquality.equals(e1?.likedByUsers, e2?.likedByUsers);
  }

  @override
  int hash(QuotesRecord? e) => const ListEquality().hash([
        e?.quoteText,
        e?.numLikes,
        e?.context,
        e?.contextBy,
        e?.contextBackground,
        e?.postedBy,
        e?.snippetDisplayName,
        e?.numComments,
        e?.randomIndex,
        e?.backgroundImage,
        e?.snippetPhotoUrl,
        e?.createdTime,
        e?.qotdEligible,
        e?.likesMilestones,
        e?.isImageUploaded,
        e?.foulRating,
        e?.categoriesPostedTo,
        e?.backgroundImageBlurHash,
        e?.isPinned,
        e?.likedByUsers
      ]);

  @override
  bool isValidKey(Object? o) => o is QuotesRecord;
}
