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
    DateTime? date, // New field
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _que = que,
        _details = details,
        _correctOption = correctOption,
        _img = img,
        _options = options,
        _date = date, // Initialize the field
        super(firestoreUtilData);

  String? _que;
  String get que => _que ?? '';
  set que(String? val) => _que = val;
  bool hasQue() => _que != null;

  String? _details;
  String get details => _details ?? '';
  set details(String? val) => _details = val;
  bool hasDetails() => _details != null;

  String? _correctOption;
  String get correctOption => _correctOption ?? '';
  set correctOption(String? val) => _correctOption = val;
  bool hasCorrectOption() => _correctOption != null;

  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;
  bool hasImg() => _img != null;

  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;
  void updateOptions(Function(List<String>) updateFn) {
    updateFn(_options ??= []);
  }
  bool hasOptions() => _options != null;

  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  static QuizModelStruct fromMap(Map<String, dynamic> data) => QuizModelStruct(
    que: data['que'] as String?,
    details: data['details'] as String?,
    correctOption: data['correctOption'] as String?,
    img: data['img'] as String?,
    options: getDataList(data['options']),
    date: (data['date'] is Timestamp) ? (data['date'] as Timestamp).toDate() : null,
  );

  Map<String, dynamic> toMap() => {
    'que': _que,
    'details': _details,
    'correctOption': _correctOption,
    'img': _img,
    'options': _options,
    'date': _date != null ? Timestamp.fromDate(_date!) : null,
  }..removeWhere((key, value) => value == null);

  @override
  Map<String, dynamic> toSerializableMap() => {
    'que': serializeParam(_que, ParamType.String),
    'details': serializeParam(_details, ParamType.String),
    'correctOption': serializeParam(_correctOption, ParamType.String),
    'img': serializeParam(_img, ParamType.String),
    'options': serializeParam(_options, ParamType.String, isList: true),
    'date': serializeParam(_date, ParamType.DateTime),
  }.withoutNulls;

  static QuizModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizModelStruct(
        que: deserializeParam(data['que'], ParamType.String, false),
        details: deserializeParam(data['details'], ParamType.String, false),
        correctOption: deserializeParam(data['correctOption'], ParamType.String, false),
        img: deserializeParam(data['img'], ParamType.String, false),
        options: deserializeParam<String>(data['options'], ParamType.String, true),
        date: deserializeParam(data['date'], ParamType.DateTime, false),
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
        listEquality.equals(options, other.options) &&
        date == other.date;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([que, details, correctOption, img, options, date]);
}

QuizModelStruct createQuizModelStruct({
  String? que,
  String? details,
  String? correctOption,
  String? img,
  DateTime? date,
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
      date: date,
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
