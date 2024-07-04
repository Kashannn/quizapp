import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiz_app/components/add_question_answer/seperate_question_class.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/det_widget.dart';
import '/components/opt1_widget.dart';
import '/components/que1_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'add_question_answer_model.dart';
export 'add_question_answer_model.dart';

class AddQuestionAnswerWidget extends StatefulWidget {
  const AddQuestionAnswerWidget({super.key});

  @override
  State<AddQuestionAnswerWidget> createState() =>
      _AddQuestionAnswerWidgetState();
}

class _AddQuestionAnswerWidgetState extends State<AddQuestionAnswerWidget> {
  late AddQuestionAnswerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddQuestionAnswerModel());

    _model.questionTextController ??= TextEditingController();
    _model.questionFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }
  List<bool> _isCheckedList = [];

  String? _imageUrl;

  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  String? _fileName;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        _imageFile = file;
        _fileName = pickedFile.name;
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) {
      // Handle case where no image is picked
      return;
    }

    // Upload image to Firebase Storage
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference storageReference = referenceRoot.child('images/$uniqueFileName');

    try {
      await storageReference.putFile(_imageFile!);
      String imageUrl = await storageReference.getDownloadURL();
      setState(() {
        _imageUrl = imageUrl;
      });
    } on FirebaseException catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      // Handle upload error
    }
  }
  String? _selectedCategory;
  List<QuestionWidget> _questions = [
    QuestionWidget(questionNumber: 1, onDelete: () {}),
  ];

  void _addQuestion() {
    setState(() {
      int nextQuestionNumber = _questions.length + 1;
      _questions.add(QuestionWidget(
          questionNumber: nextQuestionNumber,
          onDelete: () => _deleteQuestion(nextQuestionNumber)));
    });
  }

  void _deleteQuestion(int questionNumber) {
    setState(() {
      _questions.removeWhere(
              (question) => question.questionNumber == questionNumber);
      // Recalculate question numbers
      for (int i = 0; i < _questions.length; i++) {
        _questions[i] = QuestionWidget(
          questionNumber: i + 1,
          onDelete: () => _deleteQuestion(i + 1),
        );
      }
    });
  }


  void _addOption() {
    if (_model.optionControllers.isNotEmpty &&
        _model.optionControllers.last.text.isEmpty) {
      return; // Prevent adding new option if the last one is empty
    }

    setState(() {
      int nextOptionNumber = _model.optionControllers.length + 1;
      _isCheckedList.add(false);
      _model.optionControllers.add(TextEditingController());
      _model.optionHintTexts.add('Option $nextOptionNumber');
    });
  }

  void _deleteOption(int index) {
    setState(() {
      _isCheckedList.removeAt(index);
      _model.optionControllers.removeAt(index);
      _model.optionHintTexts.removeAt(index);
      // Recalculate option hint texts
      for (int i = 0; i < _model.optionHintTexts.length; i++) {
        _model.optionHintTexts[i] = 'Option ${i + 1}';
      }
    });
  }

  void _selectOption(int index) {
    setState(() {
      for (int i = 0; i < _isCheckedList.length; i++) {
        _isCheckedList[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(18, 31, 133, 0),
                  child: Text(
                    'Add Question Answers',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 31, 117, 0),
                  child: Text(
                    'Categories',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Poppins',
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(25, 48, 25, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: FlutterFlowDropDown<String>(
                              controller: _model.dropDownValueController ??=
                                  FormFieldController<String>(
                                    _model.dropDownValue ??=
                                    'Quick Fire Images Quiz',
                                  ),
                              options: [
                                'Quick Fire Images Quiz',
                                'Random Cases',
                                'New Guideline Cases',
                                'Add More',
                                ''
                              ],
                              onChanged: (val) async {
                                setState(() => _model.dropDownValue = val);
                                _model.dropdownvalue = _model.dropDownValue;
                                setState(() {});
                              },
                              width: double.infinity,
                              height: 55,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF103358),
                                letterSpacing: 0,
                              ),
                              hintText: 'Select Category',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24,
                              ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              elevation: 2,
                              borderColor:
                              FlutterFlowTheme.of(context).alternate,
                              borderWidth: 2,
                              borderRadius: 8,
                              margin:
                              EdgeInsetsDirectional.fromSTEB(16, 4, 16, 4),
                              hidesUnderline: true,
                              isOverButton: true,
                              isSearchable: false,
                              isMultiSelect: false,
                            ),
                          ),
                        ),
                        // Column(
                        //   children: _questions,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        //   child: GestureDetector(
                        //     onTap: _addQuestion,
                        //     child: Container(
                        //       width: double.infinity,
                        //       height: 52,
                        //       decoration: BoxDecoration(
                        //         border: Border.all(
                        //           color: Colors.black,
                        //           width: 1,
                        //         ),
                        //         color: Color(0xFFFFFFFF),
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: const [
                        //           Icon(
                        //             Icons.add,
                        //             color: Color(0xFF18A0FB),
                        //           ),
                        //           SizedBox(width: 8),
                        //           Text(
                        //             'Add Question',
                        //             style: TextStyle(
                        //               fontSize: 14,
                        //               fontWeight: FontWeight.bold,
                        //               fontFamily: 'Poppins',
                        //               color: Color(0xFF18A0FB),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: .0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Question ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF103358),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.purple),
                                onPressed: (){},
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                              context: context,
                              maxWidth: 800.00,
                              maxHeight: 800.00,
                              allowPhoto: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) =>
                                    validateFileFormat(
                                        m.storagePath, context))) {
                              setState(() =>
                              _model.isDataUploading = true);
                              var selectedUploadedFiles =
                              <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                showUploadMessage(
                                  context,
                                  'Uploading file...',
                                  showLoading: true,
                                );
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                  name: m.storagePath
                                      .split('/')
                                      .last,
                                  bytes: m.bytes,
                                  height:
                                  m.dimensions?.height,
                                  width: m.dimensions?.width,
                                  blurHash: m.blurHash,
                                ))
                                    .toList();

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
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                                  downloadUrls.length ==
                                      selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl =
                                      downloadUrls.first;
                                });
                                showUploadMessage(
                                    context, 'Success!');
                              } else {
                                setState(() {});
                                showUploadMessage(
                                    context, 'Failed to upload data');
                                return;
                              }
                            }
                          },
                          child: Container(
                            width: 370,
                            height: 103,
                            decoration: BoxDecoration(
                              color: Color(0xFFDDECFA),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5),
                              ),
                            ),
                            alignment: AlignmentDirectional(-1, -1),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  if (_model.uploadedFileUrl ==
                                      null ||
                                      _model.uploadedFileUrl == '')
                                    Align(
                                      alignment:
                                      AlignmentDirectional(0, 0),
                                      child: Column(
                                        mainAxisSize:
                                        MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional
                                                .fromSTEB(
                                                5, 0, 0, 0),
                                            child: Icon(
                                              Icons.cloud_upload,
                                              color:
                                              FlutterFlowTheme.of(
                                                  context)
                                                  .accent1,
                                              size: 50,
                                            ),
                                          ),
                                          Text(
                                            'Upload Photo',
                                            style: FlutterFlowTheme
                                                .of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily:
                                              'Poppins',
                                              color: Color(
                                                  0x333B4E99),
                                              letterSpacing: 0,
                                            ),
                                          ),
                                          Text(
                                            '(Max. File size: 25 MB)',
                                            style: FlutterFlowTheme
                                                .of(context)
                                                .bodyMedium
                                                .override(
                                              fontFamily:
                                              'Poppins',
                                              color: Color(
                                                  0xFFBDBDBD),
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (_model.uploadedFileUrl !=
                                      null &&
                                      _model.uploadedFileUrl != '')
                                    Align(
                                      alignment:
                                      AlignmentDirectional(0, 0),
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        child: Image.network(
                                          _model.uploadedFileUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:1.0, vertical: 10),
                          child: Container(
                            width: double.infinity,
                            height: 52,
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _model.questionController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type Your Question',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF515151),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 25, top: 20, bottom: 10),
                          child: Text(
                            'Options',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              color: Color(0xFF103358),
                            ),
                          ),
                        ),
                        Column(
                          children: _model.optionControllers
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 1.0, vertical: 10),
                              child: Container(
                                width: double.infinity,
                                height: 52,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: _model.optionControllers[index],
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: _model.optionHintTexts[index],
                                            hintStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF515151),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Checkbox(
                                      value: _isCheckedList[index],
                                      onChanged: (bool? newValue) {
                                        if (newValue == true) {
                                          _model.correctAnswerController = _model.optionControllers[index];
                                          _selectOption(index);

                                        }

                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete, color: Colors.red),
                                      onPressed: () => _deleteOption(index),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                              .toList(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 10),
                          child: GestureDetector(
                            onTap: _addOption,
                            child: Container(
                              width: double.infinity,
                              height: 52,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add,
                                    color: Color(0xFF18A0FB),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Add Option',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF18A0FB),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 10),
                          child: Container(
                            width: double.infinity,
                            height: 52,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                controller: _model.detailController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Detail',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF515151),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                        Align(
                          alignment: AlignmentDirectional(0, -1),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                            child: StreamBuilder<List<QuizTestRecord>>(
                              stream: queryQuizTestRecord(
                                queryBuilder: (quizTestRecord) => quizTestRecord.where(
                                  'category',
                                  isEqualTo: _model.dropDownValue,
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<QuizTestRecord> buttonQuizTestRecordList = snapshot.data!;
                                final buttonQuizTestRecord = buttonQuizTestRecordList.isNotEmpty
                                    ? buttonQuizTestRecordList.first
                                    : null;
                                return FFButtonWidget(
                                  onPressed: () async {

                                    FFAppState().addToQuizQuestion(QuizModelStruct(
                                      que: _model.questionController.text,
                                      details: _model.detailController.text,
                                      img: _model.uploadedFileUrl,
                                      options: _model.optionControllers.map((e) => e.text).toList(),
                                      correctOption: _model.correctAnswerController.text,
                                    ));
                                    FFAppState().update(() {});
                                    setState(() {});
                                    await QuizTestRecord.collection.doc().set({
                                      ...createQuizTestRecordData(
                                        category: _model.dropDownValue,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'que': getQuizModelListFirestoreData(
                                            FFAppState().quizQuestion,
                                          ),
                                        },
                                      ),
                                    });
                                    if ((buttonQuizTestRecord != null) == true) {
                                      _model.loopcount = 0;
                                      setState(() {});
                                      while (_model.loopcount! < FFAppState().quizQuestion.length) {
                                        await buttonQuizTestRecord!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'que': FieldValue.arrayUnion([
                                                getQuizModelFirestoreData(
                                                  updateQuizModelStruct(
                                                    FFAppState().quizQuestion[_model.loopcount!],
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                            },
                                          ),
                                        });
                                        _model.loopcount = _model.loopcount! + 1;
                                        setState(() {});
                                      }
                                    } else {

                                    }
                                    FFAppState().quizQuestion = [];
                                    setState(() {});
                                    _model.val1 = false;
                                    _model.val2 = false;
                                    _model.val3 = false;
                                    _model.val4 = false;
                                    setState(() {});
                                    setState(() {
                                      _model.questionController.clear();
                                      _model.detailController.clear();
                                      _model.optionControllers.map((e) => e.text).toList().clear();
                                    });
                                    setState(() {
                                      _model.isDataUploading = false;
                                      _model.uploadedLocalFile =
                                          FFUploadedFile(bytes: Uint8List.fromList([]));
                                      _model.uploadedFileUrl = '';
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Quiz saved successfully',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context).primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: FlutterFlowTheme.of(context).secondary,
                                      ),
                                    );
                                  },
                                  text: 'Save',
                                  options: FFButtonOptions(
                                    width: 325,
                                    height: 52,
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                                    color: Color(0xFF18A0FB),
                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                      letterSpacing: 0,
                                    ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class QuestionWidget extends StatefulWidget {
  final int questionNumber;
  final VoidCallback onDelete;
  const QuestionWidget({super.key,
  required this.questionNumber,
    required this.onDelete,});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late AddQuestionAnswerModel _model;
  List<bool> _isCheckedList = [];
  void _addOption() {
    if (_model.optionControllers.isNotEmpty &&
        _model.optionControllers.last.text.isEmpty) {
      return; // Prevent adding new option if the last one is empty
    }

    setState(() {
      int nextOptionNumber = _model.optionControllers.length + 1;
      _isCheckedList.add(false);
      _model.optionControllers.add(TextEditingController());
      _model.optionHintTexts.add('Option $nextOptionNumber');
    });
  }

  void _deleteOption(int index) {
    setState(() {
      _isCheckedList.removeAt(index);
      _model.optionControllers.removeAt(index);
      _model.optionHintTexts.removeAt(index);
      // Recalculate option hint texts
      for (int i = 0; i < _model.optionHintTexts.length; i++) {
        _model.optionHintTexts[i] = 'Option ${i + 1}';
      }
    });
  }

  void _selectOption(int index) {
    setState(() {
      for (int i = 0; i < _isCheckedList.length; i++) {
        _isCheckedList[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: .0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Question ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Color(0xFF103358),
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.purple),
                onPressed: (){},
              ),
            ],
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            final selectedMedia =
            await selectMediaWithSourceBottomSheet(
              context: context,
              maxWidth: 800.00,
              maxHeight: 800.00,
              allowPhoto: true,
            );
            if (selectedMedia != null &&
                selectedMedia.every((m) =>
                    validateFileFormat(
                        m.storagePath, context))) {
              setState(() =>
              _model.isDataUploading = true);
              var selectedUploadedFiles =
              <FFUploadedFile>[];

              var downloadUrls = <String>[];
              try {
                showUploadMessage(
                  context,
                  'Uploading file...',
                  showLoading: true,
                );
                selectedUploadedFiles = selectedMedia
                    .map((m) => FFUploadedFile(
                  name: m.storagePath
                      .split('/')
                      .last,
                  bytes: m.bytes,
                  height:
                  m.dimensions?.height,
                  width: m.dimensions?.width,
                  blurHash: m.blurHash,
                ))
                    .toList();

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
                ScaffoldMessenger.of(context)
                    .hideCurrentSnackBar();
                _model.isDataUploading = false;
              }
              if (selectedUploadedFiles.length ==
                  selectedMedia.length &&
                  downloadUrls.length ==
                      selectedMedia.length) {
                setState(() {
                  _model.uploadedLocalFile =
                      selectedUploadedFiles.first;
                  _model.uploadedFileUrl =
                      downloadUrls.first;
                });
                showUploadMessage(
                    context, 'Success!');
              } else {
                setState(() {});
                showUploadMessage(
                    context, 'Failed to upload data');
                return;
              }
            }
          },
          child: Container(
            width: 370,
            height: 103,
            decoration: BoxDecoration(
              color: Color(0xFFDDECFA),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            alignment: AlignmentDirectional(-1, -1),
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  if (_model.uploadedFileUrl ==
                      null ||
                      _model.uploadedFileUrl == '')
                    Align(
                      alignment:
                      AlignmentDirectional(0, 0),
                      child: Column(
                        mainAxisSize:
                        MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional
                                .fromSTEB(
                                5, 0, 0, 0),
                            child: Icon(
                              Icons.cloud_upload,
                              color:
                              FlutterFlowTheme.of(
                                  context)
                                  .accent1,
                              size: 50,
                            ),
                          ),
                          Text(
                            'Upload Photo',
                            style: FlutterFlowTheme
                                .of(context)
                                .bodyMedium
                                .override(
                              fontFamily:
                              'Poppins',
                              color: Color(
                                  0x333B4E99),
                              letterSpacing: 0,
                            ),
                          ),
                          Text(
                            '(Max. File size: 25 MB)',
                            style: FlutterFlowTheme
                                .of(context)
                                .bodyMedium
                                .override(
                              fontFamily:
                              'Poppins',
                              color: Color(
                                  0xFFBDBDBD),
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (_model.uploadedFileUrl !=
                      null &&
                      _model.uploadedFileUrl != '')
                    Align(
                      alignment:
                      AlignmentDirectional(0, 0),
                      child: ClipRRect(
                        borderRadius:
                        BorderRadius.circular(8),
                        child: Image.network(
                          _model.uploadedFileUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:1.0, vertical: 10),
          child: Container(
            width: double.infinity,
            height: 52,
            decoration: BoxDecoration(
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: TextField(
              controller: _model.questionController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Type Your Question',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Color(0xFF515151),
                ),
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 25, top: 20, bottom: 10),
          child: Text(
            'Options',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Color(0xFF103358),
            ),
          ),
        ),
        Column(
          children: _model.optionControllers
              .asMap()
              .entries
              .map((entry) {
            int index = entry.key;
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 1.0, vertical: 10),
              child: Container(
                width: double.infinity,
                height: 52,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _model.optionControllers[index],
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: _model.optionHintTexts[index],
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                            color: Color(0xFF515151),
                          ),
                        ),
                      ),
                    ),
                    Checkbox(
                      value: _isCheckedList[index],
                      onChanged: (bool? newValue) {
                        if (newValue == true) {
                          _model.correctAnswerController = _model.optionControllers[index];
                          _selectOption(index);

                        }

                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteOption(index),
                    ),
                  ],
                ),
              ),
            );
          })
              .toList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 10),
          child: GestureDetector(
            onTap: _addOption,
            child: Container(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.add,
                    color: Color(0xFF18A0FB),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Add Option',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color(0xFF18A0FB),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 10),
          child: Container(
            width: double.infinity,
            height: 52,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              color: Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _model.detailController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Detail',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                  color: Color(0xFF515151),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

