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

  void _initializeFields() {
    _trendingLastUpdated = snapshotData['trending_last_updated'] as DateTime?;
    _homeLastUpdated = snapshotData['home_last_updated'] as DateTime?;
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
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'trending_last_updated': trendingLastUpdated,
      'home_last_updated': homeLastUpdated,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppConfigRecordDocumentEquality implements Equality<AppConfigRecord> {
  const AppConfigRecordDocumentEquality();

  @override
  bool equals(AppConfigRecord? e1, AppConfigRecord? e2) {
    return e1?.trendingLastUpdated == e2?.trendingLastUpdated &&
        e1?.homeLastUpdated == e2?.homeLastUpdated;
  }

  @override
  int hash(AppConfigRecord? e) =>
      const ListEquality().hash([e?.trendingLastUpdated, e?.homeLastUpdated]);

  @override
  bool isValidKey(Object? o) => o is AppConfigRecord;
}
