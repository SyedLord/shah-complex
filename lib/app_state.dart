import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

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
}
