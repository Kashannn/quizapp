import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalenderScreenWidget extends StatefulWidget {
  final DateTime? selectedDate;

  const CalenderScreenWidget({Key? key, this.selectedDate}) : super(key: key);

  @override
  State<CalenderScreenWidget> createState() => _CalenderScreenWidgetState();
}

class _CalenderScreenWidgetState extends State<CalenderScreenWidget> {
  List<Map<String, dynamic>> questionsData = [];

  @override
  void initState() {
    super.initState();
    fetchQuizData();
  }

  Future<void> fetchQuizData() async {
    try {
      CollectionReference quizCollection = FirebaseFirestore.instance.collection('Quiz');

      QuerySnapshot querySnapshot = await quizCollection
          .where('category', isEqualTo: 'New Guideline Cases')
          .where('date', isEqualTo: '04/07/24')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> data = [];
        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> quizData = doc.data() as Map<String, dynamic>;
          data.add(quizData);
        });

        setState(() {
          questionsData = data;
        });
      } else {
        print('No quiz data available for "New Guideline Cases" on 04/07/24');
      }
    } catch (e) {
      print('Error getting quiz data: $e');
      // Handle error fetching data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Questions'),
      ),
      body: questionsData.isEmpty
          ? Center(
        child: CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: questionsData.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> question = questionsData[index];
          List<String> options = List<String>.from(question['options'] ?? []);

          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Question: ${question['que']}'),
                  SizedBox(height: 8.0),
                  Text('Options: ${options.join(', ')}'),
                  SizedBox(height: 8.0),
                  Text('Correct Option: ${question['correctOption']}'),
                  SizedBox(height: 8.0),
                  Text('Date: ${question['date']}'),
                  // Add other fields as needed
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
