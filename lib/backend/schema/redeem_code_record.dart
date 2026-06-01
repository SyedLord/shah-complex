import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RedeemCodeRecord extends FirestoreRecord {
  RedeemCodeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "usage_limit" field.
  int? _usageLimit;
  int get usageLimit => _usageLimit ?? 0;
  bool hasUsageLimit() => _usageLimit != null;

  // "times_used" field.
  int? _timesUsed;
  int get timesUsed => _timesUsed ?? 0;
  bool hasTimesUsed() => _timesUsed != null;

  void _initializeFields() {
    _code = snapshotData['code'] as String?;
    _isActive = snapshotData['is_active'] as bool?;
    _usageLimit = castToType<int>(snapshotData['usage_limit']);
    _timesUsed = castToType<int>(snapshotData['times_used']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('redeem_code');

  static Stream<RedeemCodeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RedeemCodeRecord.fromSnapshot(s));

  static Future<RedeemCodeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RedeemCodeRecord.fromSnapshot(s));

  static RedeemCodeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RedeemCodeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RedeemCodeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RedeemCodeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RedeemCodeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RedeemCodeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRedeemCodeRecordData({
  String? code,
  bool? isActive,
  int? usageLimit,
  int? timesUsed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'is_active': isActive,
      'usage_limit': usageLimit,
      'times_used': timesUsed,
    }.withoutNulls,
  );

  return firestoreData;
}

class RedeemCodeRecordDocumentEquality implements Equality<RedeemCodeRecord> {
  const RedeemCodeRecordDocumentEquality();

  @override
  bool equals(RedeemCodeRecord? e1, RedeemCodeRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.isActive == e2?.isActive &&
        e1?.usageLimit == e2?.usageLimit &&
        e1?.timesUsed == e2?.timesUsed;
  }

  @override
  int hash(RedeemCodeRecord? e) => const ListEquality()
      .hash([e?.code, e?.isActive, e?.usageLimit, e?.timesUsed]);

  @override
  bool isValidKey(Object? o) => o is RedeemCodeRecord;
}
