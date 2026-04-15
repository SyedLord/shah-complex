import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileIconsRecord extends FirestoreRecord {
  ProfileIconsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "category_name" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  void _initializeFields() {
    _categoryName = snapshotData['category_name'] as String?;
    _images = getDataList(snapshotData['images']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profile_icons');

  static Stream<ProfileIconsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileIconsRecord.fromSnapshot(s));

  static Future<ProfileIconsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileIconsRecord.fromSnapshot(s));

  static ProfileIconsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileIconsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileIconsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileIconsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileIconsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileIconsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileIconsRecordData({
  String? categoryName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category_name': categoryName,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileIconsRecordDocumentEquality
    implements Equality<ProfileIconsRecord> {
  const ProfileIconsRecordDocumentEquality();

  @override
  bool equals(ProfileIconsRecord? e1, ProfileIconsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.categoryName == e2?.categoryName &&
        listEquality.equals(e1?.images, e2?.images);
  }

  @override
  int hash(ProfileIconsRecord? e) =>
      const ListEquality().hash([e?.categoryName, e?.images]);

  @override
  bool isValidKey(Object? o) => o is ProfileIconsRecord;
}
