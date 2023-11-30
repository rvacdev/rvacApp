import 'package:flutter/material.dart';

class Volunteer extends StatelessWidget {
  const Volunteer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Username"),
                const SizedBox(
                  height: 30,
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.only(
                        top: 20, bottom: 20, right: 20, left: 20),
                    hintText: 'Enter Username Here',
                  ),
                ),
                const SizedBox(height: 30),
                const Text("Password"),
                const SizedBox(height: 30),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Password Here',
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('You have successfully logged in'),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.check_box),
                    label: const Text('Login'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    )),
              ],
            )));
  }
}
