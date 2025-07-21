import 'package:flutter/material.dart';
import 'package:quiz_app/background.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/styles.dart';

/*class backGround extends StatelessWidget{
  const backGround({super.key});
  @override
  Widget build(context){
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0f2027), // Dark Teal
              Color(0xFF203a43), // Deep Blue
              Color(0xFF2c5364), // Blue Gray
            ],
          ),
        ),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [              
              Image.asset('assets/images/quiz-logo.png',width: 200,),
              const SizedBox(height: 20),
              const Style("Learn Flutter The Fun Way"),
              const SizedBox(height: 20),
              StyleButton(),              
            ],
          ),
        ),
      );
  }
}*/
class StartScreen extends StatefulWidget{
  const StartScreen ({super.key});

  @override
  State<StartScreen> createState(){
    return _StartScreenState();
  }
}
class _StartScreenState extends State<StartScreen>{
  bool quizStarted = false;
  //Widget? activeScreen;

  /*void initSet(){
    activeScreen = StartScreen(SwitchScreen);
    super.initState();
  }*/

  void switchScreen(){
    setState(() {
      quizStarted = true;
      //activeScreen=Question1();
    });
  }
  @override
  Widget build(context){
    if(quizStarted){
      return const Question1();
    }
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: backgroundDecoration,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
            children: [              
              Image.asset('assets/images/quiz-logo.png',width: 200,),
              const SizedBox(height: 20),
              const Style("Anime Quiz"),
              const SizedBox(height: 20),
              StartQuizButton(startText: "Start Quiz",  onPressed: switchScreen),              
            ],
          ),
        ),
      );
  }
}