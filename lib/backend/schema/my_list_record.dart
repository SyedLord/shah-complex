import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MyListRecord extends FirestoreRecord {
  MyListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "profile_ref" field.
  DocumentReference? _profileRef;
  DocumentReference? get profileRef => _profileRef;
  bool hasProfileRef() => _profileRef != null;

  // "movie_ref" field.
  DocumentReference? _movieRef;
  DocumentReference? get movieRef => _movieRef;
  bool hasMovieRef() => _movieRef != null;

  // "season_ref" field.
  DocumentReference? _seasonRef;
  DocumentReference? get seasonRef => _seasonRef;
  bool hasSeasonRef() => _seasonRef != null;

  // "added_at" field.
  DateTime? _addedAt;
  DateTime? get addedAt => _addedAt;
  bool hasAddedAt() => _addedAt != null;

  void _initializeFields() {
    _profileRef = snapshotData['profile_ref'] as DocumentReference?;
    _movieRef = snapshotData['movie_ref'] as DocumentReference?;
    _seasonRef = snapshotData['season_ref'] as DocumentReference?;
    _addedAt = snapshotData['added_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('my_list');

  static Stream<MyListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MyListRecord.fromSnapshot(s));

  static Future<MyListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MyListRecord.fromSnapshot(s));

  static MyListRecord fromSnapshot(DocumentSnapshot snapshot) => MyListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MyListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MyListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MyListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MyListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMyListRecordData({
  DocumentReference? profileRef,
  DocumentReference? movieRef,
  DocumentReference? seasonRef,
  DateTime? addedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'profile_ref': profileRef,
      'movie_ref': movieRef,
      'season_ref': seasonRef,
      'added_at': addedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class MyListRecordDocumentEquality implements Equality<MyListRecord> {
  const MyListRecordDocumentEquality();

  @override
  bool equals(MyListRecord? e1, MyListRecord? e2) {
    return e1?.profileRef == e2?.profileRef &&
        e1?.movieRef == e2?.movieRef &&
        e1?.seasonRef == e2?.seasonRef &&
        e1?.addedAt == e2?.addedAt;
  }

  @override
  int hash(MyListRecord? e) => const ListEquality()
      .hash([e?.profileRef, e?.movieRef, e?.seasonRef, e?.addedAt]);

  @override
  bool isValidKey(Object? o) => o is MyListRecord;
}
