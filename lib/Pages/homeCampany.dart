
import 'package:carilly1/Pages/ProfileCampany.dart';
import 'package:carilly1/Pages/ProfileUser.dart';
import 'package:carilly1/Pages/RequestPage.dart';
import 'package:carilly1/Pages/addCarForm.dart';
import 'package:carilly1/Pages/myCars.dart';
import 'package:flutter/material.dart';

class HomeCampany extends StatefulWidget {
  const HomeCampany({super.key});

  @override

  State<HomeCampany> createState() => _HomeCampanyState();
}

class _HomeCampanyState extends State<HomeCampany> {

  int selected = 2;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    List<Widget> big_list = [RequestPage(), MyCars(), ProfilePageC(userInfo: args)];
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width; // 360
    final double screenHeight = size.height; // 616

    // Factors for proportional sizing
    double widthFactor(double percentage) => screenWidth * percentage;
    double heightFactor(double percentage) => screenHeight * percentage;

    // Icon size and container height are proportional to screen dimensions
    double containerHeight = heightFactor(0.09); // Container height as 9% of screen height
    double iconSize = screenWidth * 0.1; // Icon size as 10% of screen width

    return Stack(
      children: [
        // Main Content
        big_list[selected],

        // Bottom Navigation Container
        Positioned(
          bottom: heightFactor(0.002),
          left: widthFactor(0.055),
          right: widthFactor(0.055),
          child: Container(
            height: containerHeight, // Make container height responsive
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: 1, color: Colors.grey),
            ),
          ),
        ),

        // First Icon Button (Inbox)
        Positioned(
          bottom: selected == 0 ? heightFactor(0.045) : heightFactor(0.005),
          left: widthFactor(0.12),
          child: Container(
            height: containerHeight, // Use the same height for all containers
            width: widthFactor(0.2), // Set width as 20% of screen width
            decoration: BoxDecoration(
              color: selected == 0 ? const Color(0xFF140C47) : Colors.transparent,
              borderRadius: BorderRadius.circular(40),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  selected = 0;
                });
              },
              icon: Icon(
                Icons.inbox,
                color: selected == 0 ? Colors.white : Colors.black,
                size: selected == 0 ? iconSize : iconSize * 0.9, // Slightly smaller when not selected
              ),
            ),
          ),
        ),

        // Second Icon Button (Search)
        Positioned(
          bottom: selected == 1 ? heightFactor(0.045) : heightFactor(0.005),
          left: widthFactor(0.41),
          child: Container(
            height: containerHeight, // Use the same height for all containers
            width: widthFactor(0.2), // Set width as 20% of screen width
            decoration: BoxDecoration(
              color: selected == 1 ? const Color(0xFF140C47) : Colors.transparent,
              borderRadius: BorderRadius.circular(40),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  selected = 1;
                });
              },
              icon: Icon(
                Icons.car_rental,
                color: selected == 1 ? Colors.white : Colors.black,
                size: selected == 1 ? iconSize : iconSize * 0.9, // Slightly smaller when not selected
              ),
            ),
          ),
        ),

        // Third Icon Button (Profile)
        Positioned(
          bottom: selected == 2 ? heightFactor(0.045) : heightFactor(0.005),
          right: widthFactor(0.12),
          child: Container(
            height: containerHeight, // Use the same height for all containers
            width: widthFactor(0.2), // Set width as 20% of screen width
            decoration: BoxDecoration(
              color: selected == 2 ? const Color(0xFF140C47) : Colors.transparent,
              borderRadius: BorderRadius.circular(40),
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  selected = 2;
                });
              },
              icon: Icon(
                Icons.person_outline,
                color: selected == 2 ? Colors.white : Colors.black,
                size: selected == 2 ? iconSize : iconSize * 0.9, // Slightly smaller when not selected
              ),
            ),
          ),
        ),
      ],
    );
  }
}
