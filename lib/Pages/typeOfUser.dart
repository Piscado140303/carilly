import 'package:flutter/material.dart';

class TypeOfUser extends StatefulWidget {
  @override
  _TypeOfUserState createState() => _TypeOfUserState();
}

class _TypeOfUserState extends State<TypeOfUser> {
  String selectedRole = ''; // Tracks the selected role (Agency or Normal User)

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              // Welcome Section
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome to Carilly",
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF140C47),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      _buildRoleButton("Agency"),
                      SizedBox(height: 15),
                      _buildRoleButton("Normal User"),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor: Color(0xFF140C47),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if(selectedRole=="Agency"){Navigator.pushNamed(context, '/Campanyformregistration');}
                          else{Navigator.pushNamed(context, '/userFormRegistration');}
                          print("Next button tapped with role: $selectedRole");
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(fontSize: screenWidth * 0.045),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Footer Section
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("Login tapped");
                        Navigator.pushNamed(context, '/logInPage');
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(String role) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRole = role; // Update the selected role
        });
        print("$role button tapped");
      },
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          gradient: selectedRole == role
              ? LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          color: selectedRole == role ? null : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: selectedRole == role ? Colors.blue : Colors.black87,
          ),
          boxShadow: selectedRole == role
              ? [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.5),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ]
              : [],
        ),
        alignment: Alignment.center,
        child: Text(
          role,
          style: TextStyle(
            fontSize: 16,
            color: selectedRole == role ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
