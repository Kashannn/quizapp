import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizSetRecord extends FirestoreRecord {
  QuizSetRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "quiz_name" field.
  String? _quizName;
  String get quizName => _quizName ?? '';
  bool hasQuizName() => _quizName != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "total_question" field.
  int? _totalQuestion;
  int get totalQuestion => _totalQuestion ?? 0;
  bool hasTotalQuestion() => _totalQuestion != null;

  // "discription" field.
  String? _discription;
  String get discription => _discription ?? '';
  bool hasDiscription() => _discription != null;

  // "cover_photo" field.
  String? _coverPhoto;
  String get coverPhoto => _coverPhoto ?? '';
  bool hasCoverPhoto() => _coverPhoto != null;

  void _initializeFields() {
    _quizName = snapshotData['quiz_name'] as String?;
    _duration = castToType<int>(snapshotData['duration']);
    _totalQuestion = castToType<int>(snapshotData['total_question']);
    _discription = snapshotData['discription'] as String?;
    _coverPhoto = snapshotData['cover_photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('QuizSet');

  static Stream<QuizSetRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizSetRecord.fromSnapshot(s));

  static Future<QuizSetRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizSetRecord.fromSnapshot(s));

  static QuizSetRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizSetRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizSetRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizSetRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizSetRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizSetRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizSetRecordData({
  String? quizName,
  int? duration,
  int? totalQuestion,
  String? discription,
  String? coverPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quiz_name': quizName,
      'duration': duration,
      'total_question': totalQuestion,
      'discription': discription,
      'cover_photo': coverPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizSetRecordDocumentEquality implements Equality<QuizSetRecord> {
  const QuizSetRecordDocumentEquality();

  @override
  bool equals(QuizSetRecord? e1, QuizSetRecord? e2) {
    return e1?.quizName == e2?.quizName &&
        e1?.duration == e2?.duration &&
        e1?.totalQuestion == e2?.totalQuestion &&
        e1?.discription == e2?.discription &&
        e1?.coverPhoto == e2?.coverPhoto;
  }

  @override
  int hash(QuizSetRecord? e) => const ListEquality().hash([
        e?.quizName,
        e?.duration,
        e?.totalQuestion,
        e?.discription,
        e?.coverPhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is QuizSetRecord;
}
