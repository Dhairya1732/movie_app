import 'package:flutter/material.dart';
import 'package:movie_app/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 90),
                const Text(
                  "Please enter your details",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      hintText: "Enter name",
                      labelText: "Name",
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      return (value != null && value.length >= 4)
                          ? null
                          : "Name must contain at least 4 characters";
                    },
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: ageController,
                    decoration: const InputDecoration(
                      hintText: "Enter Age",
                      labelText: "Age",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Age cannot be empty";
                      }
                      int age = int.tryParse(value) ?? 0;
                      return (age > 17 && age < 150)
                          ? null
                          : "Please enter a valid age above 18 years";
                    },
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintText: "Enter Phone no.",
                      labelText: "Phone no.",
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      return (value != null && value.length >= 10)
                          ? null
                          : "Phone number must have at least 10 digits";
                    },
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: TextFormField(
                    controller: dobController,
                    decoration: const InputDecoration(
                      hintText: "dd/mm/yyyy",
                      labelText: "Date of Birth",
                    ),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Date of Birth cannot be empty";
                      }
                      final parts = value.split('/');
                      if (parts.length != 3) {
                        return "Please enter a valid date in the format dd/mm/yyyy";
                      }
                      try {
                        final dob = DateTime(int.parse(parts[2]),
                            int.parse(parts[1]), int.parse(parts[0]));
                        final now = DateTime.now();
                        if (dob.isAfter(
                            now.subtract(const Duration(days: 365 * 18)))) {
                          return "You must be at least 18 years old";
                        }
                      } catch (e) {
                        return "Please enter a valid date";
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
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 59, 139, 219),
                    ),
                    child: const Text(
                      "Log in",
                      style: TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
