import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuickFireImagesQuizRecord extends FirestoreRecord {
  QuickFireImagesQuizRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "questionText" field.
  String? _questionText;
  String get questionText => _questionText ?? '';
  bool hasQuestionText() => _questionText != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  bool hasOptions() => _options != null;

  // "correctOption" field.
  String? _correctOption;
  String get correctOption => _correctOption ?? '';
  bool hasCorrectOption() => _correctOption != null;

  // "correctOptionDetails" field.
  String? _correctOptionDetails;
  String get correctOptionDetails => _correctOptionDetails ?? '';
  bool hasCorrectOptionDetails() => _correctOptionDetails != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _questionText = snapshotData['questionText'] as String?;
    _options = getDataList(snapshotData['options']);
    _correctOption = snapshotData['correctOption'] as String?;
    _correctOptionDetails = snapshotData['correctOptionDetails'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QuickFireImagesQuiz');

  static Stream<QuickFireImagesQuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuickFireImagesQuizRecord.fromSnapshot(s));

  static Future<QuickFireImagesQuizRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => QuickFireImagesQuizRecord.fromSnapshot(s));

  static QuickFireImagesQuizRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuickFireImagesQuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuickFireImagesQuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuickFireImagesQuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuickFireImagesQuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuickFireImagesQuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuickFireImagesQuizRecordData({
  String? questionText,
  String? correctOption,
  String? correctOptionDetails,
  String? displayName,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'questionText': questionText,
      'correctOption': correctOption,
      'correctOptionDetails': correctOptionDetails,
      'display_name': displayName,
      'photo_url': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuickFireImagesQuizRecordDocumentEquality
    implements Equality<QuickFireImagesQuizRecord> {
  const QuickFireImagesQuizRecordDocumentEquality();

  @override
  bool equals(QuickFireImagesQuizRecord? e1, QuickFireImagesQuizRecord? e2) {
    const listEquality = ListEquality();
    return e1?.questionText == e2?.questionText &&
        listEquality.equals(e1?.options, e2?.options) &&
        e1?.correctOption == e2?.correctOption &&
        e1?.correctOptionDetails == e2?.correctOptionDetails &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(QuickFireImagesQuizRecord? e) => const ListEquality().hash([
        e?.questionText,
        e?.options,
        e?.correctOption,
        e?.correctOptionDetails,
        e?.displayName,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is QuickFireImagesQuizRecord;
}
