import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuroo/core/common/widgets/custom_appbar.dart';
import 'package:shuroo/core/common/widgets/custom_text.dart';
import 'package:shuroo/core/utils/constants/app_sizer.dart';
import 'package:shuroo/core/utils/constants/app_texts.dart';
import 'package:shuroo/core/utils/constants/image_path.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(

            children: [

              Container(alignment:Alignment.topLeft,child: Icon(Icons.arrow_back, size: 24)),
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Image.asset(ImagePath.logo, height: 62.w, width: 62.w),
                    SizedBox(height: 12),
                    CustomText(text: AppText.sign_up_start, fontSize: 24),
                    CustomText(text: AppText.exploring, fontSize: 24),
                    SizedBox(height: 60),
                    Image.asset(ImagePath.group, height: 206.w, width: 217),
                  ],
                ),
              ),

              Column(
                children: [

                  Row(
                    children: [
                      Text("hs"),
                       SizedBox(width: 20),
                      Text(
                        "hsbfvygvbteteteetee",

                        style:  TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Text("hs"),
                       SizedBox(width: 20),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "hsbfvyg",

                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),


                ],
              ),
            ],
          ),
        ),
      ),
    );
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
                icon: "we",
                text: 'Sign Up with Phone or Email',
                width: buttonWidth,
                onTap: () {},
              ),
              SignUpButton(
                icon: "sh",
                text: 'Sign Up with Facebook',
                iconColor: Colors.blue,
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
  final String icon;
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
              Text(""),
              const SizedBox(width: 20),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
