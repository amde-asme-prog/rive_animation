import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive_animation/app/constants/app_assets.dart';
import 'package:rive/rive.dart' as rive;

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Center(
              child: OverflowBox(
                maxWidth: double.infinity,
                child: Transform.translate(
                  offset: const Offset(200, 100),
                  child: Image.asset(
                    width: 715,
                    height: 560,
                    AppAssets.splineBackground,
                  ),
                ),
              ),
            ),
          ),
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 30),
            child: const rive.RiveAnimation.asset(
              AppAssets.riveShapes,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  child: const Text(
                    "Learn design & code",
                    style: TextStyle(
                      fontSize: 60,
                    ),
                  ),
                ),
                Text(
                  "Don't skip design, Learn design and code, by building real apps with Flutter and React. Complete courses about  best tools",
                  style: TextStyle(
                    color: Colors.black.withAlpha(150),
                    fontFamily: "Inter",
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
