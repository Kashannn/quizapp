import '/flutter_flow/flutter_flow_util.dart';
import 'random_cases_screen_widget.dart' show RandomCasesScreenWidget;
import 'package:flutter/material.dart';

class RandomCasesScreenModel extends FlutterFlowModel<RandomCasesScreenWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
