import 'package:cloud_firestore/cloud_firestore.dart';


import '../schema/structs/quiz_model_struct.dart';

class FirebaseServices {

  Future<List<QuizModelStruct>> fetchQuizQuestions(String category) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('Quiz')
        .where('category', isEqualTo: category)
        .get();

    List<QuizModelStruct> quizQuestions = [];

    for (var doc in querySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;
      if (data.containsKey('que')) {
        final List<dynamic> questions = data['que'];
        for (var question in questions) {
          quizQuestions.add(QuizModelStruct.fromMap(question as Map<String, dynamic>));
        }
      }
    }

    return quizQuestions;
  }



}