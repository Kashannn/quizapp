import '/flutter_flow/flutter_flow_util.dart';
import 'opt4_widget.dart' show Opt4Widget;
import 'package:flutter/material.dart';

class Opt4Model extends FlutterFlowModel<Opt4Widget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
