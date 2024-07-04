import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'que1_model.dart';
export 'que1_model.dart';

class Que1Widget extends StatefulWidget {
  const Que1Widget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<Que1Widget> createState() => _Que1WidgetState();
}

class _Que1WidgetState extends State<Que1Widget> {
  late Que1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Que1Model());

    _model.questionTextController ??=
        TextEditingController(text: widget.parameter1);
    _model.questionFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(-1.0, -1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
        child: SizedBox(
          width: double.infinity,
          child: TextFormField(
            controller: _model.questionTextController,
            focusNode: _model.questionFocusNode,
            autofocus: true,
            autofillHints: const [AutofillHints.name],
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'Type Your Question',
              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Readex Pro',
                    letterSpacing: 0.0,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).alternate,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              filled: true,
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Poppins',
                  color: const Color(0xFF515151),
                  letterSpacing: 0.0,
                ),
            maxLines: 3,
            validator:
                _model.questionTextControllerValidator.asValidator(context),
          ),
        ),
      ),
    );
  }
}
