import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final websiteUri = Uri.parse('https://www.rivervalleyartscenter.org');
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Visit our website by clicking the button below "),
        const SizedBox(height: 30),
        ElevatedButton.icon(
            onPressed: () {
              launchUrl(websiteUri, mode: LaunchMode.inAppBrowserView);
            },
            icon: const Icon(Icons.web),
            label: const Text('Visit Website'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            )),
      ],
    ));
  }
}
