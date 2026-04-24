import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _googleAccessToken =
          prefs.getString('ff_googleAccessToken') ?? _googleAccessToken;
    });
    _safeInit(() {
      _googleRefreshToken =
          prefs.getString('ff_googleRefreshToken') ?? _googleRefreshToken;
    });
    _safeInit(() {
      _microsoftAccessToken =
          prefs.getString('ff_microsoftAccessToken') ?? _microsoftAccessToken;
    });
    _safeInit(() {
      _microsoftRefreshToken =
          prefs.getString('ff_microsoftRefreshToken') ?? _microsoftRefreshToken;
    });
    _safeInit(() {
      _isLoggedin = prefs.getBool('ff_isLoggedin') ?? _isLoggedin;
    });
    _safeInit(() {
      _activeProfileRef =
          prefs.getString('ff_activeProfileRef')?.ref ?? _activeProfileRef;
    });
    _safeInit(() {
      _activeProfileImage =
          prefs.getString('ff_activeProfileImage') ?? _activeProfileImage;
    });
    _safeInit(() {
      _localCacheTime = prefs.containsKey('ff_localCacheTime')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_localCacheTime')!)
          : _localCacheTime;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _appCategories = [
    'Hollywood',
    'Bollywood',
    'Anime',
    'Cartoon',
    'Lollywood'
  ];
  List<String> get appCategories => _appCategories;
  set appCategories(List<String> value) {
    _appCategories = value;
  }

  void addToAppCategories(String value) {
    appCategories.add(value);
  }

  void removeFromAppCategories(String value) {
    appCategories.remove(value);
  }

  void removeAtIndexFromAppCategories(int index) {
    appCategories.removeAt(index);
  }

  void updateAppCategoriesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    appCategories[index] = updateFn(_appCategories[index]);
  }

  void insertAtIndexInAppCategories(int index, String value) {
    appCategories.insert(index, value);
  }

  String _googleAccessToken = '';
  String get googleAccessToken => _googleAccessToken;
  set googleAccessToken(String value) {
    _googleAccessToken = value;
    prefs.setString('ff_googleAccessToken', value);
  }

  String _googleRefreshToken = '';
  String get googleRefreshToken => _googleRefreshToken;
  set googleRefreshToken(String value) {
    _googleRefreshToken = value;
    prefs.setString('ff_googleRefreshToken', value);
  }

  String _microsoftAccessToken = '';
  String get microsoftAccessToken => _microsoftAccessToken;
  set microsoftAccessToken(String value) {
    _microsoftAccessToken = value;
    prefs.setString('ff_microsoftAccessToken', value);
  }

  String _microsoftRefreshToken = '';
  String get microsoftRefreshToken => _microsoftRefreshToken;
  set microsoftRefreshToken(String value) {
    _microsoftRefreshToken = value;
    prefs.setString('ff_microsoftRefreshToken', value);
  }

  bool _isLoggedin = false;
  bool get isLoggedin => _isLoggedin;
  set isLoggedin(bool value) {
    _isLoggedin = value;
    prefs.setBool('ff_isLoggedin', value);
  }

  DocumentReference? _activeProfileRef;
  DocumentReference? get activeProfileRef => _activeProfileRef;
  set activeProfileRef(DocumentReference? value) {
    _activeProfileRef = value;
    value != null
        ? prefs.setString('ff_activeProfileRef', value.path)
        : prefs.remove('ff_activeProfileRef');
  }

  String _tempSelectedAvatar = '';
  String get tempSelectedAvatar => _tempSelectedAvatar;
  set tempSelectedAvatar(String value) {
    _tempSelectedAvatar = value;
  }

  DocumentReference? _emptyDocRefSeries;
  DocumentReference? get emptyDocRefSeries => _emptyDocRefSeries;
  set emptyDocRefSeries(DocumentReference? value) {
    _emptyDocRefSeries = value;
  }

  DocumentReference? _emptyDocRefMovies;
  DocumentReference? get emptyDocRefMovies => _emptyDocRefMovies;
  set emptyDocRefMovies(DocumentReference? value) {
    _emptyDocRefMovies = value;
  }

  String _activeProfileImage = '';
  String get activeProfileImage => _activeProfileImage;
  set activeProfileImage(String value) {
    _activeProfileImage = value;
    prefs.setString('ff_activeProfileImage', value);
  }

  dynamic _downloadProgress;
  dynamic get downloadProgress => _downloadProgress;
  set downloadProgress(dynamic value) {
    _downloadProgress = value;
  }

  DateTime? _localCacheTime;
  DateTime? get localCacheTime => _localCacheTime;
  set localCacheTime(DateTime? value) {
    _localCacheTime = value;
    value != null
        ? prefs.setInt('ff_localCacheTime', value.millisecondsSinceEpoch)
        : prefs.remove('ff_localCacheTime');
  }

  final _profileWatchlistCountManager = FutureRequestManager<int>();
  Future<int> profileWatchlistCount({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _profileWatchlistCountManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfileWatchlistCountCache() =>
      _profileWatchlistCountManager.clear();
  void clearProfileWatchlistCountCacheKey(String? uniqueKey) =>
      _profileWatchlistCountManager.clearRequest(uniqueKey);

  final _trendingMoviesCacheManager =
      StreamRequestManager<List<MoviesRecord>>();
  Stream<List<MoviesRecord>> trendingMoviesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<MoviesRecord>> Function() requestFn,
  }) =>
      _trendingMoviesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTrendingMoviesCacheCache() => _trendingMoviesCacheManager.clear();
  void clearTrendingMoviesCacheCacheKey(String? uniqueKey) =>
      _trendingMoviesCacheManager.clearRequest(uniqueKey);

  final _trendingSeriesCacheManager =
      StreamRequestManager<List<SeriesRecord>>();
  Stream<List<SeriesRecord>> trendingSeriesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<SeriesRecord>> Function() requestFn,
  }) =>
      _trendingSeriesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTrendingSeriesCacheCache() => _trendingSeriesCacheManager.clear();
  void clearTrendingSeriesCacheCacheKey(String? uniqueKey) =>
      _trendingSeriesCacheManager.clearRequest(uniqueKey);

  final _moviesCacheManager = StreamRequestManager<List<CategoriesRecord>>();
  Stream<List<CategoriesRecord>> moviesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _moviesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMoviesCacheCache() => _moviesCacheManager.clear();
  void clearMoviesCacheCacheKey(String? uniqueKey) =>
      _moviesCacheManager.clearRequest(uniqueKey);

  final _seasonsCacheManager = StreamRequestManager<List<CategoriesRecord>>();
  Stream<List<CategoriesRecord>> seasonsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _seasonsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSeasonsCacheCache() => _seasonsCacheManager.clear();
  void clearSeasonsCacheCacheKey(String? uniqueKey) =>
      _seasonsCacheManager.clearRequest(uniqueKey);
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
