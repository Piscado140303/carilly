import 'package:flutter/material.dart';


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Makes the app bar transparent
        title: const  Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'CAR',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF140C47), // Color for "CAR"
                ),
              ),
              TextSpan(
                text: 'illy',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Color for "illy"
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      extendBodyBehindAppBar: true, // Ensures the app bar overlays the background
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'lib/images/welcomepic.jpg',
            fit: BoxFit.cover,
          ),
          // Carilly Title
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Text(
              'CARilly',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Rental Cars Text
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Text(
                  'Rental cars.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Carilly is a unique app and also\nThe right place to find your suitable car.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          // "Let's Go" Button
          Positioned(
            bottom: 50,
            left: 50,
            right: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/typeOfUser');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
              ),
              child: const Text(
                "Let's Go!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
