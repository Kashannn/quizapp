import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizTestRecord extends FirestoreRecord {
  QuizTestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "que" field.
  List<QuizModelStruct>? _que;
  List<QuizModelStruct> get que => _que ?? const [];
  bool hasQue() => _que != null;

  // "media" field.
  String? _media;
  String get media => _media ?? '';
  bool hasMedia() => _media != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  void _initializeFields() {
    _que = getStructList(
      snapshotData['que'],
      QuizModelStruct.fromMap,
    );
    _media = snapshotData['media'] as String?;
    _category = snapshotData['category'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz_test');

  static Stream<QuizTestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizTestRecord.fromSnapshot(s));

  static Future<QuizTestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizTestRecord.fromSnapshot(s));

  static QuizTestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizTestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizTestRecordData({
  String? media,
  String? category,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'media': media,
      'category': category,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizTestRecordDocumentEquality implements Equality<QuizTestRecord> {
  const QuizTestRecordDocumentEquality();

  @override
  bool equals(QuizTestRecord? e1, QuizTestRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.que, e2?.que) &&
        e1?.media == e2?.media &&
        e1?.category == e2?.category;
  }

  @override
  int hash(QuizTestRecord? e) =>
      const ListEquality().hash([e?.que, e?.media, e?.category]);

  @override
  bool isValidKey(Object? o) => o is QuizTestRecord;
}
