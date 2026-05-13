import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppConfigRecord extends FirestoreRecord {
  AppConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "trending_last_updated" field.
  DateTime? _trendingLastUpdated;
  DateTime? get trendingLastUpdated => _trendingLastUpdated;
  bool hasTrendingLastUpdated() => _trendingLastUpdated != null;

  // "home_last_updated" field.
  DateTime? _homeLastUpdated;
  DateTime? get homeLastUpdated => _homeLastUpdated;
  bool hasHomeLastUpdated() => _homeLastUpdated != null;

  // "latest_build_number" field.
  int? _latestBuildNumber;
  int get latestBuildNumber => _latestBuildNumber ?? 0;
  bool hasLatestBuildNumber() => _latestBuildNumber != null;

  // "force_update" field.
  bool? _forceUpdate;
  bool get forceUpdate => _forceUpdate ?? false;
  bool hasForceUpdate() => _forceUpdate != null;

  // "update_url" field.
  String? _updateUrl;
  String get updateUrl => _updateUrl ?? '';
  bool hasUpdateUrl() => _updateUrl != null;

  void _initializeFields() {
    _trendingLastUpdated = snapshotData['trending_last_updated'] as DateTime?;
    _homeLastUpdated = snapshotData['home_last_updated'] as DateTime?;
    _latestBuildNumber = castToType<int>(snapshotData['latest_build_number']);
    _forceUpdate = snapshotData['force_update'] as bool?;
    _updateUrl = snapshotData['update_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app_config');

  static Stream<AppConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppConfigRecord.fromSnapshot(s));

  static Future<AppConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppConfigRecord.fromSnapshot(s));

  static AppConfigRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppConfigRecordData({
  DateTime? trendingLastUpdated,
  DateTime? homeLastUpdated,
  int? latestBuildNumber,
  bool? forceUpdate,
  String? updateUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'trending_last_updated': trendingLastUpdated,
      'home_last_updated': homeLastUpdated,
      'latest_build_number': latestBuildNumber,
      'force_update': forceUpdate,
      'update_url': updateUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppConfigRecordDocumentEquality implements Equality<AppConfigRecord> {
  const AppConfigRecordDocumentEquality();

  @override
  bool equals(AppConfigRecord? e1, AppConfigRecord? e2) {
    return e1?.trendingLastUpdated == e2?.trendingLastUpdated &&
        e1?.homeLastUpdated == e2?.homeLastUpdated &&
        e1?.latestBuildNumber == e2?.latestBuildNumber &&
        e1?.forceUpdate == e2?.forceUpdate &&
        e1?.updateUrl == e2?.updateUrl;
  }

  @override
  int hash(AppConfigRecord? e) => const ListEquality().hash([
        e?.trendingLastUpdated,
        e?.homeLastUpdated,
        e?.latestBuildNumber,
        e?.forceUpdate,
        e?.updateUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is AppConfigRecord;
}
