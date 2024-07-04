import '/flutter_flow/flutter_flow_util.dart';
import 'getemail_widget.dart' show GetemailWidget;
import 'package:flutter/material.dart';

class GetemailModel extends FlutterFlowModel<GetemailWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
