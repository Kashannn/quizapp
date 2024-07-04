import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizModelStruct extends FFFirebaseStruct {
  QuizModelStruct({
    String? que,
    String? details,
    String? correctOption,
    String? img,
    List<String>? options,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _que = que,
        _details = details,
        _correctOption = correctOption,
        _img = img,
        _options = options,
        super(firestoreUtilData);

  // "que" field.
  String? _que;
  String get que => _que ?? '';
  set que(String? val) => _que = val;

  bool hasQue() => _que != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  set details(String? val) => _details = val;

  bool hasDetails() => _details != null;

  // "correctOption" field.
  String? _correctOption;
  String get correctOption => _correctOption ?? '';
  set correctOption(String? val) => _correctOption = val;

  bool hasCorrectOption() => _correctOption != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;

  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }

  bool hasOptions() => _options != null;

  static QuizModelStruct fromMap(Map<String, dynamic> data) => QuizModelStruct(
        que: data['que'] as String?,
        details: data['details'] as String?,
        correctOption: data['correctOption'] as String?,
        img: data['img'] as String?,
        options: getDataList(data['options']),
      );

  static QuizModelStruct? maybeFromMap(dynamic data) => data is Map
      ? QuizModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'que': _que,
        'details': _details,
        'correctOption': _correctOption,
        'img': _img,
        'options': _options,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'que': serializeParam(
          _que,
          ParamType.String,
        ),
        'details': serializeParam(
          _details,
          ParamType.String,
        ),
        'correctOption': serializeParam(
          _correctOption,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'options': serializeParam(
          _options,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static QuizModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizModelStruct(
        que: deserializeParam(
          data['que'],
          ParamType.String,
          false,
        ),
        details: deserializeParam(
          data['details'],
          ParamType.String,
          false,
        ),
        correctOption: deserializeParam(
          data['correctOption'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'QuizModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuizModelStruct &&
        que == other.que &&
        details == other.details &&
        correctOption == other.correctOption &&
        img == other.img &&
        listEquality.equals(options, other.options);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([que, details, correctOption, img, options]);
}

QuizModelStruct createQuizModelStruct({
  String? que,
  String? details,
  String? correctOption,
  String? img,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    QuizModelStruct(
      que: que,
      details: details,
      correctOption: correctOption,
      img: img,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

QuizModelStruct? updateQuizModelStruct(
  QuizModelStruct? quizModel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    quizModel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addQuizModelStructData(
  Map<String, dynamic> firestoreData,
  QuizModelStruct? quizModel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (quizModel == null) {
    return;
  }
  if (quizModel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && quizModel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final quizModelData = getQuizModelFirestoreData(quizModel, forFieldValue);
  final nestedData = quizModelData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = quizModel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getQuizModelFirestoreData(
  QuizModelStruct? quizModel, [
  bool forFieldValue = false,
]) {
  if (quizModel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(quizModel.toMap());

  quizModel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getQuizModelListFirestoreData(
  List<QuizModelStruct>? quizModels,
) =>
    quizModels?.map((e) => getQuizModelFirestoreData(e, true)).toList() ?? [];
