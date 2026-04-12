// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HeroItemStruct extends FFFirebaseStruct {
  HeroItemStruct({
    String? title,
    String? image,
    List<String>? genres,
    String? contentType,
    String? videoLink,
    DocumentReference? seriesRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _image = image,
        _genres = genres,
        _contentType = contentType,
        _videoLink = videoLink,
        _seriesRef = seriesRef,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "genres" field.
  List<String>? _genres;
  List<String> get genres => _genres ?? const [];
  set genres(List<String>? val) => _genres = val;

  void updateGenres(Function(List<String>) updateFn) {
    updateFn(_genres ??= []);
  }

  bool hasGenres() => _genres != null;

  // "contentType" field.
  String? _contentType;
  String get contentType => _contentType ?? '';
  set contentType(String? val) => _contentType = val;

  bool hasContentType() => _contentType != null;

  // "videoLink" field.
  String? _videoLink;
  String get videoLink => _videoLink ?? '';
  set videoLink(String? val) => _videoLink = val;

  bool hasVideoLink() => _videoLink != null;

  // "seriesRef" field.
  DocumentReference? _seriesRef;
  DocumentReference? get seriesRef => _seriesRef;
  set seriesRef(DocumentReference? val) => _seriesRef = val;

  bool hasSeriesRef() => _seriesRef != null;

  static HeroItemStruct fromMap(Map<String, dynamic> data) => HeroItemStruct(
        title: data['title'] as String?,
        image: data['image'] as String?,
        genres: getDataList(data['genres']),
        contentType: data['contentType'] as String?,
        videoLink: data['videoLink'] as String?,
        seriesRef: data['seriesRef'] as DocumentReference?,
      );

  static HeroItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? HeroItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'image': _image,
        'genres': _genres,
        'contentType': _contentType,
        'videoLink': _videoLink,
        'seriesRef': _seriesRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'genres': serializeParam(
          _genres,
          ParamType.String,
          isList: true,
        ),
        'contentType': serializeParam(
          _contentType,
          ParamType.String,
        ),
        'videoLink': serializeParam(
          _videoLink,
          ParamType.String,
        ),
        'seriesRef': serializeParam(
          _seriesRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static HeroItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      HeroItemStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        genres: deserializeParam<String>(
          data['genres'],
          ParamType.String,
          true,
        ),
        contentType: deserializeParam(
          data['contentType'],
          ParamType.String,
          false,
        ),
        videoLink: deserializeParam(
          data['videoLink'],
          ParamType.String,
          false,
        ),
        seriesRef: deserializeParam(
          data['seriesRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['series'],
        ),
      );

  @override
  String toString() => 'HeroItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is HeroItemStruct &&
        title == other.title &&
        image == other.image &&
        listEquality.equals(genres, other.genres) &&
        contentType == other.contentType &&
        videoLink == other.videoLink &&
        seriesRef == other.seriesRef;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, image, genres, contentType, videoLink, seriesRef]);
}

HeroItemStruct createHeroItemStruct({
  String? title,
  String? image,
  String? contentType,
  String? videoLink,
  DocumentReference? seriesRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    HeroItemStruct(
      title: title,
      image: image,
      contentType: contentType,
      videoLink: videoLink,
      seriesRef: seriesRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

HeroItemStruct? updateHeroItemStruct(
  HeroItemStruct? heroItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    heroItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addHeroItemStructData(
  Map<String, dynamic> firestoreData,
  HeroItemStruct? heroItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (heroItem == null) {
    return;
  }
  if (heroItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && heroItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final heroItemData = getHeroItemFirestoreData(heroItem, forFieldValue);
  final nestedData = heroItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = heroItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getHeroItemFirestoreData(
  HeroItemStruct? heroItem, [
  bool forFieldValue = false,
]) {
  if (heroItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(heroItem.toMap());

  // Add any Firestore field values
  mapToFirestore(heroItem.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getHeroItemListFirestoreData(
  List<HeroItemStruct>? heroItems,
) =>
    heroItems?.map((e) => getHeroItemFirestoreData(e, true)).toList() ?? [];
