import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive_animation/app/core/constants/app_assets.dart';
import 'package:rive_animation/app/core/constants/app_colors.dart';
import 'package:rive_animation/features/auth/presentation/pages/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  late rive.RiveAnimationController _buttonController;
  late AnimationController _loginController;

  @override
  void initState() {
    super.initState();

    _loginController = AnimationController(
      duration: const Duration(milliseconds: 350),
      upperBound: 1,
      vsync: this,
    );

    _buttonController = rive.OneShotAnimation(
      "active",
      autoplay: false,
    );

    _buttonController.isActiveChanged.addListener(() {
      if (_buttonController.isActive) {
        final springAnimation = SpringSimulation(
          SpringDescription(
            mass: 0.1,
            stiffness: 40,
            damping: 5,
          ),
          0,
          1,
          0,
        );
        _loginController.animateWith(springAnimation);
      }
    });
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _loginController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 30),
            child: const rive.RiveAnimation.asset(
              AppAssets.riveShapes,
              fit: BoxFit.cover,
            ),
          ),
          AnimatedBuilder(
            animation: _loginController,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.translationValues(
                    0, -90 * _loginController.value, 0),
                child: child!,
              );
            },
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 90, 30, 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main title
                    const Text(
                      "Learn\ndesign & code",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Subtitle
                    Text(
                      "Don't skip design. Learn design and code,\nby building real apps with React and Swift.\nComplete courses about the best tools.",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),

                    const Spacer(flex: 3),

                    GestureDetector(
                      onTap: () {
                        _buttonController.isActive = true;
                      },
                      child: Container(
                        width: 236,
                        height: 64,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(20),
                              blurRadius: 10,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            rive.RiveAnimation.asset(
                              AppAssets.riveButton,
                              fit: BoxFit.cover,
                              controllers: [_buttonController],
                            ),
                            Center(
                              child: Transform.translate(
                                offset: const Offset(4, 4),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(Icons.arrow_forward,
                                        color: Colors.black),
                                    SizedBox(width: 8),
                                    Text(
                                      "Start the course",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Footer description
                    Text(
                      "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.6,
                        color: Colors.black.withAlpha(150),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          RepaintBoundary(
            child: AnimatedBuilder(
              animation: _loginController,
              builder: (context, child) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: IgnorePointer(
                        ignoring: true,
                        child: Opacity(
                          opacity: 0.4 * _loginController.value,
                          child: Container(
                            color: AppColors.shadow,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                        0,
                        -MediaQuery.of(context).size.height *
                            (1 - _loginController.value),
                      ),
                      child: LoginPage(
                        closeModal: () => _loginController.reverse(),
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
