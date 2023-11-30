import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
            "Thank you for loggin in, here is a Gif from the Watercoolers"),
        const SizedBox(height: 30),
        Image.network(
            'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),
      ],
    ));
  }
}
