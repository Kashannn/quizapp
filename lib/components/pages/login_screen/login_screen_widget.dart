import '/auth/firebase_auth/auth_util.dart';
import '/components/getemail/getemail_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'login_screen_model.dart';
export 'login_screen_model.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  late LoginScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginScreenModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF9F9F9),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
          IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Text(
            'Let’s Sign In',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Poppins',
                color: const Color(0xFF202244),
                letterSpacing: 0.0,
                fontSize: 18
            ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  width: 100.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140.0,
                          decoration: BoxDecoration(
                            color:
                            FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Text(
                                    'Welcome Back',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Poppins',
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25,),
                                // Align(
                                //   alignment: const AlignmentDirectional(0.0, -1.0),
                                //   child: Padding(
                                //     padding: const EdgeInsetsDirectional.fromSTEB(
                                //         0.0, 12.0, 0.0, 24.0),
                                //     child: Text(
                                //       'Let\'s get started by filling out the form below.',
                                //       style: FlutterFlowTheme.of(context)
                                //           .labelMedium
                                //           .override(
                                //             fontFamily: 'Poppins',
                                //             letterSpacing: 0.0,
                                //           ),
                                //     ),
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                      _model.emailAddressTextController,
                                      focusNode: _model.emailAddressFocusNode,
                                      autofocus: true,
                                      autofillHints: const [AutofillHints.email],
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF18A0FB),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF18A0FB),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .emailAddressTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.passwordTextController,
                                      focusNode: _model.passwordFocusNode,
                                      autofocus: true,
                                      autofillHints: const [AutofillHints.password],
                                      obscureText: !_model.passwordVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Password',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFF18A0FB),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(12.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        suffixIcon: InkWell(
                                          onTap: () => setState(
                                                () => _model.passwordVisibility =
                                            !_model.passwordVisibility,
                                          ),
                                          focusNode:
                                          FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Readex Pro',
                                        letterSpacing: 0.0,
                                      ),
                                      validator: _model
                                          .passwordTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(1.0, -1.0),
                                  child: Builder(
                                    builder: (context) => Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 24.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                Colors.transparent,
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0)
                                                    .resolve(Directionality.of(
                                                    context)),
                                                child: GestureDetector(
                                                  onTap: () => _model
                                                      .unfocusNode
                                                      .canRequestFocus
                                                      ? FocusScope.of(context)
                                                      .requestFocus(_model
                                                      .unfocusNode)
                                                      : FocusScope.of(context)
                                                      .unfocus(),
                                                  child: const SizedBox(
                                                    height: 400.0,
                                                    width: double.infinity,
                                                    child: GetemailWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Text(
                                          'Forgot Password',
                                          textAlign: TextAlign.justify,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF18A0FB),

                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();

                                      final user =
                                      await authManager.signInWithEmail(
                                        context,
                                        _model.emailAddressTextController.text,
                                        _model.passwordTextController.text,
                                      );
                                      if (user == null) {
                                        return;
                                      }

                                      if (valueOrDefault(
                                          currentUserDocument?.role, '') ==
                                          'admin') {
                                        context.pushNamedAuth(
                                            'Add_Question_Answer',
                                            context.mounted);
                                      } else {
                                        context.pushNamedAuth(
                                            'home_screen', context.mounted);
                                      }
                                    },
                                    text: 'Sign In',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 44.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFF18A0FB),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),


                                // You will have to add an action on this rich text to go to your login page.
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed('Signup_Screen');
                                      },
                                      child: RichText(
                                        textScaler:
                                        MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            const TextSpan(
                                              text: 'Don\'t have an account? ',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: ' Sign Up here',
                                              style: FlutterFlowTheme.of(
                                                  context)
                                                  .bodyMedium
                                                  .override(
                                                fontFamily: 'Readex Pro',
                                                color: Color(0xFF18A0FB),
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              mouseCursor:
                                              SystemMouseCursors.click,
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () async {
                                                  context.pushNamed(
                                                      'Signup_Screen');
                                                },
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}