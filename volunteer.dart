import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:rvac/signup_page.dart";
import "package:rvac/api.dart";

class Volunteer extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String userEmail = "";
    String userPassword = "";

    return Center(
      child: Container(
        width:
            300, // Set the width of the container to control the form's width
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Volunteer Login',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                  height: 16.0), // Add some space between header and fields
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your Email";
                  }
                  return null;
                },
                onChanged: (value) {
                  userEmail = value;
                },
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 16.0), // Add some space between fields
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your Password";
                  }
                  return null;
                },
                onChanged: (value) {
                  userPassword = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(
                  height: 24.0), // Add more space between fields and button
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final data = await Api.login(userEmail, userPassword);

                    if (data['success']) {
                      // Login successful
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login Successful!'),
                        ),
                      );

                      // Optionally, you can navigate to another screen or perform additional actions
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen()));
                    } else {
                      // Login failed
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login Failed. Please try again.'),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(
                  height:
                      16.0), // Add some space between button and "Don't have an account?"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      // Navigate to the signup page when "Sign Up" is tapped
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
