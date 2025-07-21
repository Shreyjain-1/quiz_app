import 'package:flutter/material.dart';
import 'package:quiz_app/background.dart';
//import 'package:quiz_app/start_Screen.dart';
import 'package:quiz_app/styles.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/result_Screen.dart';

class Question1 extends StatefulWidget{
  const Question1({super.key});
  @override
  State<Question1> createState(){
    return _Question1State();
  }
}


class _Question1State extends State<Question1>{
  var currentQuestionIndex = 0;
  List<String> selectedAnswers = [];
  void AnswerFunction(String selectedAnswer) {
    setState(() {
      // Add the selected answer to our list
      selectedAnswers.add(selectedAnswer);
      
      // If we're not at the last question, move to next question
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // We're at the last question, calculate final score
        int score = 0;
        // Check all answers against their corresponding questions
        for (int i = 0; i < selectedAnswers.length; i++) {
          if (selectedAnswers[i].trim() == questions[i].answer.trim()) {
            score++;
          }
        }
        
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: score,
              totalQuestions: questions.length,
              selectedAnswers: selectedAnswers,
            ),
          ),
        );


        // Show completion message and results
        /*showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Quiz Completed!'),
              content: Text('Your answers: ${selectedAnswers.join(", ")}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Close dialog
                    // Reset the quiz state
                    currentQuestionIndex = 0;
                    selectedAnswers = [];
                    // Navigate back to start screen
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const StartScreen(),
                      ),
                    );
                  },
                  child: const Text('Back to Start'),
                ),
              ],
            );
          },
        );*/
      }
    });
    
  }
  @override
  Widget build(context){
    final shuffledOptions = questions[currentQuestionIndex].options.toList()..shuffle();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: backgroundDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Style(questions[currentQuestionIndex].question),
            ),
            const SizedBox(height: 30),
            for (var option in shuffledOptions)
              AnswerButton(
                answerText: option,
                onTap: () {
                  AnswerFunction(option);
                },
              ),
          ],
        ),
      ),
    );
  }
}