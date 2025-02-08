import 'package:carilly1/Databases/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddCarForm extends StatefulWidget {
  @override
  _AddCarFormState createState() => _AddCarFormState();
}

class _AddCarFormState extends State<AddCarForm> {
  List<File> _selectedImages = []; // A list to store multiple selected images.
  final ImagePicker _picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();

  // Form fields
  String carName = '';
  String brand = '';
  String model = '';
  String pricePerDay = '';
  String gas = '';
  String year = '';
  String kilometers = '';
  String seats = '';

  DBhelper dbHelper = DBhelper();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImages.add(File(pickedFile.path)); // Add the selected image to the list.
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index); // Remove image at the specified index.
    });
  }

  Future<void> _saveCar() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Insert car details into the database
      String sql = '''
        INSERT INTO Car (name, brand, model, year, price_per_day, status, description)
        VALUES ('$carName', '$brand', '$model', $year, $pricePerDay, 'available', 'Gas: $gas, Kilometers: $kilometers, Seats: $seats');
      ''';

      int carId = await dbHelper.Insert(sql);

      if (carId != -1) {
        // Insert car images into the database
        for (File image in _selectedImages) {
          String imagePath = image.path; // Get the file path
          String imageSql = '''
            INSERT INTO CarImage (car_id, image_url)
            VALUES ($carId, '$imagePath');
          ''';
          await dbHelper.Insert(imageSql);
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Car added successfully!')),
        );
        Navigator.pop(context); // Go back after saving
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to add car.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add a Car',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upload Images Section
                _buildImagePicker(screenHeight),
                SizedBox(height: 20),
                // Add Car Information Section
                _buildCarInfoForm(),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _saveCar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF140C47),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.3, vertical: 15),
                    ),
                    child: Text(
                      'Add Car',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePicker(double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upload Images',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10),
        _selectedImages.isNotEmpty
            ? SizedBox(
          height: screenHeight * 0.2,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: _selectedImages.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.file(
                      _selectedImages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: () => _removeImage(index),
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        )
            : Container(
          height: screenHeight * 0.2,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFF140C47)),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'No Images Selected',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: Icon(Icons.photo_library, color: Colors.white),
              label: Text('Gallery', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF140C47),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: Icon(Icons.camera_alt, color: Colors.white),
              label: Text('Camera', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF140C47),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCarInfoForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: 'Car Name',
          icon: Icons.car_rental,
          onSaved: (value) => carName = value!,
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: 'Brand',
                icon: Icons.car_repair_rounded,
                onSaved: (value) => brand = value!,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: CustomTextField(
                label: 'Model',
                icon: Icons.car_repair_rounded,
                onSaved: (value) => model = value!,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        CustomTextField(
          label: 'Price/Day',
          icon: Icons.attach_money_outlined,
          onSaved: (value) => pricePerDay = value!,
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: 'Gas',
                icon: Icons.oil_barrel,
                onSaved: (value) => gas = value!,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: CustomTextField(
                label: 'Year',
                icon: Icons.calendar_month,
                onSaved: (value) => year = value!,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: 'Kilometers',
                icon: Icons.electric_meter,
                onSaved: (value) => kilometers = value!,
              ),
            ),
            SizedBox(width: 15),
            Expanded(
              child: CustomTextField(
                label: 'Seats',
                icon: Icons.event_seat_rounded,
                onSaved: (value) => seats = value!,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final FormFieldSetter<String>? onSaved;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.icon,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Color(0xFF140C47)),
        ),
      ),
      onSaved: onSaved,
    );
  }
}
