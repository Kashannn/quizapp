import '/flutter_flow/flutter_flow_util.dart';
import 'addnewquestion_widget.dart' show AddnewquestionWidget;
import 'package:flutter/material.dart';

class AddnewquestionModel extends FlutterFlowModel<AddnewquestionWidget> {
  ///  Local state fields for this component.

  List<int> addOptions = [];
  void addToAddOptions(int item) => addOptions.add(item);
  void removeFromAddOptions(int item) => addOptions.remove(item);
  void removeAtIndexFromAddOptions(int index) => addOptions.removeAt(index);
  void insertAtIndexInAddOptions(int index, int item) =>
      addOptions.insert(index, item);
  void updateAddOptionsAtIndex(int index, Function(int) updateFn) =>
      addOptions[index] = updateFn(addOptions[index]);

  int options = 0;

  String? questionDetail;

  ///  State fields for stateful widgets in this component.

  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questionFocusNode?.dispose();
    questionTextController?.dispose();
  }
}
