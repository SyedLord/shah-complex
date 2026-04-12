import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MoviesRecord extends FirestoreRecord {
  MoviesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "tmdb_id" field.
  int? _tmdbId;
  int get tmdbId => _tmdbId ?? 0;
  bool hasTmdbId() => _tmdbId != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "genres" field.
  List<String>? _genres;
  List<String> get genres => _genres ?? const [];
  bool hasGenres() => _genres != null;

  // "release_year" field.
  int? _releaseYear;
  int get releaseYear => _releaseYear ?? 0;
  bool hasReleaseYear() => _releaseYear != null;

  // "is_trending" field.
  bool? _isTrending;
  bool get isTrending => _isTrending ?? false;
  bool hasIsTrending() => _isTrending != null;

  // "drive_type" field.
  String? _driveType;
  String get driveType => _driveType ?? '';
  bool hasDriveType() => _driveType != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "poster_image" field.
  String? _posterImage;
  String get posterImage => _posterImage ?? '';
  bool hasPosterImage() => _posterImage != null;

  // "backdrop_image" field.
  String? _backdropImage;
  String get backdropImage => _backdropImage ?? '';
  bool hasBackdropImage() => _backdropImage != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _tmdbId = castToType<int>(snapshotData['tmdb_id']);
    _description = snapshotData['description'] as String?;
    _genres = getDataList(snapshotData['genres']);
    _releaseYear = castToType<int>(snapshotData['release_year']);
    _isTrending = snapshotData['is_trending'] as bool?;
    _driveType = snapshotData['drive_type'] as String?;
    _videoUrl = snapshotData['video_url'] as String?;
    _category = snapshotData['category'] as String?;
    _posterImage = snapshotData['poster_image'] as String?;
    _backdropImage = snapshotData['backdrop_image'] as String?;
    _duration = snapshotData['duration'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('movies');

  static Stream<MoviesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MoviesRecord.fromSnapshot(s));

  static Future<MoviesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MoviesRecord.fromSnapshot(s));

  static MoviesRecord fromSnapshot(DocumentSnapshot snapshot) => MoviesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MoviesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MoviesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MoviesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MoviesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMoviesRecordData({
  String? title,
  int? tmdbId,
  String? description,
  int? releaseYear,
  bool? isTrending,
  String? driveType,
  String? videoUrl,
  String? category,
  String? posterImage,
  String? backdropImage,
  String? duration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'tmdb_id': tmdbId,
      'description': description,
      'release_year': releaseYear,
      'is_trending': isTrending,
      'drive_type': driveType,
      'video_url': videoUrl,
      'category': category,
      'poster_image': posterImage,
      'backdrop_image': backdropImage,
      'duration': duration,
    }.withoutNulls,
  );

  return firestoreData;
}

class MoviesRecordDocumentEquality implements Equality<MoviesRecord> {
  const MoviesRecordDocumentEquality();

  @override
  bool equals(MoviesRecord? e1, MoviesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.tmdbId == e2?.tmdbId &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.genres, e2?.genres) &&
        e1?.releaseYear == e2?.releaseYear &&
        e1?.isTrending == e2?.isTrending &&
        e1?.driveType == e2?.driveType &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.category == e2?.category &&
        e1?.posterImage == e2?.posterImage &&
        e1?.backdropImage == e2?.backdropImage &&
        e1?.duration == e2?.duration;
  }

  @override
  int hash(MoviesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.tmdbId,
        e?.description,
        e?.genres,
        e?.releaseYear,
        e?.isTrending,
        e?.driveType,
        e?.videoUrl,
        e?.category,
        e?.posterImage,
        e?.backdropImage,
        e?.duration
      ]);

  @override
  bool isValidKey(Object? o) => o is MoviesRecord;
}
