import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfilesRecord extends FirestoreRecord {
  ProfilesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "profile_name" field.
  String? _profileName;
  String get profileName => _profileName ?? '';
  bool hasProfileName() => _profileName != null;

  // "profile_image" field.
  String? _profileImage;
  String get profileImage => _profileImage ?? '';
  bool hasProfileImage() => _profileImage != null;

  // "is_kids" field.
  bool? _isKids;
  bool get isKids => _isKids ?? false;
  bool hasIsKids() => _isKids != null;

  // "is_main_profile" field.
  bool? _isMainProfile;
  bool get isMainProfile => _isMainProfile ?? false;
  bool hasIsMainProfile() => _isMainProfile != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _profileName = snapshotData['profile_name'] as String?;
    _profileImage = snapshotData['profile_image'] as String?;
    _isKids = snapshotData['is_kids'] as bool?;
    _isMainProfile = snapshotData['is_main_profile'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('profiles')
          : FirebaseFirestore.instance.collectionGroup('profiles');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('profiles').doc(id);

  static Stream<ProfilesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfilesRecord.fromSnapshot(s));

  static Future<ProfilesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfilesRecord.fromSnapshot(s));

  static ProfilesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfilesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfilesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfilesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfilesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfilesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfilesRecordData({
  String? profileName,
  String? profileImage,
  bool? isKids,
  bool? isMainProfile,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'profile_name': profileName,
      'profile_image': profileImage,
      'is_kids': isKids,
      'is_main_profile': isMainProfile,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfilesRecordDocumentEquality implements Equality<ProfilesRecord> {
  const ProfilesRecordDocumentEquality();

  @override
  bool equals(ProfilesRecord? e1, ProfilesRecord? e2) {
    return e1?.profileName == e2?.profileName &&
        e1?.profileImage == e2?.profileImage &&
        e1?.isKids == e2?.isKids &&
        e1?.isMainProfile == e2?.isMainProfile;
  }

  @override
  int hash(ProfilesRecord? e) => const ListEquality()
      .hash([e?.profileName, e?.profileImage, e?.isKids, e?.isMainProfile]);

  @override
  bool isValidKey(Object? o) => o is ProfilesRecord;
}
