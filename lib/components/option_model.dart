import '/flutter_flow/flutter_flow_util.dart';
import 'option_widget.dart' show OptionWidget;
import 'package:flutter/material.dart';

class OptionModel extends FlutterFlowModel<OptionWidget> {
  ///  Local state fields for this component.

  String? optionValue;

  String? details;

  ///  State fields for stateful widgets in this component.

  // State field(s) for option3 widget.
  FocusNode? option3FocusNode;
  TextEditingController? option3TextController;
  String? Function(BuildContext, String?)? option3TextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    option3FocusNode?.dispose();
    option3TextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
