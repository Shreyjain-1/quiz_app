import 'package:flutter/material.dart';

const backgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF0f2027),
      Color(0xFF203a43),
      Color(0xFF2c5364),
    ],
  ),
);

class ScrollableBackground extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const ScrollableBackground({
    required this.child,
    this.padding = const EdgeInsets.all(16.0),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundDecoration,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
