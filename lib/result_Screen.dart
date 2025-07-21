import 'package:flutter/material.dart';
import 'package:quiz_app/start_Screen.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/background.dart';
import 'package:quiz_app/styles.dart';



class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<String> selectedAnswers;

  const ResultScreen({
    required this.score, 
    required this.totalQuestions,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollableBackground(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40), // Space for status bar
            const Style('Quiz Results'),
            const SizedBox(height: 20),
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 500),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Style('Score: $score / $totalQuestions'),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Add each question's details
            for (int i = 0; i < totalQuestions; i++) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.13),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Style('Q${i + 1}: ${questions[i].question}'),
                      const SizedBox(height: 12),
                      Text(
                        'Your Answer: ${selectedAnswers[i]}',
                        style: TextStyle(
                          fontSize: 18,
                          color: selectedAnswers[i].trim() == questions[i].answer.trim()
                              ? Color.fromARGB(255, 100, 255, 100)
                              : Color.fromARGB(255, 255, 80, 80),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Correct Answer: ${questions[i].answer}',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 100, 255, 100),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            const SizedBox(height: 40),
            StartQuizButton(
              startText: "Back to Start",
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const StartScreen(),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}