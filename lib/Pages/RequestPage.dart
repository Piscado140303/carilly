import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({super.key});

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List<Map<String, String>> mylist = [
    {"wilaya": "Djelfa", "price": "19000", "imgpath": 'lib/images/peugeot208.jpg', "model": "Pejuot"},

  ];


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width; // Width of the screen
    final double screenHeight = size.height; // Height of the screen

    // Factors for proportional sizing
    double widthFactor(double percentage) => screenWidth * percentage;
    double heightFactor(double percentage) => screenHeight * percentage;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Requests",
          style: TextStyle(fontSize: widthFactor(0.055), fontWeight: FontWeight.bold), // ~20px
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: heightFactor(0.005)), // Small top padding
        height: heightFactor(0.87), // Adjusted to fit screen
        child: ListView.builder(
          itemCount: mylist.length,
          itemBuilder: (BuildContext context, int index) {
            final card = mylist[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: widthFactor(0.055)), // ~20px
              child: Column(
                children: [
                  Container(
                    height: heightFactor(0.28), // ~210px
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(widthFactor(0.055)), // ~20px
                      border: Border.all(width: 1, color: Colors.grey),
                    ),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: (){Navigator.pushNamed(context, '/carDetails');},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(widthFactor(0.055)), // ~20px
                            child: Image.asset(
                              card["imgpath"]! ,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(widthFactor(0.055)
                              ),
                            ),
                            child: Container(
                              height: heightFactor(0.11), // ~70px
                              padding: EdgeInsets.symmetric(horizontal: widthFactor(0.036)), // ~13px
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    card["model"]!,
                                    style: TextStyle(
                                      fontSize: widthFactor(0.041), // ~15px
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        card["wilaya"]!,
                                        style: TextStyle(
                                          fontSize: widthFactor(0.036), // ~13px
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "${card["price"]!}da/jr",
                                        style: TextStyle(
                                          fontSize: widthFactor(0.041), // ~15px
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: index == mylist.length-1?heightFactor(0.1):heightFactor(0.024)), // ~15px
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

//===================Profile page ======================
