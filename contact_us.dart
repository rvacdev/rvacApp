import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("To reach out to us please click any of the buttons below"),
        const SizedBox(height: 30),
        ElevatedButton.icon(
            onPressed: () async {
              final Uri url = Uri(
                scheme: 'tel',
                path: "4799682452",
              );
              await launchUrl(url);
            },
            icon: const Icon(Icons.phone),
            label: const Text('Call Now'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            )),
        const SizedBox(height: 30),
        ElevatedButton.icon(
            onPressed: () async {
              final Uri url = Uri(
                scheme: 'mailto',
                path: "rvacdev@gmail.com",
                query: 'subject=General inquiry',
              );
              await launchUrl(url);
            },
            icon: const Icon(Icons.email),
            label: const Text('Email Us'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            )),
      ],
    ));
  }
}
