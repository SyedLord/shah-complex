import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeriesRecord extends FirestoreRecord {
  SeriesRecord._(
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

  // "poster_image" field.
  String? _posterImage;
  String get posterImage => _posterImage ?? '';
  bool hasPosterImage() => _posterImage != null;

  // "backdrop_image" field.
  String? _backdropImage;
  String get backdropImage => _backdropImage ?? '';
  bool hasBackdropImage() => _backdropImage != null;

  // "genres" field.
  List<String>? _genres;
  List<String> get genres => _genres ?? const [];
  bool hasGenres() => _genres != null;

  // "is_trending" field.
  bool? _isTrending;
  bool get isTrending => _isTrending ?? false;
  bool hasIsTrending() => _isTrending != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "total_seasons" field.
  int? _totalSeasons;
  int get totalSeasons => _totalSeasons ?? 0;
  bool hasTotalSeasons() => _totalSeasons != null;

  // "logo_image" field.
  String? _logoImage;
  String get logoImage => _logoImage ?? '';
  bool hasLogoImage() => _logoImage != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _tmdbId = castToType<int>(snapshotData['tmdb_id']);
    _description = snapshotData['description'] as String?;
    _posterImage = snapshotData['poster_image'] as String?;
    _backdropImage = snapshotData['backdrop_image'] as String?;
    _genres = getDataList(snapshotData['genres']);
    _isTrending = snapshotData['is_trending'] as bool?;
    _category = snapshotData['category'] as String?;
    _totalSeasons = castToType<int>(snapshotData['total_seasons']);
    _logoImage = snapshotData['logo_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('series');

  static Stream<SeriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SeriesRecord.fromSnapshot(s));

  static Future<SeriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SeriesRecord.fromSnapshot(s));

  static SeriesRecord fromSnapshot(DocumentSnapshot snapshot) => SeriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SeriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SeriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SeriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SeriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSeriesRecordData({
  String? title,
  int? tmdbId,
  String? description,
  String? posterImage,
  String? backdropImage,
  bool? isTrending,
  String? category,
  int? totalSeasons,
  String? logoImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'tmdb_id': tmdbId,
      'description': description,
      'poster_image': posterImage,
      'backdrop_image': backdropImage,
      'is_trending': isTrending,
      'category': category,
      'total_seasons': totalSeasons,
      'logo_image': logoImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class SeriesRecordDocumentEquality implements Equality<SeriesRecord> {
  const SeriesRecordDocumentEquality();

  @override
  bool equals(SeriesRecord? e1, SeriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.tmdbId == e2?.tmdbId &&
        e1?.description == e2?.description &&
        e1?.posterImage == e2?.posterImage &&
        e1?.backdropImage == e2?.backdropImage &&
        listEquality.equals(e1?.genres, e2?.genres) &&
        e1?.isTrending == e2?.isTrending &&
        e1?.category == e2?.category &&
        e1?.totalSeasons == e2?.totalSeasons &&
        e1?.logoImage == e2?.logoImage;
  }

  @override
  int hash(SeriesRecord? e) => const ListEquality().hash([
        e?.title,
        e?.tmdbId,
        e?.description,
        e?.posterImage,
        e?.backdropImage,
        e?.genres,
        e?.isTrending,
        e?.category,
        e?.totalSeasons,
        e?.logoImage
      ]);

  @override
  bool isValidKey(Object? o) => o is SeriesRecord;
}
