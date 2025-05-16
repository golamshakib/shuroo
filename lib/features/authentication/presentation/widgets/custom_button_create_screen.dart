import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  final String text;
  final String img;
  final VoidCallback onTap;


  const SignUpButton({super.key, required this.text, required this.img, required this.onTap, });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white, // background color

            borderRadius: BorderRadius.circular(50), // rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Image.asset(img,height: 25,width: 24,),
                ),
              ),
              Center(
                child: Text(
                  text ?? 'Sign Up with Phone or Email',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
