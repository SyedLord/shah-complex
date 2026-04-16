import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContinueWatchingRecord extends FirestoreRecord {
  ContinueWatchingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lol" field.
  String? _lol;
  String get lol => _lol ?? '';
  bool hasLol() => _lol != null;

  void _initializeFields() {
    _lol = snapshotData['lol'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('continue_watching');

  static Stream<ContinueWatchingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContinueWatchingRecord.fromSnapshot(s));

  static Future<ContinueWatchingRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ContinueWatchingRecord.fromSnapshot(s));

  static ContinueWatchingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContinueWatchingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContinueWatchingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContinueWatchingRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContinueWatchingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContinueWatchingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContinueWatchingRecordData({
  String? lol,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lol': lol,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContinueWatchingRecordDocumentEquality
    implements Equality<ContinueWatchingRecord> {
  const ContinueWatchingRecordDocumentEquality();

  @override
  bool equals(ContinueWatchingRecord? e1, ContinueWatchingRecord? e2) {
    return e1?.lol == e2?.lol;
  }

  @override
  int hash(ContinueWatchingRecord? e) => const ListEquality().hash([e?.lol]);

  @override
  bool isValidKey(Object? o) => o is ContinueWatchingRecord;
}
