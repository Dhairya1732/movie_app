import 'package:flutter/material.dart';
import 'package:movie_app/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(children: [
                  const SizedBox(height: 90),
                  const Text(
                    "Please enter your details",
                    style: TextStyle(fontSize: 22),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter name", labelText: "Name"),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        return (value != null && value.isNotEmpty)
                            ? null
                            : "This field cannot be empty";
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Age", labelText: "Age"),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        return (value != null && value.isNotEmpty)
                            ? null
                            : "This field cannot be empty";
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter Phone no.", labelText: "Phone no."),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        return (value != null && value.isNotEmpty)
                            ? null
                            : "This field cannot be empty";
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: "dd/mm/yyyy", labelText: "Date of Birth"),
                      keyboardType: TextInputType.datetime,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field cannot be empty";
                        }
                        const datePattern = r'^\d{2}/\d{2}/\d{4}$';
                        if (!RegExp(datePattern).hasMatch(value)) {
                          return "Please enter a valid date in the format dd/mm/yyyy";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 59, 139, 219)),
                        child: const Text(
                          "Log in",
                          style: TextStyle(),
                        ),
                      )),
                ]),
              ),
            )));
  }
}
