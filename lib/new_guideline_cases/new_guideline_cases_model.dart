import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'new_guideline_cases_widget.dart' show NewGuidelineCasesWidget;
import 'package:flutter/material.dart';

class NewGuidelineCasesModel extends FlutterFlowModel<NewGuidelineCasesWidget> {
  ///  Local state fields for this page.

  int index = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.
  Map<QuizTestRecord, bool> checkboxValueMap = {};
  List<QuizTestRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
