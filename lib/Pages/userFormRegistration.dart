import 'package:carilly1/Databases/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carilly1/Services/user_service.dart';
import 'package:carilly1/models/user.dart';
class UserFormRegistration extends StatefulWidget {
  const UserFormRegistration({super.key});

  @override
  _UserFormRegistrationState createState() => _UserFormRegistrationState();
}

class _UserFormRegistrationState extends State<UserFormRegistration> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserService userService = UserService();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  RegExp nameRegex = RegExp(r'^[a-zA-Z]+(?: [A-Za-z]+)*$');
  RegExp phoneRegex = RegExp(r'^0[5-7]\d{8}$');

  DBhelper dbHelper = DBhelper();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: size.height * 0.043,
                        height: size.height * 0.043,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.chevron_left),
                      ),
                    ),
                    SizedBox(width: size.width * 0.04),
                    Text(
                      "Register",
                      style: TextStyle(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  label: 'Full Name',
                  icon: Icons.person_outline,
                  controller: _fullNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Full Name is required';
                    } else if (!nameRegex.hasMatch(value)) {
                      return 'Please enter a valid name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Phone',
                  icon: Icons.phone_outlined,
                  controller: _phoneController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Phone number is required';
                    } else if (!phoneRegex.hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Password',
                  icon: Icons.lock,
                  obscureText: _obscurePassword,
                  controller: _passwordController,
                  toggleVisibility: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Confirm Password',
                  icon: Icons.lock,
                  obscureText: _obscureConfirmPassword,
                  controller: _confirmPasswordController,
                  toggleVisibility: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm Password is required';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFF140C47),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                onPressed: () async {
  if (_formKey.currentState!.validate()) {
    try {
      String fullName = _fullNameController.text;
      String phone = _phoneController.text;
      String password = _passwordController.text;

      print('Password: $password');
      print('Confirm Password: ${_confirmPasswordController.text}');

      User newUser = User(
        name: fullName,
        phoneNumber: phone,
        password: password, // Consider hashing before storing
      );

      // Firestore insert
      await userService.addUser(newUser);

      // SQLite insert
      String insertQuery = '''
        INSERT INTO User (name, password, phone_number)
        VALUES ('$fullName', '$password', '$phone');
      ''';
      int response = await dbHelper.Insert(insertQuery);

      if (response > 0) {
        Navigator.pushNamed(context, '/homeUser', arguments: {
          'Name': fullName,
        });
      } else {
        throw Exception('Failed to register user in SQLite');
      }
    } catch (e) {
      print("❌ Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: $e')),
      );
    }
  }
},

                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final VoidCallback? toggleVisibility;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.toggleVisibility,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: toggleVisibility != null
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: toggleVisibility,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
