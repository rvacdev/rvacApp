import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:rvac/api.dart';

class SignUpPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String userEmail = "";
    String userName = "";
    String userPassword = "";

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Center(
        child: Container(
          width: 300, // Set the width of the container to control the form's width
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign Up to Volunteer',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter a valid Email Address',
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0), // Adjust the horizontal padding
                      isDense: true, // Reduce the vertical space
                      labelStyle: TextStyle(fontSize: 16.0), // Adjust the font size of the label
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      userEmail = value;
                    },
                  ),
                  SizedBox(height: 20.0), // Add vertical space between fields
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter a Username',
                      prefixIcon: Icon(Icons.person),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      isDense: true,
                      labelStyle: TextStyle(fontSize: 16.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      userName = value;
                    },
                  ),
                  SizedBox(height: 20.0), // Add vertical space between fields
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter a Password (min. 8 characters)',
                      prefixIcon: Icon(Icons.lock),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      isDense: true,
                      labelStyle: TextStyle(fontSize: 16.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      userPassword = value;
                    },
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final data = await Api.signUp(
                          userEmail,
                          userName,
                          userPassword,
                        );

                        if (data['success']) {
                          // Signup successful
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Signup Successful!'),
                            ),
                          );
                        } else {
                          // Signup failed
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Signup Failed. Please try again.'),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
