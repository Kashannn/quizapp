import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _Textfield = prefs.getString('ff_Textfield') ?? _Textfield;
    });
    _safeInit(() {
      _alloptions =
          prefs.getStringList('ff_alloptions')?.map(int.parse).toList() ??
              _alloptions;
    });
    _safeInit(() {
      _options = prefs.getInt('ff_options') ?? _options;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _Textfield = '';
  String get Textfield => _Textfield;
  set Textfield(String value) {
    _Textfield = value;
    prefs.setString('ff_Textfield', value);
  }

  List<int> _alloptions = [];
  List<int> get alloptions => _alloptions;
  set alloptions(List<int> value) {
    _alloptions = value;
    prefs.setStringList(
        'ff_alloptions', value.map((x) => x.toString()).toList());
  }

  void addToAlloptions(int value) {
    alloptions.add(value);
    prefs.setStringList(
        'ff_alloptions', _alloptions.map((x) => x.toString()).toList());
  }

  void removeFromAlloptions(int value) {
    alloptions.remove(value);
    prefs.setStringList(
        'ff_alloptions', _alloptions.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromAlloptions(int index) {
    alloptions.removeAt(index);
    prefs.setStringList(
        'ff_alloptions', _alloptions.map((x) => x.toString()).toList());
  }

  void updateAlloptionsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    alloptions[index] = updateFn(_alloptions[index]);
    prefs.setStringList(
        'ff_alloptions', _alloptions.map((x) => x.toString()).toList());
  }

  void insertAtIndexInAlloptions(int index, int value) {
    alloptions.insert(index, value);
    prefs.setStringList(
        'ff_alloptions', _alloptions.map((x) => x.toString()).toList());
  }

  int _options = 0;
  int get options => _options;
  set options(int value) {
    _options = value;
    prefs.setInt('ff_options', value);
  }

  List<int> _questions = [];
  List<int> get questions => _questions;
  set questions(List<int> value) {
    _questions = value;
  }

  void addToQuestions(int value) {
    questions.add(value);
  }

  void removeFromQuestions(int value) {
    questions.remove(value);
  }

  void removeAtIndexFromQuestions(int index) {
    questions.removeAt(index);
  }

  void updateQuestionsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    questions[index] = updateFn(_questions[index]);
  }

  void insertAtIndexInQuestions(int index, int value) {
    questions.insert(index, value);
  }

  List<QuizModelStruct> _quizQuestion = [];
  List<QuizModelStruct> get quizQuestion => _quizQuestion;
  set quizQuestion(List<QuizModelStruct> value) {
    _quizQuestion = value;
  }

  void addToQuizQuestion(QuizModelStruct value) {
    quizQuestion.add(value);
  }

  void removeFromQuizQuestion(QuizModelStruct value) {
    quizQuestion.remove(value);
  }

  void removeAtIndexFromQuizQuestion(int index) {
    quizQuestion.removeAt(index);
  }

  void updateQuizQuestionAtIndex(
    int index,
    QuizModelStruct Function(QuizModelStruct) updateFn,
  ) {
    quizQuestion[index] = updateFn(_quizQuestion[index]);
  }

  void insertAtIndexInQuizQuestion(int index, QuizModelStruct value) {
    quizQuestion.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
