import 'package:carilly1/Databases/dbhelper.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool visibilityPassword = true;
  final GlobalKey<FormState> myKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RegExp regex = RegExp(r'^[a-zA-Z]+(?: [A-Za-z]+)*$');

  DBhelper dbHelper = DBhelper();

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
                Form(
                  key: myKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nameController,
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
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The field is empty";
                          } else if (value.length < 8) {
                            return "The field is too short";
                          }
                          return null;
                        },
                        obscureText: visibilityPassword,
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
                                visibilityPassword = !visibilityPassword;
                              });
                            },
                            icon: visibilityPassword
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
                          if (myKey.currentState!.validate()) {
                            String name = nameController.text.trim();
                            String password = passwordController.text.trim();

                            // Query for user existence
                            String userQuery = '''
                              SELECT * FROM User WHERE name = "$name";
                            ''';
                            List<Map> userResult = await dbHelper.ReadData(userQuery);

                            // If username is incorrect
                            if (userResult.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Username is incorrect')),
                              );
                              return;
                            }

                            // Query for correct password
                            String passwordQuery = '''
                              SELECT * FROM User WHERE name = "$name" AND password = "$password";
                            ''';
                            List<Map> passwordResult = await dbHelper.ReadData(passwordQuery);

                            // If password is incorrect
                            if (passwordResult.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Password is incorrect')),
                              );
                              return;
                            }

                            // Successful login
                            Navigator.pushNamed(
                              context,
                              '/homeUser',
                              arguments: {'Name': name},
                            );
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
