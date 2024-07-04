import '/flutter_flow/flutter_flow_util.dart';
import 'opt2_widget.dart' show Opt2Widget;
import 'package:flutter/material.dart';

class Opt2Model extends FlutterFlowModel<Opt2Widget> {
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
