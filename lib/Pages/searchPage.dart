import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<String> wilayas = [
    "Adrar", "Chlef", "Laghouat", "Oum El Bouaghi", "Batna", "Béjaïa", "Biskra", "Béchar",
    "Blida", "Bouira", "Tamanrasset", "Tébessa", "Tlemcen", "Tiaret", "Tizi Ouzou", "Algiers",
    "Djelfa", "Jijel", "Sétif", "Saïda", "Skikda", "Sidi Bel Abbès", "Annaba", "Guelma",
    "Constantine", "Médéa", "Mostaganem", "M’Sila", "Mascara", "Ouargla", "Oran", "El Bayadh",
    "Illizi", "Bordj Bou Arréridj", "Boumerdès", "El Tarf", "Tindouf", "Tissemsilt", "El Oued",
    "Khenchela", "Souk Ahras", "Tipaza", "Mila", "Aïn Defla", "Naâma", "Aïn Témouchent", "Ghardaïa",
    "Relizane", "Timimoun", "Bordj Badji Mokhtar", "Ouled Djellal", "Béni Abbès", "In Salah",
    "In Guezzam", "Touggourt", "Djanet", "El M’Ghair", "El Meniaa"
  ];
  final List<String> carBrands = [
    "Renault", "Peugeot", "Dacia", "Hyundai", "Kia", "Toyota", "Volkswagen", "Seat",
    "Chevrolet", "Suzuki", "Fiat", "Nissan", "Skoda", "Citroën", "Ford"
  ];
  final List<String> years = [
    "1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999",
    "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2009",
    "2010", "2011", "2012", "2013", "2014", "2015", "2016", "2017", "2018", "2019",
    "2020", "2021", "2022", "2023", "2024"
  ];
  String? selectedWilaya;
  String? selectedyear;
  String? selectedModel;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width; // 360
    final double screenHeight = size.height; // 616

    // Factors for proportional sizing
    double widthFactor(double percentage) => screenWidth * percentage;
    double heightFactor(double percentage) => screenHeight * percentage;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(heightFactor(0.1)), // ~60px on 616px height
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: widthFactor(0.055)),
            margin: EdgeInsets.only(top: heightFactor(0.016)),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search",
                  style: TextStyle(fontSize: widthFactor(0.07), fontWeight: FontWeight.bold), // ~25px
                ),
                IconButton(
                  icon: Icon(Icons.clear, color: Colors.black, size: widthFactor(0.07)),
                  onPressed: () {Navigator.pop(context);},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: heightFactor(0.05), // ~30px
          left: widthFactor(0.055),
          right: widthFactor(0.055),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Search",
                suffixIcon: Icon(Icons.search, size: widthFactor(0.083)), // ~30px
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelStyle: TextStyle(color: Colors.grey[500]),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(40),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            SizedBox(height: heightFactor(0.032)), // ~20px
            Text(
              "Filter",
              style: TextStyle(fontSize: widthFactor(0.047), fontWeight: FontWeight.bold), // ~17px
            ),
            Container(
              padding: EdgeInsets.only(top: heightFactor(0.028)), // ~17px
              child: Column(
                children: [
                  buildDropdown("Select Wilaya", selectedWilaya, wilayas, (value) {
                    setState(() {
                      selectedWilaya = value;
                    });
                  }),
                  buildDropdown("Select Model", selectedModel, carBrands, (value) {
                    setState(() {
                      selectedModel = value;
                    });
                  }),
                  buildDropdown("Select Year", selectedyear, years, (value) {
                    setState(() {
                      selectedyear = value;
                    });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropdown(String hint, String? selectedValue, List<String> items, ValueChanged<String?> onChanged) {
    final double dropdownWidth = MediaQuery.of(context).size.width * 0.83; // ~300px
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: dropdownWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true, // Makes the dropdown take the full width
          hint: Text(hint),
          value: selectedValue,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          alignment: Alignment.centerLeft, // Align the text to the left
        ),
      ),
    );
  }
}


//==============Archive page =========================
