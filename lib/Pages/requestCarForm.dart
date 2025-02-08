import 'package:flutter/material.dart';



void showRentalForm(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: Colors.white,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.9, // Adjust height factor as needed
        child: RentalFormContent(),
      );
    },
  );
}

class RentalFormContent extends StatefulWidget {
  @override
  _RentalFormContentState createState() => _RentalFormContentState();
}

class _RentalFormContentState extends State<RentalFormContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Prevent a second AppBar effect
      body: SingleChildScrollView(
        child: Column(
          children: [
            // App Bar Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    "Fill Form",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // Favorite action
                    },
                  ),
                ],
              ),
            ),

            // Image and Details Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey[200],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'lib/images/welcomepic.jpg', // Replace with your image path
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Porsche997 turbo",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text("Batna"),
                            ],
                          ),
                          Text(
                            "15 000 da/jr",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Form Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rental Information",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  CustomTextField(label: 'Full Name', icon: Icons.person),
                  SizedBox(height: 16),
                  CustomTextField(label: 'Phone', icon: Icons.phone),
                  SizedBox(height: 16),
                  CustomTextField(
                    label: 'Birth Date',
                    icon: Icons.cake,
                  ),
                  SizedBox(height: 16),
                  CustomTextField(label: 'ID Card', icon: Icons.badge),
                  SizedBox(height: 16),
                  CustomTextField(
                    label: 'Starting Day',
                    icon: Icons.calendar_today,
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    label: 'Duration',
                    icon: Icons.timer,
                  ),
                ],
              ),
            ),

            // Submit Button
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Color(0xFF140C47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Request Rental",
                  style: TextStyle(
                      color: Colors.white, fontSize: 18),
                ),
              ),
            ),

            SizedBox(height: 24),
          ],
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

  const CustomTextField({
    Key? key,
    required this.label,
    required this.icon,
    this.obscureText = false,
    this.toggleVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        suffixIcon: toggleVisibility != null
            ? IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: toggleVisibility,
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
