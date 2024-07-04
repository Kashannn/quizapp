import '/flutter_flow/flutter_flow_util.dart';
import 'new_guideline_cases_screen_widget.dart'
    show NewGuidelineCasesScreenWidget;
import 'package:flutter/material.dart';

class NewGuidelineCasesScreenModel
    extends FlutterFlowModel<NewGuidelineCasesScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
