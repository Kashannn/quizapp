import 'package:flutter/material.dart';
import '../../../backend/firebase_services/firebase_services.dart';
import '../answers_screen/answers_screen_widget.dart';
import '/backend/backend.dart';

export 'random_cases_screen_model.dart';

class RandomCasesScreenWidget extends StatefulWidget {
  const RandomCasesScreenWidget({super.key});

  @override
  State<RandomCasesScreenWidget> createState() =>
      _RandomCasesScreenWidgetState();
}

class _RandomCasesScreenWidgetState extends State<RandomCasesScreenWidget> {
  bool isChecked = false;
  bool isLoading = true; // Added loading state
  int correctCount = 0;
  FirebaseServices firebaseServices = FirebaseServices();
  List<QuizModelStruct> quizList = [];
  List<Map<String, dynamic>> correctAnswers = [];
  List<Map<String, dynamic>> selectedAnswers = [];
  int currentIndex = 0;
  String? selectedOption;

  @override
  void initState() {
    super.initState();
    getQuizList();
  }

  Future<void> getQuizList() async {
    quizList = await firebaseServices.fetchQuizQuestions("Random Cases");
    if (quizList.isNotEmpty) {
      // Preload all images
      await Future.wait(
        quizList.map((quiz) => precacheImage(NetworkImage(quiz.img), context)),
      );
    }
    setState(() {
      isLoading = false; // Set loading state to false after fetching data
    });
  }

  void nextQuestion() {
    if (currentIndex >= quizList.length) {
      // Handle end of quiz or invalid state
      return;
    }

    if (selectedOption == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select an option.')),
      );
      return;
    }

    bool isCorrect = selectedOption == quizList[currentIndex].correctOption;

    if (isCorrect) {
      correctCount++;
    }

    selectedAnswers.add({
      'question': quizList[currentIndex].que,
      'selectedOption': selectedOption,
      'correct': isCorrect,
      'correctAnswer': quizList[currentIndex].correctOption,
      'details': quizList[currentIndex].details,
    });

    setState(() {
      currentIndex++;
      selectedOption = null;
      isChecked = false;
    });

    if (currentIndex == quizList.length) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnswersScreenWidget(
            totalQuestions: quizList.length,
            correctAnswers: correctCount,
            questionAnswers: selectedAnswers,
            quizList: quizList,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Random Cases",
            style: TextStyle(
              color: Color(0xFF103358),
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Poppins',
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Material(
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(quizList[currentIndex].img),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Q: " + quizList[currentIndex].que,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF103358),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Choose an answer:",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF103358),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: quizList[currentIndex].options
                      .asMap()
                      .entries
                      .map((entry) {
                    int index = entry.key;
                    String option = entry.value;
                    return Container(
                      height: 55,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Color(0xFF0000000D)
                                    .withOpacity(0.05),
                                child: Text(
                                  String.fromCharCode(65 + index),
                                  style: TextStyle(
                                    color: Color(0xFF18A0FB),
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 13),
                              Expanded(
                                child: Text(
                                  option,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF103358),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Radio<String>(
                                value: option,
                                groupValue: selectedOption,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedOption = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  width: double.infinity,
                  height: 52,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color(0xFF18A0FB),
                  ),
                  child: ElevatedButton(
                    onPressed: nextQuestion,
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(0),
                      backgroundColor:
                      MaterialStateProperty.all<Color>(
                          Colors.transparent),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.333,
                        letterSpacing: -0.24,
                        color: Colors.white,
                      ),
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
