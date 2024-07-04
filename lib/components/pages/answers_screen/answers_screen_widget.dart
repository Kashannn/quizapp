import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quiz_app/backend/schema/structs/quiz_model_struct.dart';
import '../home_screen/home_screen_widget.dart';

class AnswersScreenWidget extends StatefulWidget {
  final int totalQuestions;
  final int correctAnswers;
  final List<Map<String, dynamic>> questionAnswers;
  final List<QuizModelStruct> quizList; // Add quizList here

  const AnswersScreenWidget({
    Key? key,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.questionAnswers,
    required this.quizList,
  }) : super(key: key);

  @override
  State<AnswersScreenWidget> createState() => _AnswersScreenWidgetState();
}

class _AnswersScreenWidgetState extends State<AnswersScreenWidget> {
  // Method to show details in a popup
  void _showDetailsPopup(String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Correct Answer Details",
            style: TextStyle(
              fontSize: 18.0, // Adjust font size as needed
              fontWeight: FontWeight.bold,
              color: Colors.black, // Adjust text color as needed
            ),
          ),
          content: Text(
            details,
            style: TextStyle(
              fontSize: 16.0, // Adjust font size as needed
              color: Colors.black87, // Adjust text color as needed
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Close',
                style: TextStyle(
                  fontSize: 16.0, // Adjust font size as needed
                  color: Colors.blue,
                  fontFamily: 'Poppins',
                  fontWeight:
                      FontWeight.bold, // Adjust button text color as needed
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Adjust border radius
          ),
          elevation: 4.0, // Adjust elevation for shadow effect
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFFFFFFF),
          title: Text(
            'Answers',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF18A0FB),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularPercentIndicator(
                      radius: 65,
                      lineWidth: 7,
                      percent: widget.correctAnswers / widget.totalQuestions,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${(widget.correctAnswers / widget.totalQuestions * 100).toStringAsFixed(0)}%",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Correct",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      progressColor: Colors.white,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${widget.correctAnswers}/${widget.totalQuestions}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "Correct Answers",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: ListView.builder(
                  itemCount: widget.questionAnswers.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> answer = widget.questionAnswers[index];
                    QuizModelStruct quiz = widget.quizList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: answer['correct']
                              ? Colors.green.withOpacity(0.1)
                              : Colors.red.withOpacity(0.1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Question ${index + 1}:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _showDetailsPopup(quiz.details ?? '');
                                  },
                                  child: Text(
                                    'Details',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              quiz.que, // Display question
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF103358),
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Your Answer: ${answer['selectedOption']}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF103358),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              answer['correct']
                                  ? "Correct Answer: ${answer['correctAnswer']}"
                                  : "Correct Answer: ${answer['correctAnswer']}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 52,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Colors.white,
                        border: Border.all(color: Color(0xFF18A0FB)),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreenWidget()),
                          );
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'Restart',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1.333,
                            letterSpacing: -0.24,
                            color: Color(0xFF18A0FB),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 52,
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: Color(0xFF18A0FB),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreenWidget()),
                          );
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.transparent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'Finish',
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
          ],
        ),
      ),
    );
  }
}
