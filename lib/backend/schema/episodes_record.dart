import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EpisodesRecord extends FirestoreRecord {
  EpisodesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "season_number" field.
  int? _seasonNumber;
  int get seasonNumber => _seasonNumber ?? 0;
  bool hasSeasonNumber() => _seasonNumber != null;

  // "episode_number" field.
  int? _episodeNumber;
  int get episodeNumber => _episodeNumber ?? 0;
  bool hasEpisodeNumber() => _episodeNumber != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "drive_type" field.
  String? _driveType;
  String get driveType => _driveType ?? '';
  bool hasDriveType() => _driveType != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _seasonNumber = castToType<int>(snapshotData['season_number']);
    _episodeNumber = castToType<int>(snapshotData['episode_number']);
    _title = snapshotData['title'] as String?;
    _driveType = snapshotData['drive_type'] as String?;
    _videoUrl = snapshotData['video_url'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('episodes')
          : FirebaseFirestore.instance.collectionGroup('episodes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('episodes').doc(id);

  static Stream<EpisodesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EpisodesRecord.fromSnapshot(s));

  static Future<EpisodesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EpisodesRecord.fromSnapshot(s));

  static EpisodesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EpisodesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EpisodesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EpisodesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EpisodesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EpisodesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEpisodesRecordData({
  int? seasonNumber,
  int? episodeNumber,
  String? title,
  String? driveType,
  String? videoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'season_number': seasonNumber,
      'episode_number': episodeNumber,
      'title': title,
      'drive_type': driveType,
      'video_url': videoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class EpisodesRecordDocumentEquality implements Equality<EpisodesRecord> {
  const EpisodesRecordDocumentEquality();

  @override
  bool equals(EpisodesRecord? e1, EpisodesRecord? e2) {
    return e1?.seasonNumber == e2?.seasonNumber &&
        e1?.episodeNumber == e2?.episodeNumber &&
        e1?.title == e2?.title &&
        e1?.driveType == e2?.driveType &&
        e1?.videoUrl == e2?.videoUrl;
  }

  @override
  int hash(EpisodesRecord? e) => const ListEquality().hash(
      [e?.seasonNumber, e?.episodeNumber, e?.title, e?.driveType, e?.videoUrl]);

  @override
  bool isValidKey(Object? o) => o is EpisodesRecord;
}
