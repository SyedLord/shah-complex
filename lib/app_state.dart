import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _isLoggedin = prefs.getString('ff_isLoggedin') ?? _isLoggedin;
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

  String _isLoggedin = '';
  String get isLoggedin => _isLoggedin;
  set isLoggedin(String value) {
    _isLoggedin = value;
    prefs.setString('ff_isLoggedin', value);
  }
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
