import '/flutter_flow/flutter_flow_util.dart';
import 'que1_widget.dart' show Que1Widget;
import 'package:flutter/material.dart';

class Que1Model extends FlutterFlowModel<Que1Widget> {
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
