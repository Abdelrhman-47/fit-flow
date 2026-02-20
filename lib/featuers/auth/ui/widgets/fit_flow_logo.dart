import 'package:flutter/material.dart';

class FitFlowLogo extends StatelessWidget {
  const FitFlowLogo({super.key});

  @override
  Widget build(BuildContext context) {
  

    return Column(
      children: [
    Image.asset(
      'assets/images/b.png',
      width: 120,
      height: 120,
    ),
        const SizedBox(height: 12),
        const Text(
          'FitFlow',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'ELEVATE YOUR MOVEMENT',
          style: TextStyle(
            color: Colors.white54,
            fontSize: 10,
            letterSpacing: 3,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}