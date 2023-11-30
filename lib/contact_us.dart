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
        const Text("To reach out to us please email us at abc@abc.com"),
        const SizedBox(height: 30),
        const Text("or call us using the button below "),
        const SizedBox(height: 30),
        ElevatedButton.icon(
            onPressed: () async {
              final Uri url = Uri(
                scheme: 'tel',
                path: "479 968 2452",
              );
              await launchUrl(url);
            },
            icon: const Icon(Icons.phone),
            label: const Text('Call Now'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
            )),
      ],
    ));
  }
}
