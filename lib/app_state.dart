import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _followingCategoryReference =
          (await secureStorage.getString('ff_followingCategoryReference'))
                  ?.ref ??
              _followingCategoryReference;
    });
    await _safeInitAsync(() async {
      _premiumQuotesCategoryRef =
          (await secureStorage.getString('ff_premiumQuotesCategoryRef'))?.ref ??
              _premiumQuotesCategoryRef;
    });
    await _safeInitAsync(() async {
      _appVersion =
          await secureStorage.getString('ff_appVersion') ?? _appVersion;
    });
    await _safeInitAsync(() async {
      _QOTDLastView = await secureStorage.read(key: 'ff_QOTDLastView') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_QOTDLastView'))!)
          : _QOTDLastView;
    });
    await _safeInitAsync(() async {
      _lastCache = await secureStorage.read(key: 'ff_lastCache') != null
          ? DateTime.fromMillisecondsSinceEpoch(
              (await secureStorage.getInt('ff_lastCache'))!)
          : _lastCache;
    });
    await _safeInitAsync(() async {
      _QOTDNotifications =
          await secureStorage.getBool('ff_QOTDNotifications') ??
              _QOTDNotifications;
    });
    await _safeInitAsync(() async {
      _appFirstOpen =
          await secureStorage.getBool('ff_appFirstOpen') ?? _appFirstOpen;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  DocumentReference? _currentFeedCategoryRef =
      FirebaseFirestore.instance.doc('/categories/yPzxn82TAhs0AR1d1WkX');
  DocumentReference? get currentFeedCategoryRef => _currentFeedCategoryRef;
  set currentFeedCategoryRef(DocumentReference? value) {
    _currentFeedCategoryRef = value;
  }

  DocumentReference? _followingCategoryReference =
      FirebaseFirestore.instance.doc('/categories/K7S3qITqfcLqFinxdSze');
  DocumentReference? get followingCategoryReference =>
      _followingCategoryReference;
  set followingCategoryReference(DocumentReference? value) {
    _followingCategoryReference = value;
    value != null
        ? secureStorage.setString('ff_followingCategoryReference', value.path)
        : secureStorage.remove('ff_followingCategoryReference');
  }

  void deleteFollowingCategoryReference() {
    secureStorage.delete(key: 'ff_followingCategoryReference');
  }

  List<DocumentReference> _selectedCategories = [];
  List<DocumentReference> get selectedCategories => _selectedCategories;
  set selectedCategories(List<DocumentReference> value) {
    _selectedCategories = value;
  }

  void addToSelectedCategories(DocumentReference value) {
    selectedCategories.add(value);
  }

  void removeFromSelectedCategories(DocumentReference value) {
    selectedCategories.remove(value);
  }

  void removeAtIndexFromSelectedCategories(int index) {
    selectedCategories.removeAt(index);
  }

  void updateSelectedCategoriesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    selectedCategories[index] = updateFn(_selectedCategories[index]);
  }

  void insertAtIndexInSelectedCategories(int index, DocumentReference value) {
    selectedCategories.insert(index, value);
  }

  int _numCategoriesSelected = 0;
  int get numCategoriesSelected => _numCategoriesSelected;
  set numCategoriesSelected(int value) {
    _numCategoriesSelected = value;
  }

  DocumentReference? _premiumQuotesCategoryRef =
      FirebaseFirestore.instance.doc('/categories/C7D1z67MNUD9yDiFA10u');
  DocumentReference? get premiumQuotesCategoryRef => _premiumQuotesCategoryRef;
  set premiumQuotesCategoryRef(DocumentReference? value) {
    _premiumQuotesCategoryRef = value;
    value != null
        ? secureStorage.setString('ff_premiumQuotesCategoryRef', value.path)
        : secureStorage.remove('ff_premiumQuotesCategoryRef');
  }

  void deletePremiumQuotesCategoryRef() {
    secureStorage.delete(key: 'ff_premiumQuotesCategoryRef');
  }

  DocumentReference? _recommendedCategoryRef =
      FirebaseFirestore.instance.doc('/categories/yPzxn82TAhs0AR1d1WkX');
  DocumentReference? get recommendedCategoryRef => _recommendedCategoryRef;
  set recommendedCategoryRef(DocumentReference? value) {
    _recommendedCategoryRef = value;
  }

  int _categorySwitches = 0;
  int get categorySwitches => _categorySwitches;
  set categorySwitches(int value) {
    _categorySwitches = value;
  }

  String _appVersion = 'v1.0.2';
  String get appVersion => _appVersion;
  set appVersion(String value) {
    _appVersion = value;
    secureStorage.setString('ff_appVersion', value);
  }

  void deleteAppVersion() {
    secureStorage.delete(key: 'ff_appVersion');
  }

  String _selectedGoogleImage = '';
  String get selectedGoogleImage => _selectedGoogleImage;
  set selectedGoogleImage(String value) {
    _selectedGoogleImage = value;
  }

  String _currentFeedCategoryPic =
      'https://firebasestorage.googleapis.com/v0/b/toowize-e583e.appspot.com/o/cms_uploads%2Fcategories%2F1692930254518000%2Freward%20(1).png?alt=media&token=4bd9fb9b-df32-4fb3-998b-5d3a37e5a9c0';
  String get currentFeedCategoryPic => _currentFeedCategoryPic;
  set currentFeedCategoryPic(String value) {
    _currentFeedCategoryPic = value;
  }

  DateTime? _QOTDLastView = DateTime.fromMillisecondsSinceEpoch(1704085200000);
  DateTime? get QOTDLastView => _QOTDLastView;
  set QOTDLastView(DateTime? value) {
    _QOTDLastView = value;
    value != null
        ? secureStorage.setInt('ff_QOTDLastView', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_QOTDLastView');
  }

  void deleteQOTDLastView() {
    secureStorage.delete(key: 'ff_QOTDLastView');
  }

  DateTime? _lastCache = DateTime.fromMillisecondsSinceEpoch(1706038920000);
  DateTime? get lastCache => _lastCache;
  set lastCache(DateTime? value) {
    _lastCache = value;
    value != null
        ? secureStorage.setInt('ff_lastCache', value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_lastCache');
  }

  void deleteLastCache() {
    secureStorage.delete(key: 'ff_lastCache');
  }

  bool _QOTDNotifications = false;
  bool get QOTDNotifications => _QOTDNotifications;
  set QOTDNotifications(bool value) {
    _QOTDNotifications = value;
    secureStorage.setBool('ff_QOTDNotifications', value);
  }

  void deleteQOTDNotifications() {
    secureStorage.delete(key: 'ff_QOTDNotifications');
  }

  bool _appFirstOpen = true;
  bool get appFirstOpen => _appFirstOpen;
  set appFirstOpen(bool value) {
    _appFirstOpen = value;
    secureStorage.setBool('ff_appFirstOpen', value);
  }

  void deleteAppFirstOpen() {
    secureStorage.delete(key: 'ff_appFirstOpen');
  }

  String _lastImageSearchText = '';
  String get lastImageSearchText => _lastImageSearchText;
  set lastImageSearchText(String value) {
    _lastImageSearchText = value;
  }

  final _getCategoryDocumentManager = FutureRequestManager<CategoriesRecord>();
  Future<CategoriesRecord> getCategoryDocument({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<CategoriesRecord> Function() requestFn,
  }) =>
      _getCategoryDocumentManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetCategoryDocumentCache() => _getCategoryDocumentManager.clear();
  void clearGetCategoryDocumentCacheKey(String? uniqueKey) =>
      _getCategoryDocumentManager.clearRequest(uniqueKey);

  final _getAllCategoriesManager =
      FutureRequestManager<List<CategoriesRecord>>();
  Future<List<CategoriesRecord>> getAllCategories({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _getAllCategoriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetAllCategoriesCache() => _getAllCategoriesManager.clear();
  void clearGetAllCategoriesCacheKey(String? uniqueKey) =>
      _getAllCategoriesManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
