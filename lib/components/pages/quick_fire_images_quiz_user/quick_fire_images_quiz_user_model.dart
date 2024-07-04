import '/flutter_flow/flutter_flow_util.dart';
import 'quick_fire_images_quiz_user_widget.dart'
    show QuickFireImagesQuizUserWidget;
import 'package:flutter/material.dart';

class QuickFireImagesQuizUserModel
    extends FlutterFlowModel<QuickFireImagesQuizUserWidget> {
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
