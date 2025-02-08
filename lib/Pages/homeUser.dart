import 'package:carilly1/Pages/ProfileUser.dart';
import 'package:carilly1/Pages/FavPage.dart';
import 'package:carilly1/Pages/SuggestionsPage.dart';
import 'package:flutter/material.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {

  int selected = 2;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    List<Widget> big_list = [FavaPage(), SuggestionsPage(), ProfilePage(userInfo: args)];
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    double widthFactor(double percentage) => screenWidth * percentage;
    double heightFactor(double percentage) => screenHeight * percentage;

    double containerHeight = heightFactor(0.09);
    double iconSize = screenWidth * 0.1;

    return Stack(
      children: [
        big_list[selected],
        Positioned(
          bottom: heightFactor(0.002),
          left: widthFactor(0.055),
          right: widthFactor(0.055),
          child: Container(
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: 1, color: Colors.grey),
            ),
          ),
        ),
        Positioned(
          bottom: selected == 0 ? heightFactor(0.045) : heightFactor(0.005),
          left: widthFactor(0.12),
          child: Container(
            height: containerHeight,
            width: widthFactor(0.2),
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
                size: selected == 0 ? iconSize : iconSize * 0.9,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: selected == 1 ? heightFactor(0.045) : heightFactor(0.005),
          left: widthFactor(0.41),
          child: Container(
            height: containerHeight,
            width: widthFactor(0.2),
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
                Icons.search,
                color: selected == 1 ? Colors.white : Colors.black,
                size: selected == 1 ? iconSize : iconSize * 0.9,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: selected == 2 ? heightFactor(0.045) : heightFactor(0.005),
          right: widthFactor(0.12),
          child: Container(
            height: containerHeight,
            width: widthFactor(0.2),
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
                size: selected == 2 ? iconSize : iconSize * 0.9,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
