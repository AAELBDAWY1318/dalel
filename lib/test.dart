import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Shimmer.fromColors(
          baseColor: const Color.fromARGB(255, 211, 209, 209),
          highlightColor: const Color.fromARGB(255, 223, 220, 220),
          child: Container(
            height: 100.0,
            width: 160.0,
            
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0), 
            ),
          ),
        ),
      ),
    );
  }
}
