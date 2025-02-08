import 'package:flutter/material.dart';
import 'package:carilly1/Databases/dbhelper.dart';

class ProfilePageC extends StatefulWidget {
  final Map<String, dynamic>? userInfo;

  const ProfilePageC({super.key, this.userInfo});

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
    String sql = "SELECT * FROM Agency WHERE name = '$agencyName'";
    List<Map> result = await dbHelper.ReadData(sql);
    if (result.isNotEmpty) {
      setState(() {
        agencyData = Map<String, dynamic>.from(result.first);
      });
    } else {
      print("No data found for agency: $agencyName");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: agencyData != null && agencyData!['commerce_reg_url'] != null
                  ? NetworkImage(agencyData!['commerce_reg_url'])
                  : AssetImage("assets/default_profile.png") as ImageProvider,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              agencyData != null ? agencyData!['name'] ?? "No Name" : "Loading...",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              agencyData != null ? agencyData!['contact'] ?? "No Contact" : "Loading...",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          SizedBox(height: 30),
          ListTile(
            leading: Icon(Icons.edit, color: Colors.black),
            title: Text("Edit Profile", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, '/Editprofile'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.support_agent, color: Colors.black),
            title: Text("Support", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, '/SupportPage'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text("Settings", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, '/SettingsPage'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text("Requests", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => Navigator.pushNamed(context, '/Req_box'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.black),
            title: Text("Add Car", style: TextStyle(fontSize: 16)),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () =>Navigator.pushNamed(context, '/addCarForm'),
          ),
          SizedBox(height: 100,)
        ],
      ),

    );
  }
}
