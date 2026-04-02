import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserProgressRecord extends FirestoreRecord {
  UserProgressRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_ref" field.
  String? _userRef;
  String get userRef => _userRef ?? '';
  bool hasUserRef() => _userRef != null;

  // "movie_ref" field.
  DocumentReference? _movieRef;
  DocumentReference? get movieRef => _movieRef;
  bool hasMovieRef() => _movieRef != null;

  // "series_ref" field.
  DocumentReference? _seriesRef;
  DocumentReference? get seriesRef => _seriesRef;
  bool hasSeriesRef() => _seriesRef != null;

  // "last_position" field.
  double? _lastPosition;
  double get lastPosition => _lastPosition ?? 0.0;
  bool hasLastPosition() => _lastPosition != null;

  // "total_duration" field.
  double? _totalDuration;
  double get totalDuration => _totalDuration ?? 0.0;
  bool hasTotalDuration() => _totalDuration != null;

  void _initializeFields() {
    _userRef = snapshotData['user_ref'] as String?;
    _movieRef = snapshotData['movie_ref'] as DocumentReference?;
    _seriesRef = snapshotData['series_ref'] as DocumentReference?;
    _lastPosition = castToType<double>(snapshotData['last_position']);
    _totalDuration = castToType<double>(snapshotData['total_duration']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_progress');

  static Stream<UserProgressRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserProgressRecord.fromSnapshot(s));

  static Future<UserProgressRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserProgressRecord.fromSnapshot(s));

  static UserProgressRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserProgressRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserProgressRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserProgressRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserProgressRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserProgressRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserProgressRecordData({
  String? userRef,
  DocumentReference? movieRef,
  DocumentReference? seriesRef,
  double? lastPosition,
  double? totalDuration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'movie_ref': movieRef,
      'series_ref': seriesRef,
      'last_position': lastPosition,
      'total_duration': totalDuration,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserProgressRecordDocumentEquality
    implements Equality<UserProgressRecord> {
  const UserProgressRecordDocumentEquality();

  @override
  bool equals(UserProgressRecord? e1, UserProgressRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.movieRef == e2?.movieRef &&
        e1?.seriesRef == e2?.seriesRef &&
        e1?.lastPosition == e2?.lastPosition &&
        e1?.totalDuration == e2?.totalDuration;
  }

  @override
  int hash(UserProgressRecord? e) => const ListEquality().hash([
        e?.userRef,
        e?.movieRef,
        e?.seriesRef,
        e?.lastPosition,
        e?.totalDuration
      ]);

  @override
  bool isValidKey(Object? o) => o is UserProgressRecord;
}
