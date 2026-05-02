import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MovieCollectionsRecord extends FirestoreRecord {
  MovieCollectionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tmdb_id" field.
  int? _tmdbId;
  int get tmdbId => _tmdbId ?? 0;
  bool hasTmdbId() => _tmdbId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "overview" field.
  String? _overview;
  String get overview => _overview ?? '';
  bool hasOverview() => _overview != null;

  // "backdrop_image" field.
  String? _backdropImage;
  String get backdropImage => _backdropImage ?? '';
  bool hasBackdropImage() => _backdropImage != null;

  // "poster_image" field.
  String? _posterImage;
  String get posterImage => _posterImage ?? '';
  bool hasPosterImage() => _posterImage != null;

  void _initializeFields() {
    _tmdbId = castToType<int>(snapshotData['tmdb_id']);
    _name = snapshotData['name'] as String?;
    _overview = snapshotData['overview'] as String?;
    _backdropImage = snapshotData['backdrop_image'] as String?;
    _posterImage = snapshotData['poster_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('movie_collections');

  static Stream<MovieCollectionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MovieCollectionsRecord.fromSnapshot(s));

  static Future<MovieCollectionsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => MovieCollectionsRecord.fromSnapshot(s));

  static MovieCollectionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MovieCollectionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MovieCollectionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MovieCollectionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MovieCollectionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MovieCollectionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMovieCollectionsRecordData({
  int? tmdbId,
  String? name,
  String? overview,
  String? backdropImage,
  String? posterImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tmdb_id': tmdbId,
      'name': name,
      'overview': overview,
      'backdrop_image': backdropImage,
      'poster_image': posterImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class MovieCollectionsRecordDocumentEquality
    implements Equality<MovieCollectionsRecord> {
  const MovieCollectionsRecordDocumentEquality();

  @override
  bool equals(MovieCollectionsRecord? e1, MovieCollectionsRecord? e2) {
    return e1?.tmdbId == e2?.tmdbId &&
        e1?.name == e2?.name &&
        e1?.overview == e2?.overview &&
        e1?.backdropImage == e2?.backdropImage &&
        e1?.posterImage == e2?.posterImage;
  }

  @override
  int hash(MovieCollectionsRecord? e) => const ListEquality().hash(
      [e?.tmdbId, e?.name, e?.overview, e?.backdropImage, e?.posterImage]);

  @override
  bool isValidKey(Object? o) => o is MovieCollectionsRecord;
}
