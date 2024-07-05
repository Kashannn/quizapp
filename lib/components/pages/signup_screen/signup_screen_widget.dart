import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'signup_screen_model.dart';
export 'signup_screen_model.dart';

class SignupScreenWidget extends StatefulWidget {
  const SignupScreenWidget({super.key});

  @override
  State<SignupScreenWidget> createState() => _SignupScreenWidgetState();
}

class _SignupScreenWidgetState extends State<SignupScreenWidget> {
  late SignupScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignupScreenModel());

    _model.nameTextController ??= TextEditingController();
    _model.nameFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confrimpasswordTextController ??= TextEditingController();
    _model.confrimpasswordFocusNode ??= FocusNode();

    _model.countryTextController ??= TextEditingController();
    _model.countryFocusNode ??= FocusNode();

    _model.phonenumberTextController ??= TextEditingController();
    _model.phonenumberFocusNode ??= FocusNode();
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
        backgroundColor: (Color(0xFFF1F4F8)),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 54.0, 0.0, 0.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            25.0, 0.0, 25.0, 55.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(1.0, -1.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 1.0,
                                      shape: const CircleBorder(),
                                      child: Container(
                                        width: 30.0,
                                        height: 30.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                        ),
                                        child: Align(
                                          alignment:
                                          const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 10.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                              Colors.transparent,
                                              onTap: () async {
                                                context.safePop();
                                              },
                                              child: const Icon(
                                                Icons.arrow_back_rounded,
                                                color: Color(0xFF202244),
                                                size: 25.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Sign Up',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                      fontFamily: 'Poppins',
                                      color: const Color(0xFF202244),
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1.0, -1.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            18.0, 0.0, 0.0, 10.0),
                        child: Text(
                          'Add Profile Photo',
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Container(
                        width: 370.0,
                        height: 103.0,
                        decoration: const BoxDecoration(
                          color: Color(0xFFDDECFA),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                          ),
                        ),
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(
                                              () => _model.isDataUploading1 = true);
                                      var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                      try {
                                        selectedUploadedFiles = selectedMedia
                                            .map((m) => FFUploadedFile(
                                          name: m.storagePath
                                              .split('/')
                                              .last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                            .toList();
                                      } finally {
                                        _model.isDataUploading1 = false;
                                      }
                                      if (selectedUploadedFiles.length ==
                                          selectedMedia.length) {
                                        setState(() {
                                          _model.uploadedLocalFile1 =
                                              selectedUploadedFiles.first;
                                        });
                                      } else {
                                        setState(() {});
                                        return;
                                      }
                                    }
                                  },
                                  child: Icon(
                                    Icons.cloud_upload,
                                    color:  const Color(0x333B4E99),
                                    size: 50.0,
                                  ),
                                ),
                              ),
                              Text(
                                'Upload Photo',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: const Color(0x333B4E99),
                                  letterSpacing: 0.0,
                                ),
                              ),
                              Text(
                                '(Max. File size: 25 MB)',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                  fontFamily: 'Poppins',
                                  color: const Color(0xFFBDBDBD),
                                  letterSpacing: 0.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: SizedBox(
                        width: 370.0,
                        child: TextFormField(
                          controller: _model.nameTextController,
                          focusNode: _model.nameFocusNode,
                          autofocus: true,
                          autofillHints: const [AutofillHints.name],
                          obscureText: false,
                          decoration: InputDecoration(

                            labelText: 'Name',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white,
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
                            fillColor:
                            Colors.white,
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                          keyboardType: TextInputType.name,
                          validator: _model.nameTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: SizedBox(
                        width: 370.0,
                        child: TextFormField(
                          controller: _model.emailAddressTextController,
                          focusNode: _model.emailAddressFocusNode,
                          autofocus: true,
                          autofillHints: const [AutofillHints.email],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF18A0FB),
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
                            fillColor:
                            Colors.white,
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: _model.emailAddressTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: SizedBox(
                        width: 370.0,
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
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF18A0FB),
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
                                color:  Color(0xFF18A0FB),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor:
                            Colors.white,
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                    () => _model.passwordVisibility =
                                !_model.passwordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                          validator: _model.passwordTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: SizedBox(
                        width: 370.0,
                        child: TextFormField(
                          controller: _model.confrimpasswordTextController,
                          focusNode: _model.confrimpasswordFocusNode,
                          autofocus: true,
                          autofillHints: const [AutofillHints.password],
                          obscureText: !_model.confrimpasswordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF18A0FB),
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
                            fillColor:
                            Colors.white,
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                    () => _model.confrimpasswordVisibility =
                                !_model.confrimpasswordVisibility,
                              ),
                              focusNode: FocusNode(skipTraversal: true),
                              child: Icon(
                                _model.confrimpasswordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color:
                                FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                          validator: _model
                              .confrimpasswordTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: SizedBox(
                        width: 370.0,
                        child: TextFormField(
                          controller: _model.countryTextController,
                          focusNode: _model.countryFocusNode,
                          autofocus: true,
                          autofillHints: const [AutofillHints.countryName],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Country ',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF18A0FB),
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
                            fillColor:
                            Colors.white,
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                          validator: _model.countryTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                      child: SizedBox(
                        width: 370.0,
                        child: TextFormField(
                          controller: _model.phonenumberTextController,
                          focusNode: _model.phonenumberFocusNode,
                          autofocus: true,
                          autofillHints: const [AutofillHints.email],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Phone ',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF18A0FB),
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
                            fillColor:
                            Colors.white,
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            letterSpacing: 0.0,
                          ),
                          keyboardType: TextInputType.phone,
                          validator: _model.phonenumberTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Padding(
                        padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            {
                              setState(() => _model.isDataUploading2 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var selectedMedia = <SelectedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles =
                                _model.uploadedLocalFile1.bytes!.isNotEmpty
                                    ? [_model.uploadedLocalFile1]
                                    : <FFUploadedFile>[];
                                selectedMedia = selectedFilesFromUploadedFiles(
                                  selectedUploadedFiles,
                                );
                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                        (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                _model.isDataUploading2 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile2 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }

                            GoRouter.of(context).prepareAuthEvent();
                            if (_model.passwordTextController.text !=
                                _model.confrimpasswordTextController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Passwords don\'t match!',
                                  ),
                                ),
                              );
                              return;
                            }

                            final user =
                            await authManager.createAccountWithEmail(
                              context,
                              _model.emailAddressTextController.text,
                              _model.passwordTextController.text,
                            );
                            if (user == null) {
                              return;
                            }

                            await UsersRecord.collection
                                .doc(user.uid)
                                .update(createUsersRecordData(
                              email: _model.emailAddressTextController.text,
                              displayName: _model.nameTextController.text,
                              photoUrl: _model.uploadedFileUrl2,
                              phoneNumber:
                              _model.phonenumberTextController.text,
                              country: _model.countryTextController.text,
                            ));

                            context.pushNamedAuth(
                                'login_screen', context.mounted);
                          },
                          text: 'Sign Up',
                          options: FFButtonOptions(
                            width: 325.0,
                            height: 52.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: const Color(0xFF18A0FB),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                              fontFamily: 'Poppins',
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
                    ),

                    // You will have to add an action on this rich text to go to your login page.
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 12.0, 0.0, 12.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('login_screen');
                          },
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Don’t have an account? ',
                                  style: TextStyle(),
                                ),
                                TextSpan(
                                  text: 'Sign In',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF18A0FB),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Poppins',
                                letterSpacing: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}