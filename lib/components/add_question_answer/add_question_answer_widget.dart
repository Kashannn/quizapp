import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'dart:io';

class AddQuestionAnswerWidget extends StatefulWidget {
  @override
  _AddQuestionAnswerWidgetState createState() => _AddQuestionAnswerWidgetState();
}

class _AddQuestionAnswerWidgetState extends State<AddQuestionAnswerWidget> {
  String? _selectedCategory;
  List<GlobalKey<_QuestionWidgetState>> _questionKeys = [GlobalKey<_QuestionWidgetState>()];
  bool _isLoading = false;

  void _addQuestion() {
    setState(() {
      _questionKeys.add(GlobalKey<_QuestionWidgetState>());
    });
  }

  void _deleteQuestion(int index) {
    setState(() {
      _questionKeys.removeAt(index);
    });
  }

  Future<void> _saveQuiz() async {
    final String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select a category')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      CollectionReference quizCollection = FirebaseFirestore.instance.collection('Quiz');
      List<Map<String, dynamic>> questionsData = [];

      for (var key in _questionKeys) {
        if (key.currentState != null) {
          if (!key.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Please fill all the fields correctly')),
            );
            setState(() {
              _isLoading = false;
            });
            return;
          }
          await key.currentState!.uploadImage();
          questionsData.add(key.currentState!.getData());
        }
      }

      QuerySnapshot querySnapshot = await quizCollection.where('category', isEqualTo: _selectedCategory).get();

      if (querySnapshot.docs.isNotEmpty) {
        // If a document with the same category exists, update it
        DocumentReference existingDocRef = querySnapshot.docs.first.reference;
        await existingDocRef.update({
          'que': FieldValue.arrayUnion(questionsData),
          //'date': formattedDate,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Questions added to the existing quiz')),
        );
      } else {
        // If no document with the same category exists, create a new one
        await quizCollection.add({
          'category': _selectedCategory,
          'que': questionsData,
          // 'date': formattedDate,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Quiz created successfully')),
        );
      }
    } catch (e) {
      print('Error saving quiz: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save quiz')),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xFFF1F4F8),
        title: const Text(
          'Add Question Answer',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            color: Color(0xFF103358),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Color(0xFFF1F4F8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Color(0xFF103358),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    //color: Colors.white,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _selectedCategory,
                        hint: const Text('Select Category', style: TextStyle(fontSize: 16)),
                        items: <String>[
                          'Quick Fire Images Quiz',
                          'Random Cases',
                          'New Guideline Cases',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(fontSize: 16)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCategory = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // const Text(
                  //   "Add Category Photo",
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.bold,
                  //     fontFamily: 'Poppins',
                  //     color: Color(0xFF828282),
                  //   ),
                  // ),
                  // SizedBox(height: 8),
                  // Container(
                  //   width: double.infinity,
                  //   height: 150,
                  //   decoration: BoxDecoration(

                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(color: Colors.grey),
                  //     color: Colors.white,
                  //   ),
                  //   child: Center(
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Icon(Icons.upload, size: 40, color: Colors.grey),
                  //         Text(
                  //           "Upload Photo (Max. File size 25 MB)",
                  //           style: TextStyle(color: Colors.grey, fontSize: 12),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 16),
                  Column(
                    children: List.generate(_questionKeys.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: QuestionWidget(
                          key: _questionKeys[index],
                          questionNumber: index + 1,
                          onDelete: () => _deleteQuestion(index),
                        ),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GestureDetector(
                      onTap: _addQuestion,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add_circle_outline, color: Color(0xFF18A0FB)),
                          SizedBox(width: 8),
                          Text(
                            'Add More',
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
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _saveQuiz,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF18A0FB)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
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
          if (_isLoading)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

class QuestionWidget extends StatefulWidget {
  final int questionNumber;
  final VoidCallback onDelete;

  const QuestionWidget({required this.questionNumber, required this.onDelete, Key? key}) : super(key: key);

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();
  final List<TextEditingController> _optionControllers = [];
  int _correctAnswerIndex = -1;
  File? _imageFile;
  String? _imageUrl;
  final String formattedDates = DateFormat('dd/MM/yy').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _addOption();
  }

  void _addOption() {
    setState(() {
      _optionControllers.add(TextEditingController());
    });
  }

  void _deleteOption(int index) {
    setState(() {
      _optionControllers.removeAt(index);
      if (_correctAnswerIndex == index) {
        _correctAnswerIndex = -1;
      } else if (_correctAnswerIndex > index) {
        _correctAnswerIndex--;
      }
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> uploadImage() async {
    if (_imageFile == null) return;
    String uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child('quiz_images/$uniqueFileName');
    UploadTask uploadTask = storageReference.putFile(_imageFile!);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => {});
    _imageUrl = await taskSnapshot.ref.getDownloadURL();
  }

  Map<String, dynamic> getData() {
    return {
      'que': _questionController.text,
      'details': _detailController.text,
      'options': _optionControllers.map((controller) => controller.text).toList(),
      'correctOption': _correctAnswerIndex == -1 ? null : _optionControllers[_correctAnswerIndex].text,
      'img': _imageUrl,
      'date': formattedDates,
    };
  }

  bool validate() {
    if (_questionController.text.isEmpty || _correctAnswerIndex == -1 || _optionControllers.any((controller) => controller.text.isEmpty)) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFF1F4F8),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Question ${widget.questionNumber}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
              color: Color(0xFF103358),
            ),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFFDDECFA),),
                color: Color(0xFFDDECFA),
              ),
              child: _imageFile == null
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload, size: 40, color: Colors.grey),
                    Text(
                      "Upload Photo (Max. File size 25 MB)",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              )
                  : Image.file(_imageFile!, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 8),
          // TextField(
          //   controller: _questionController,
          //   decoration: InputDecoration(
          //     hintText: 'Type Your Question',
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //       borderSide: BorderSide(color: Colors.white),
          //     ),
          //   ),
          // ),
          TextField(
            controller: _questionController,
            decoration: InputDecoration(
              hintText: 'Type Your Question',
              hintStyle: TextStyle(color: Colors.grey[500]),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            style: TextStyle(color: Colors.black),
          ),

          SizedBox(height: 8),
          Text(
            'Options',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Color(0xFF103358),
            ),
          ),
          SizedBox(height: 10),
          TextField(

            maxLines: 10,
            controller: _detailController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Type Detail...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            style: TextStyle(color: Colors.black),


          ),
          SizedBox(height: 16),
          Column(
            children: List.generate(_optionControllers.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.white),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextField(
                                  controller: _optionControllers[index],
                                  decoration: InputDecoration(
                                    hintText: 'Option ${index + 1}',
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            Switch(
                              value: _correctAnswerIndex == index,
                              onChanged: (bool value) {
                                setState(() {
                                  _correctAnswerIndex = value ? index : -1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteOption(index),
                    ),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 8),
          GestureDetector(
            onTap: _addOption,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add_circle_outline, color: Color(0xFF18A0FB)),
                SizedBox(width: 8),
                Text(
                  'Add More',
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
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: widget.onDelete,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                child: Text(
                  'Delete Question',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}