import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RequestsScreen(),
    );
  }
}

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  // Sample data
  List<Map<String, String>> requests = [
    {"name": "John Doe", "phone": "123-456-7890", "car": "Toyota Corolla"},
    {"name": "Jane Smith", "phone": "987-654-3210", "car": "Honda Civic"},
    {"name": "Alice Johnson", "phone": "555-123-4567", "car": "Ford Focus"},
    {"name": "Bob Williams", "phone": "444-987-6543", "car": "Chevy Malibu"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Received Requests')),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.blue),
              title: Text(request["name"] ?? "Unknown"),
              subtitle: Text("Phone: ${request["phone"]}\nCar: ${request["car"]}"),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
