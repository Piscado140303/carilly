import 'dart:io';
import 'package:carilly1/Databases/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// Make sure to import your DB helper file

class Campanyformregistration extends StatefulWidget {
  const Campanyformregistration({super.key});

  @override
  State<Campanyformregistration> createState() => _CampanyformregistrationState();
}

class _CampanyformregistrationState extends State<Campanyformregistration> {
  final _formKey = GlobalKey<FormState>();
  bool visibility_password = true;
  bool visibility_confirmation_password = true;
  File? _commerceImage;
  File? _idCardImage;
  final picker = ImagePicker();

  // Controllers for form fields
  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController agencyNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<File?> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<void> _selectCommerceImage() async {
    final image = await _getImage();
    if (image != null) {
      setState(() {
        _commerceImage = image;
      });
    }
  }

  Future<void> _selectIdCardImage() async {
    final image = await _getImage();
    if (image != null) {
      setState(() {
        _idCardImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 37),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.08),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: size.width * 0.093,
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
                      "Register As an Agency",
                      style: TextStyle(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.width * 0.1),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: ownerNameController,
                        decoration: InputDecoration(
                          labelText: "Owner Full Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.person_outline),
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter the owner's full name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.018),
                      TextFormField(
                        controller: agencyNameController,
                        decoration: InputDecoration(
                          labelText: "Agency Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.business),
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter the agency name";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.018),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          labelText: "Fix Phone",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.phone_outlined),
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a phone number";
                          }
                          if (!RegExp(r'^0[5-7]\d{8}$').hasMatch(value)) {
                            return "Please enter a valid phone number";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.018),
                      TextFormField(
                        obscureText: visibility_password,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility_password = !visibility_password;
                              });
                            },
                            icon: visibility_password
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a password";
                          }
                          if (value.length < 6) {
                            return "Password must be at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.018),
                      TextFormField(
                        obscureText: visibility_confirmation_password,
                        controller: confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                visibility_confirmation_password =
                                !visibility_confirmation_password;
                              });
                            },
                            icon: visibility_confirmation_password
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          ),
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please confirm your password";
                          }
                          if (value != passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.018),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: "Commerce Registration",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.person_outline),
                          suffixIcon: IconButton(
                            onPressed: _selectCommerceImage,
                            icon: const Icon(Icons.drive_folder_upload),
                          ),
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.018),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: "ID Card",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(Icons.person_outline),
                          suffixIcon: IconButton(
                            onPressed: _selectIdCardImage,
                            icon: const Icon(Icons.drive_folder_upload),
                          ),
                          labelStyle: TextStyle(color: Colors.grey[500]),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            String ownerName = ownerNameController.text;
                            String agencyName = agencyNameController.text;
                            String phone = phoneController.text;
                            String password = passwordController.text;

                            String commerceImagePath = _commerceImage != null ? _commerceImage!.path : '';
                            String idCardImagePath = _idCardImage != null ? _idCardImage!.path : '';

                            String query = '''
                              INSERT INTO Agency (owner_name, name, contact, password, commerce_reg_url, id_card_url)
                              VALUES ("$ownerName", "$agencyName", "$phone", "$password", "$commerceImagePath", "$idCardImagePath");
                            ''';

                            int result = await DBhelper().Insert(query);

                            if (result > 0) {
                              Navigator.pushNamed(context, '/homeCampany', arguments: {
                                'AgencyName': agencyName,
                              });
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration failed')));
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF192252),
                          shadowColor: Colors.white,
                          elevation: 0,
                          minimumSize: Size(size.width * 0.8, size.height * 0.061),
                          side: const BorderSide(color: Colors.black, width: 1.5),
                        ),
                        child: Text(
                          "Register",
                          style: TextStyle(
                            fontSize: size.width * 0.045,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/LoginPageCam');
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
