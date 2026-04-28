import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsFeedRecord extends FirestoreRecord {
  NewsFeedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "logo_image" field.
  String? _logoImage;
  String get logoImage => _logoImage ?? '';
  bool hasLogoImage() => _logoImage != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "genres" field.
  String? _genres;
  String get genres => _genres ?? '';
  bool hasGenres() => _genres != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "movie_ref" field.
  DocumentReference? _movieRef;
  DocumentReference? get movieRef => _movieRef;
  bool hasMovieRef() => _movieRef != null;

  // "series_ref" field.
  DocumentReference? _seriesRef;
  DocumentReference? get seriesRef => _seriesRef;
  bool hasSeriesRef() => _seriesRef != null;

  // "episode_ref" field.
  DocumentReference? _episodeRef;
  DocumentReference? get episodeRef => _episodeRef;
  bool hasEpisodeRef() => _episodeRef != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _logoImage = snapshotData['logo_image'] as String?;
    _tag = snapshotData['tag'] as String?;
    _genres = snapshotData['genres'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _movieRef = snapshotData['movie_ref'] as DocumentReference?;
    _seriesRef = snapshotData['series_ref'] as DocumentReference?;
    _episodeRef = snapshotData['episode_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('news_feed');

  static Stream<NewsFeedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NewsFeedRecord.fromSnapshot(s));

  static Future<NewsFeedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NewsFeedRecord.fromSnapshot(s));

  static NewsFeedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NewsFeedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NewsFeedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NewsFeedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NewsFeedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NewsFeedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNewsFeedRecordData({
  String? title,
  String? description,
  String? imageUrl,
  String? logoImage,
  String? tag,
  String? genres,
  DateTime? createdAt,
  DocumentReference? movieRef,
  DocumentReference? seriesRef,
  DocumentReference? episodeRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'logo_image': logoImage,
      'tag': tag,
      'genres': genres,
      'created_at': createdAt,
      'movie_ref': movieRef,
      'series_ref': seriesRef,
      'episode_ref': episodeRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class NewsFeedRecordDocumentEquality implements Equality<NewsFeedRecord> {
  const NewsFeedRecordDocumentEquality();

  @override
  bool equals(NewsFeedRecord? e1, NewsFeedRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.logoImage == e2?.logoImage &&
        e1?.tag == e2?.tag &&
        e1?.genres == e2?.genres &&
        e1?.createdAt == e2?.createdAt &&
        e1?.movieRef == e2?.movieRef &&
        e1?.seriesRef == e2?.seriesRef &&
        e1?.episodeRef == e2?.episodeRef;
  }

  @override
  int hash(NewsFeedRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.imageUrl,
        e?.logoImage,
        e?.tag,
        e?.genres,
        e?.createdAt,
        e?.movieRef,
        e?.seriesRef,
        e?.episodeRef
      ]);

  @override
  bool isValidKey(Object? o) => o is NewsFeedRecord;
}
