import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive_animation/app/core/constants/app_assets.dart';
import 'package:rive_animation/app/core/constants/app_colors.dart';
import 'package:rive_animation/app/core/helper/app_navigator.dart';
import 'package:rive_animation/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:rive/rive.dart' as rive;
import 'package:rive_animation/features/home/presentation/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.closeModal,
  });
  final Function closeModal;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late rive.SMITrigger _successAnim;
  late rive.SMITrigger _errorAnim;
  late rive.SMITrigger _confettiAnim;

  TextEditingController _emailControllr = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  void _onCheckRiveInit(rive.Artboard artboard) {
    final controller =
        rive.StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    _successAnim = controller.findInput<bool>("Check") as rive.SMITrigger;
    _errorAnim = controller.findInput<bool>("Error") as rive.SMITrigger;
  }

  void _onConfettiRiveInit(rive.Artboard artboard) {
    final controller =
        rive.StateMachineController.fromArtboard(artboard, "State Machine 1");
    artboard.addController(controller!);
    _confettiAnim =
        controller.findInput<bool>("Trigger explosion") as rive.SMITrigger;
  }

  void login() {
    setState(() {
      _isLoading = true;
    });
    bool isEmailValid = _emailControllr.text.isNotEmpty;
    bool isPasswordValid = _passwordController.text.isNotEmpty;
    bool isValid = isEmailValid && isPasswordValid;

    Future.delayed(const Duration(seconds: 1), () {
      !isValid ? _errorAnim.fire() : _successAnim.fire();
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
      if (isValid) {
        _confettiAnim.fire();
      }
    });

    if (isValid) {
      Future.delayed(const Duration(seconds: 4), () {
        widget.closeModal();
        _emailControllr.text = "";
        _passwordController.text = "";
        AppNavigator.push(context, HomePage());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadow.withOpacity(0.1),
                      offset: const Offset(0, 3),
                      blurRadius: 20,
                    ),
                    BoxShadow(
                      color: AppColors.shadow.withOpacity(0.1),
                      offset: const Offset(0, 30),
                      blurRadius: 30,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Inter",
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Access to 240+ hours of content, Learn design and code, by building real apps with Flutter and React Native",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black.withAlpha(150),
                        fontFamily: "Inter",
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      label: "Email",
                      controller: _emailControllr,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Image.asset(
                        AppAssets.emailIcon,
                        width: 24,
                        height: 24,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      label: "Password",
                      controller: _passwordController,
                      isPassword: true,
                      prefixIcon: Image.asset(
                        AppAssets.passwordIcon,
                        width: 24,
                        height: 24,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // TODO: Implement forgot password
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                            color: Color(0xFF5E5EE0),
                            fontFamily: "Inter",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        if (!_isLoading) login();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 185, 90, 141),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: const Size(double.infinity, 56),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: const [
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Inter",
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        Text(
                          "Or continue with",
                          style: TextStyle(
                            color: Colors.black.withAlpha(150),
                            fontFamily: "Inter",
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSocialIcon(AppAssets.googleLogo, () {}),
                            const SizedBox(width: 16),
                            _buildSocialIcon(AppAssets.appleLogo, () {}),
                            const SizedBox(width: 16),
                            _buildSocialIcon(AppAssets.emailLogo, () {}),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  ignoring: true,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      if (_isLoading)
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: rive.RiveAnimation.asset(
                            AppAssets.check,
                            fit: BoxFit.cover,
                            onInit: _onCheckRiveInit,
                          ),
                        ),
                      Positioned.fill(
                          child: SizedBox(
                        width: 500,
                        height: 500,
                        child: Transform.scale(
                          scale: 3,
                          child: rive.RiveAnimation.asset(
                            AppAssets.confetti,
                            fit: BoxFit.cover,
                            onInit: _onConfettiRiveInit,
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -10,
                left: 0,
                right: 0,
                child: CupertinoButton(
                  onPressed: () {
                    widget.closeModal();
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child:
                        const Icon(Icons.close, size: 24, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            assetPath,
          ),
        ),
      ),
    );
  }
}
