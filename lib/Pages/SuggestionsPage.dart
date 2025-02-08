import 'package:flutter/material.dart';

class SuggestionsPage extends StatefulWidget {
  const SuggestionsPage({super.key});

  @override
  State<SuggestionsPage> createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {
  List<Map<String, String>> mylist = [
    {"wilaya": "Tiaret", "price": "15000", "imgpath": 'lib/images/range.jpg', "model": "range"},
    {"wilaya": "Alger", "price": "15000", "imgpath": 'lib/images/serato.jpg', "model": "serato"},
    {"wilaya": "Tizi-Ouzou", "price": "15000", "imgpath": 'lib/images/audii.jpg', "model": "audi"},

  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    // Factors for proportional sizing
    double widthFactor(double percentage) => screenWidth * percentage;
    double heightFactor(double percentage) => screenHeight * percentage;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Suggestions",
          style: TextStyle(fontSize: widthFactor(0.055), fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: heightFactor(0.005)),
        height: heightFactor(0.87),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/SearchPage');
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: widthFactor(0.055)),
                margin: EdgeInsets.only(bottom: heightFactor(0.02)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: widthFactor(0.06), vertical: heightFactor(0.02)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, size: widthFactor(0.05), color: Colors.grey),
                      SizedBox(width: widthFactor(0.02)),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Text(
                            'Explore...',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mylist.length,
                itemBuilder: (BuildContext context, int index) {
                  final card = mylist[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: widthFactor(0.055)),
                    child: Column(
                      children: [
                        Container(
                          height: heightFactor(0.28),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(widthFactor(0.055)),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/carDetails');
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(widthFactor(0.055)),
                                  child: Image.asset(
                                    card["imgpath"]!,
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
                                    borderRadius: BorderRadius.circular(widthFactor(0.055)),
                                  ),
                                  child: Container(
                                    height: heightFactor(0.11),
                                    padding: EdgeInsets.symmetric(horizontal: widthFactor(0.036)),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          card["model"]!,
                                          style: TextStyle(
                                            fontSize: widthFactor(0.041),
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
                                                fontSize: widthFactor(0.036),
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "${card["price"]!}da/jr",
                                              style: TextStyle(
                                                fontSize: widthFactor(0.041),
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
                        SizedBox(
                          height: index == mylist.length - 1 ? heightFactor(0.1) : heightFactor(0.024),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
