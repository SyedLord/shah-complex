import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactAdminRecord extends FirestoreRecord {
  ContactAdminRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contact_admin');

  static Stream<ContactAdminRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactAdminRecord.fromSnapshot(s));

  static Future<ContactAdminRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactAdminRecord.fromSnapshot(s));

  static ContactAdminRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactAdminRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactAdminRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactAdminRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactAdminRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactAdminRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactAdminRecordData({
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactAdminRecordDocumentEquality
    implements Equality<ContactAdminRecord> {
  const ContactAdminRecordDocumentEquality();

  @override
  bool equals(ContactAdminRecord? e1, ContactAdminRecord? e2) {
    return e1?.url == e2?.url;
  }

  @override
  int hash(ContactAdminRecord? e) => const ListEquality().hash([e?.url]);

  @override
  bool isValidKey(Object? o) => o is ContactAdminRecord;
}
