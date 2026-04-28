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
    _safeInit(() {
      _carouselItems = prefs
              .getStringList('ff_carouselItems')
              ?.map((x) {
                try {
                  return HeroItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _carouselItems;
    });
    _safeInit(() {
      _searchResultMovies = prefs
              .getStringList('ff_searchResultMovies')
              ?.map((path) => path.ref)
              .toList() ??
          _searchResultMovies;
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

  List<HeroItemStruct> _carouselItems = [];
  List<HeroItemStruct> get carouselItems => _carouselItems;
  set carouselItems(List<HeroItemStruct> value) {
    _carouselItems = value;
    prefs.setStringList(
        'ff_carouselItems', value.map((x) => x.serialize()).toList());
  }

  void addToCarouselItems(HeroItemStruct value) {
    carouselItems.add(value);
    prefs.setStringList(
        'ff_carouselItems', _carouselItems.map((x) => x.serialize()).toList());
  }

  void removeFromCarouselItems(HeroItemStruct value) {
    carouselItems.remove(value);
    prefs.setStringList(
        'ff_carouselItems', _carouselItems.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCarouselItems(int index) {
    carouselItems.removeAt(index);
    prefs.setStringList(
        'ff_carouselItems', _carouselItems.map((x) => x.serialize()).toList());
  }

  void updateCarouselItemsAtIndex(
    int index,
    HeroItemStruct Function(HeroItemStruct) updateFn,
  ) {
    carouselItems[index] = updateFn(_carouselItems[index]);
    prefs.setStringList(
        'ff_carouselItems', _carouselItems.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCarouselItems(int index, HeroItemStruct value) {
    carouselItems.insert(index, value);
    prefs.setStringList(
        'ff_carouselItems', _carouselItems.map((x) => x.serialize()).toList());
  }

  String _tempProfileName = '';
  String get tempProfileName => _tempProfileName;
  set tempProfileName(String value) {
    _tempProfileName = value;
  }

  List<DocumentReference> _searchResultMovies = [];
  List<DocumentReference> get searchResultMovies => _searchResultMovies;
  set searchResultMovies(List<DocumentReference> value) {
    _searchResultMovies = value;
    prefs.setStringList(
        'ff_searchResultMovies', value.map((x) => x.path).toList());
  }

  void addToSearchResultMovies(DocumentReference value) {
    searchResultMovies.add(value);
    prefs.setStringList('ff_searchResultMovies',
        _searchResultMovies.map((x) => x.path).toList());
  }

  void removeFromSearchResultMovies(DocumentReference value) {
    searchResultMovies.remove(value);
    prefs.setStringList('ff_searchResultMovies',
        _searchResultMovies.map((x) => x.path).toList());
  }

  void removeAtIndexFromSearchResultMovies(int index) {
    searchResultMovies.removeAt(index);
    prefs.setStringList('ff_searchResultMovies',
        _searchResultMovies.map((x) => x.path).toList());
  }

  void updateSearchResultMoviesAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    searchResultMovies[index] = updateFn(_searchResultMovies[index]);
    prefs.setStringList('ff_searchResultMovies',
        _searchResultMovies.map((x) => x.path).toList());
  }

  void insertAtIndexInSearchResultMovies(int index, DocumentReference value) {
    searchResultMovies.insert(index, value);
    prefs.setStringList('ff_searchResultMovies',
        _searchResultMovies.map((x) => x.path).toList());
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
      FutureRequestManager<List<MoviesRecord>>();
  Future<List<MoviesRecord>> trendingMoviesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<MoviesRecord>> Function() requestFn,
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
      FutureRequestManager<List<SeriesRecord>>();
  Future<List<SeriesRecord>> trendingSeriesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SeriesRecord>> Function() requestFn,
  }) =>
      _trendingSeriesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTrendingSeriesCacheCache() => _trendingSeriesCacheManager.clear();
  void clearTrendingSeriesCacheCacheKey(String? uniqueKey) =>
      _trendingSeriesCacheManager.clearRequest(uniqueKey);

  final _moviesCacheManager = FutureRequestManager<List<CategoriesRecord>>();
  Future<List<CategoriesRecord>> moviesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _moviesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMoviesCacheCache() => _moviesCacheManager.clear();
  void clearMoviesCacheCacheKey(String? uniqueKey) =>
      _moviesCacheManager.clearRequest(uniqueKey);

  final _seasonsCacheManager = FutureRequestManager<List<CategoriesRecord>>();
  Future<List<CategoriesRecord>> seasonsCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _seasonsCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSeasonsCacheCache() => _seasonsCacheManager.clear();
  void clearSeasonsCacheCacheKey(String? uniqueKey) =>
      _seasonsCacheManager.clearRequest(uniqueKey);

  final _moviesCacheListManager = FutureRequestManager<List<MoviesRecord>>();
  Future<List<MoviesRecord>> moviesCacheList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<MoviesRecord>> Function() requestFn,
  }) =>
      _moviesCacheListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMoviesCacheListCache() => _moviesCacheListManager.clear();
  void clearMoviesCacheListCacheKey(String? uniqueKey) =>
      _moviesCacheListManager.clearRequest(uniqueKey);

  final _seasonsCacheListManager = FutureRequestManager<List<SeriesRecord>>();
  Future<List<SeriesRecord>> seasonsCacheList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SeriesRecord>> Function() requestFn,
  }) =>
      _seasonsCacheListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSeasonsCacheListCache() => _seasonsCacheListManager.clear();
  void clearSeasonsCacheListCacheKey(String? uniqueKey) =>
      _seasonsCacheListManager.clearRequest(uniqueKey);

  final _myListAllItemsManager = FutureRequestManager<List<MyListRecord>>();
  Future<List<MyListRecord>> myListAllItems({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<MyListRecord>> Function() requestFn,
  }) =>
      _myListAllItemsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyListAllItemsCache() => _myListAllItemsManager.clear();
  void clearMyListAllItemsCacheKey(String? uniqueKey) =>
      _myListAllItemsManager.clearRequest(uniqueKey);

  final _myListMovieCardManager = FutureRequestManager<MoviesRecord>();
  Future<MoviesRecord> myListMovieCard({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<MoviesRecord> Function() requestFn,
  }) =>
      _myListMovieCardManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyListMovieCardCache() => _myListMovieCardManager.clear();
  void clearMyListMovieCardCacheKey(String? uniqueKey) =>
      _myListMovieCardManager.clearRequest(uniqueKey);

  final _myListSeasonCardManager = FutureRequestManager<SeriesRecord>();
  Future<SeriesRecord> myListSeasonCard({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<SeriesRecord> Function() requestFn,
  }) =>
      _myListSeasonCardManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyListSeasonCardCache() => _myListSeasonCardManager.clear();
  void clearMyListSeasonCardCacheKey(String? uniqueKey) =>
      _myListSeasonCardManager.clearRequest(uniqueKey);

  final _profileCacheManager = FutureRequestManager<ProfilesRecord>();
  Future<ProfilesRecord> profileCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ProfilesRecord> Function() requestFn,
  }) =>
      _profileCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProfileCacheCache() => _profileCacheManager.clear();
  void clearProfileCacheCacheKey(String? uniqueKey) =>
      _profileCacheManager.clearRequest(uniqueKey);

  final _newsCountAllManager = FutureRequestManager<int>();
  Future<int> newsCountAll({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<int> Function() requestFn,
  }) =>
      _newsCountAllManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNewsCountAllCache() => _newsCountAllManager.clear();
  void clearNewsCountAllCacheKey(String? uniqueKey) =>
      _newsCountAllManager.clearRequest(uniqueKey);

  final _newsTrendingCardsManager =
      FutureRequestManager<List<NewsFeedRecord>>();
  Future<List<NewsFeedRecord>> newsTrendingCards({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<NewsFeedRecord>> Function() requestFn,
  }) =>
      _newsTrendingCardsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNewsTrendingCardsCache() => _newsTrendingCardsManager.clear();
  void clearNewsTrendingCardsCacheKey(String? uniqueKey) =>
      _newsTrendingCardsManager.clearRequest(uniqueKey);

  final _newsCardsAllManager = FutureRequestManager<List<NewsFeedRecord>>();
  Future<List<NewsFeedRecord>> newsCardsAll({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<NewsFeedRecord>> Function() requestFn,
  }) =>
      _newsCardsAllManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNewsCardsAllCache() => _newsCardsAllManager.clear();
  void clearNewsCardsAllCacheKey(String? uniqueKey) =>
      _newsCardsAllManager.clearRequest(uniqueKey);

  final _moreLikeThisMoviesManager = FutureRequestManager<List<MoviesRecord>>();
  Future<List<MoviesRecord>> moreLikeThisMovies({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<MoviesRecord>> Function() requestFn,
  }) =>
      _moreLikeThisMoviesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMoreLikeThisMoviesCache() => _moreLikeThisMoviesManager.clear();
  void clearMoreLikeThisMoviesCacheKey(String? uniqueKey) =>
      _moreLikeThisMoviesManager.clearRequest(uniqueKey);

  final _moreLikeThisSeriesManager = FutureRequestManager<List<SeriesRecord>>();
  Future<List<SeriesRecord>> moreLikeThisSeries({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SeriesRecord>> Function() requestFn,
  }) =>
      _moreLikeThisSeriesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMoreLikeThisSeriesCache() => _moreLikeThisSeriesManager.clear();
  void clearMoreLikeThisSeriesCacheKey(String? uniqueKey) =>
      _moreLikeThisSeriesManager.clearRequest(uniqueKey);

  final _moviesCacheListAllManager = FutureRequestManager<List<MoviesRecord>>();
  Future<List<MoviesRecord>> moviesCacheListAll({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<MoviesRecord>> Function() requestFn,
  }) =>
      _moviesCacheListAllManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMoviesCacheListAllCache() => _moviesCacheListAllManager.clear();
  void clearMoviesCacheListAllCacheKey(String? uniqueKey) =>
      _moviesCacheListAllManager.clearRequest(uniqueKey);

  final _seriesCacheListAllManager = FutureRequestManager<List<SeriesRecord>>();
  Future<List<SeriesRecord>> seriesCacheListAll({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<SeriesRecord>> Function() requestFn,
  }) =>
      _seriesCacheListAllManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSeriesCacheListAllCache() => _seriesCacheListAllManager.clear();
  void clearSeriesCacheListAllCacheKey(String? uniqueKey) =>
      _seriesCacheListAllManager.clearRequest(uniqueKey);
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
