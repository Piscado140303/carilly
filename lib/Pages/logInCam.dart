import 'package:carilly1/Databases/dbhelper.dart';
import 'package:flutter/material.dart';


class LoginPageCam extends StatefulWidget {
  const LoginPageCam({super.key});

  @override
  State<LoginPageCam> createState() => _LoginPageCamState();
}

class _LoginPageCamState extends State<LoginPageCam> {
  bool visibility_password = true;
  GlobalKey<FormState> mykey = GlobalKey<FormState>();
  String? name;
  String? password;
  RegExp regex = RegExp(r'^[a-zA-Z]+(?: [A-Za-z]+)*$');

  DBhelper dbHelper = DBhelper(); // Instance of DBhelper

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.white,
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
                      "Log in",
                      style: TextStyle(
                        fontSize: size.width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.width * 0.2),
                Expanded(
                  child: Form(
                    key: mykey,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (newValue) {
                            name = newValue;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "The field is empty";
                            } else if (!regex.hasMatch(value)) {
                              return "Your name doesn't satisfy the pattern";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Full Name",
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
                        ),
                        SizedBox(height: size.height * 0.023),
                        TextFormField(
                          onSaved: (newValue) {
                            password = newValue;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "The field is empty";
                            } else if (value.length < 8) {
                              return "The field is too short";
                            }
                            return null;
                          },
                          obscureText: visibility_password,
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
                        ),
                        SizedBox(height: size.height * 0.02),
                        ElevatedButton(
                          onPressed: () async {
                            if (mykey.currentState!.validate()) {
                              mykey.currentState!.save();

                              // Replace placeholders with actual values
                              String query = '''
                                SELECT * FROM Agency WHERE name = "$name" AND password = "$password";
                              ''';

                              List<Map> result = await dbHelper.ReadData(query);

                              if (result.isNotEmpty) {
                                // Successful login
                                Navigator.pushNamed(context, '/homeCampany',arguments: {
                                  'AgencyName':name
                                },);
                              } else {
                                // Show error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Invalid credentials')),
                                );
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF140C47),
                            shadowColor: Colors.white,
                            elevation: 0,
                            minimumSize: Size(size.width * 0.87, size.height * 0.07),
                            maximumSize: Size(size.width * 0.87, size.height * 0.07),
                            side: const BorderSide(color: Colors.black, width: 1.5),
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: size.width * 0.045,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Divider(
                          thickness: 1.5,
                          indent: size.width * 0.08,
                          endIndent: size.width * 0.08,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(color: Colors.grey[900]),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/typeOfUser');
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
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
