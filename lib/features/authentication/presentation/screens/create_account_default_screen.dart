import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateAccountDefaultScreen extends StatelessWidget {
  const CreateAccountDefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.85;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignUpButton(
                icon: Icons.person_outline,
                text: 'Sign Up with Phone or Email',
                width: buttonWidth,
                onTap: () {},
              ),
              SignUpButton(
                icon: FontAwesomeIcons.facebook,
                text: 'Sign Up with Facebook',
                iconColor: Colors.blue,
                width: buttonWidth,
                onTap: () {},
              ),
              SignUpButton(
                icon: FontAwesomeIcons.google,
                text: 'Sign Up with Google',
                iconColor: Colors.red,
                width: buttonWidth,
                onTap: () {},
              ),
              SignUpButton(
                icon: FontAwesomeIcons.apple,
                text: 'Sign Up with Apple',
                width: buttonWidth,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final VoidCallback onTap;
  final double width;

  const SignUpButton({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    required this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(icon, color: iconColor ?? Colors.black, size: 24),
                  const SizedBox(width: 20),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
        ),
    );
  }
}