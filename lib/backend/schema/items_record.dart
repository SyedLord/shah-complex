import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsRecord extends FirestoreRecord {
  ItemsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tmdb_id" field.
  String? _tmdbId;
  String get tmdbId => _tmdbId ?? '';
  bool hasTmdbId() => _tmdbId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "content_type" field.
  String? _contentType;
  String get contentType => _contentType ?? '';
  bool hasContentType() => _contentType != null;

  // "video_url" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "watched_seconds" field.
  int? _watchedSeconds;
  int get watchedSeconds => _watchedSeconds ?? 0;
  bool hasWatchedSeconds() => _watchedSeconds != null;

  // "total_seconds" field.
  int? _totalSeconds;
  int get totalSeconds => _totalSeconds ?? 0;
  bool hasTotalSeconds() => _totalSeconds != null;

  // "progress_percent" field.
  double? _progressPercent;
  double get progressPercent => _progressPercent ?? 0.0;
  bool hasProgressPercent() => _progressPercent != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "series_id" field.
  String? _seriesId;
  String get seriesId => _seriesId ?? '';
  bool hasSeriesId() => _seriesId != null;

  // "image_url" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "season" field.
  int? _season;
  int get season => _season ?? 0;
  bool hasSeason() => _season != null;

  // "episode" field.
  int? _episode;
  int get episode => _episode ?? 0;
  bool hasEpisode() => _episode != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _tmdbId = snapshotData['tmdb_id'] as String?;
    _title = snapshotData['title'] as String?;
    _contentType = snapshotData['content_type'] as String?;
    _videoUrl = snapshotData['video_url'] as String?;
    _watchedSeconds = castToType<int>(snapshotData['watched_seconds']);
    _totalSeconds = castToType<int>(snapshotData['total_seconds']);
    _progressPercent = castToType<double>(snapshotData['progress_percent']);
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _seriesId = snapshotData['series_id'] as String?;
    _imageUrl = snapshotData['image_url'] as String?;
    _season = castToType<int>(snapshotData['season']);
    _episode = castToType<int>(snapshotData['episode']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('items')
          : FirebaseFirestore.instance.collectionGroup('items');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('items').doc(id);

  static Stream<ItemsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ItemsRecord.fromSnapshot(s));

  static Future<ItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ItemsRecord.fromSnapshot(s));

  static ItemsRecord fromSnapshot(DocumentSnapshot snapshot) => ItemsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ItemsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ItemsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ItemsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ItemsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createItemsRecordData({
  String? tmdbId,
  String? title,
  String? contentType,
  String? videoUrl,
  int? watchedSeconds,
  int? totalSeconds,
  double? progressPercent,
  DateTime? updatedAt,
  String? seriesId,
  String? imageUrl,
  int? season,
  int? episode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tmdb_id': tmdbId,
      'title': title,
      'content_type': contentType,
      'video_url': videoUrl,
      'watched_seconds': watchedSeconds,
      'total_seconds': totalSeconds,
      'progress_percent': progressPercent,
      'updated_at': updatedAt,
      'series_id': seriesId,
      'image_url': imageUrl,
      'season': season,
      'episode': episode,
    }.withoutNulls,
  );

  return firestoreData;
}

class ItemsRecordDocumentEquality implements Equality<ItemsRecord> {
  const ItemsRecordDocumentEquality();

  @override
  bool equals(ItemsRecord? e1, ItemsRecord? e2) {
    return e1?.tmdbId == e2?.tmdbId &&
        e1?.title == e2?.title &&
        e1?.contentType == e2?.contentType &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.watchedSeconds == e2?.watchedSeconds &&
        e1?.totalSeconds == e2?.totalSeconds &&
        e1?.progressPercent == e2?.progressPercent &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.seriesId == e2?.seriesId &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.season == e2?.season &&
        e1?.episode == e2?.episode;
  }

  @override
  int hash(ItemsRecord? e) => const ListEquality().hash([
        e?.tmdbId,
        e?.title,
        e?.contentType,
        e?.videoUrl,
        e?.watchedSeconds,
        e?.totalSeconds,
        e?.progressPercent,
        e?.updatedAt,
        e?.seriesId,
        e?.imageUrl,
        e?.season,
        e?.episode
      ]);

  @override
  bool isValidKey(Object? o) => o is ItemsRecord;
}
