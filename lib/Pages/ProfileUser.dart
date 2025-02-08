import 'package:carilly1/Databases/dbhelper.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  final Map<String, dynamic>? userInfo;

  const ProfilePage({Key? key, this.userInfo}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String userName;
  late DBhelper dbHelper;
  Map<String, dynamic>? userData;
  @override
  void initState() {
    super.initState();
    userName = widget.userInfo?['Name'] ?? 'Unknown User';
    dbHelper = DBhelper();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    // Query to fetch agency details using the agency name
    String sql = "SELECT * FROM user WHERE name = '$userName'";
    List<Map> result = await dbHelper.ReadData(sql);

    if (result.isNotEmpty) {
      setState(() {
        userData = Map<String, dynamic>.from(result.first); // Get the first result
      });
    } else {
      print("No data found for user: $userName");
    }
  }
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: size.height*0.04),
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Row(
              children: [
                SizedBox(width: size.width * 0.1),
                GestureDetector(
                  onTap: ()=>Navigator.pushNamed(context,'/logInPage'),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(size.width * 0.2),
                    ),
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(size.width * 0.2),
                      child: userData != null && userData!['user_url'] != null
                    ? Image.network(
                    userData!['user_url'],
                      fit: BoxFit.cover,
                    )
                          : Icon(Icons.image_not_supported, size: size.width * 0.1),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: ()=>Navigator.pushNamed(context,'/logInPage'),
                      child: Text(
                        userData != null ? userData!['name'] ?? "No Name" : "Loading...",
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    GestureDetector(
                      onTap:()=>Navigator.pushNamed(context,'/logInPage') ,
                      child: Text(
                        userData != null ? userData!['name'] ?? "No Name" : "Loading...",
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
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
                      Icon(Icons.headset_mic_rounded, size: size.width * 0.06),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        "Support",
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
                      Icon(Icons.settings, size: size.width * 0.06),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        "Settings",
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
                      Icon(Icons.logout, size: size.width * 0.06, color: Colors.red),
                      SizedBox(width: size.width * 0.02),
                      Text(
                        "Log Out",
                        style: TextStyle(
                          fontSize: size.width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {Navigator.pushNamed(context, '/typeOfUser');},
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: size.width * 0.04,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
