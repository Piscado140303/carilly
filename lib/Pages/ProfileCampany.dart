import 'package:carilly1/Databases/dbhelper.dart';
import 'package:flutter/material.dart';
// Import your DBhelper class

class ProfilePageC extends StatefulWidget {
  final Map<String, dynamic>? userInfo;

  const ProfilePageC({Key? key, this.userInfo}) : super(key: key);

  @override
  State<ProfilePageC> createState() => _ProfilePageCState();
}

class _ProfilePageCState extends State<ProfilePageC> {
  late String agencyName;
  late DBhelper dbHelper;
  Map<String, dynamic>? agencyData;

  @override
  void initState() {
    super.initState();
    agencyName = widget.userInfo?['AgencyName'] ?? 'Unknown Agency';
    dbHelper = DBhelper();
    fetchAgencyDetails();
  }

  Future<void> fetchAgencyDetails() async {
    // Query to fetch agency details using the agency name
    String sql = "SELECT * FROM Agency WHERE name = '$agencyName'";
    List<Map> result = await dbHelper.ReadData(sql);

    if (result.isNotEmpty) {
      setState(() {
        agencyData = Map<String, dynamic>.from(result.first); // Get the first result
      });
    } else {
      print("No data found for agency: $agencyName");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.04),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Row(
              children: [
                SizedBox(width: size.width * 0.1),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(size.width * 0.2),
                  ),
                  height: size.width * 0.2,
                  width: size.width * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size.width * 0.2),
                    child: agencyData != null && agencyData!['commerce_reg_url'] != null
                        ? Image.network(
                      agencyData!['commerce_reg_url'],
                      fit: BoxFit.cover,
                    )
                        : Icon(Icons.image_not_supported, size: size.width * 0.1),
                  ),
                ),
                SizedBox(width: size.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      agencyData != null ? agencyData!['name'] ?? "No Name" : "Loading...",
                      style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      agencyData != null ? agencyData!['contact'] ?? "No Contact" : "Loading...",
                      style: TextStyle(
                        fontSize: size.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Divider(
              endIndent: size.width * 0.1,
              indent: size.width * 0.05,
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: size.height * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.edit_document, size: size.width * 0.06),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        "Edit Profile",
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: size.width * 0.04,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            // Add more sections like Support, Settings, etc., similar to Edit Profile
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: size.height * 0.10, // Adjust this value to move the button up or down
            left: 60, // Position the button in the bottom-right corner
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addCarForm');
              },
              child: Icon(Icons.add, color: Colors.white),
              backgroundColor: Color(0xFF192252),
            ),
          ),
        ],
      ),
    );
  }
}
