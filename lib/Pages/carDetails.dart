import 'package:carilly1/Pages/requestCarForm.dart';
import 'package:flutter/material.dart';


class CarDetails extends StatefulWidget {
  const CarDetails({super.key});

  @override
  State<CarDetails> createState() => _HomeState();
}

class _HomeState extends State<CarDetails> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CarPicture(),
            Expanded(child: SingleChildScrollView(child: CarMainInfos())),
          ],
        ),
      ),
    );
  }
}

class CarPicture extends StatefulWidget {
  const CarPicture({super.key});

  @override
  State<CarPicture> createState() => _CarPictureState();
}

class _CarPictureState extends State<CarPicture> {
  final List<String> _images = [
  'lib/images/sandero.jpg',
    'lib/images/sandero2.jpg',
    // Add more image paths here if needed
  ];
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Listen for page changes
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    for (String image in _images) {
      precacheImage(AssetImage(image), context);
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.025),
        child: Stack(
          children: [
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.28),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      _images[index],
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.black,
                    size: 27,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: GestureDetector(
                onTap: () {Navigator.pop(context);},
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 27,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarMainInfos extends StatelessWidget {
  const CarMainInfos({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(screenWidth * 0.05, 15, 23, screenWidth * 0.05),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sandero 2017 ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w800,
                    height: 0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Setif',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Text(
                      '15 000 da/jr',
                      style: TextStyle(
                        color: Color(0xFF140C47),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeight * 0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.grey,
                width: 0.9,
              ),
            ),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: screenHeight * 0.015),
                  height: screenHeight * 0.082,
                  width: screenHeight * 0.082,
                  child: ClipOval(
                    child: Image.asset(
                      'lib/images/profile.jpg',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jimi s Auto',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Text(
                        'Setif',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          // Scrollable Car Info section
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 7, 17, 17),
            child: Container(child: Column(
              children: [const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Car Info',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),)
                ],
              ),
                SizedBox(

                  // Adjust this height as needed
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          buildInfoRow('Brand', 'Dacia'),
                          buildInfoRow('Model', 'Sandero'),
                          buildInfoRow('Gas', 'Gasoline'),
                          buildInfoRow('Year of registration', '2017'),
                          buildInfoRow('Kilometers', '12.365 km'),
                          buildInfoRow('Seats', '5'),

                          // Add more rows as needed
                        ],
                      ),
                    ),
                  ),
                )],
            ),),
          )

          ,ElevatedButton(
            onPressed: (){showRentalForm(context);},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF140C47), // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(horizontal: screenWidth*0.3, vertical: 15),
            ),
            child: const Text(
              'Fill Form',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
