import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_question_answer_widget.dart' show AddQuestionAnswerWidget;
import 'package:flutter/material.dart';

class AddQuestionAnswerModel extends FlutterFlowModel<AddQuestionAnswerWidget> {
  ///  Local state fields for this page.

  List<TextEditingController> optionControllers = [];
  List<String> optionHintTexts = [];
  TextEditingController questionController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController correctAnswerController = TextEditingController();
  String? dropdownvalue;

  List<int> addOptions = [];
  void addToAddOptions(int item) => addOptions.add(item);
  void removeFromAddOptions(int item) => addOptions.remove(item);
  void removeAtIndexFromAddOptions(int index) => addOptions.removeAt(index);
  void insertAtIndexInAddOptions(int index, int item) =>
      addOptions.insert(index, item);
  void updateAddOptionsAtIndex(int index, Function(int) updateFn) =>
      addOptions[index] = updateFn(addOptions[index]);

  String? que;

  String? optA;

  String? optB;

  String? optC;

  String? optD;

  String? detail;

  bool onTap = false;

  bool val1 = false;

  bool val2 = false;

  bool val3 = false;

  bool val4 = false;

  int? loopcount = 0;

  List<String> newOptions = [];
  void addToNewOptions(String item) => newOptions.add(item);
  void removeFromNewOptions(String item) => newOptions.remove(item);
  void removeAtIndexFromNewOptions(int index) => newOptions.removeAt(index);
  void insertAtIndexInNewOptions(int index, String item) =>
      newOptions.insert(index, item);
  void updateNewOptionsAtIndex(int index, Function(String) updateFn) =>
      newOptions[index] = updateFn(newOptions[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;
  String? _questionTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    questionTextControllerValidator = _questionTextControllerValidator;
    textController3Validator = _textController3Validator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    questionFocusNode?.dispose();
    questionTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
