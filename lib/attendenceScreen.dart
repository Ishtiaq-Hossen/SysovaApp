import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hella/globalColors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  @override
  State<AttendanceScreen> createState() => _DailyAttendanceScreenState();
}

class _DailyAttendanceScreenState extends State<AttendanceScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        setState(() {
          _imageFile = File(photo.path);
        });
      }
    } catch (e) {
      print('Error taking photo: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFF1F1F1F),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ScaffholdColor,
          leading: BackButton(color: textColorLight),
          title: Text(
            'Daily Attendance',
            style: TextStyle(color: textColorLight,fontSize: 18,
              fontWeight: FontWeight.w500,),
          ),
          elevation: 0,
        ),
        body: Column(
          children: [
            // Map Section
            Container(
              margin: EdgeInsets.all(10),
              child: SizedBox(
                height: 180,
                child: GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(23.7385, 90.3782), // Kazi Farm lat lon
                    zoom: 15,
                  ),
                  markers: {
                    const Marker(
                      markerId: MarkerId('Kazi Farms'),
                      position: LatLng(23.7385, 90.3782),
                    ),
                  },
                  // mapToolbarEnabled: true,
                  zoomControlsEnabled: true,
                  mapType: MapType.normal,
                ),
              ),
            ),
      
            // Date and Time
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      '21-Nov-2024',
                      style: TextStyle(
                        color: textColorDark,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Text(
                      '1:20 PM',
                      style: TextStyle(
                        color: textColorDark,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      
            // Image Display/Placeholder
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: greyColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: _imageFile != null
                  ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  _imageFile!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              )
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                    'assets/images/icons/profile.png', // Replace with your actual image path
                    width: 100, // Adjust width as needed
                    height: 100, // Adjust height as needed
                    fit: BoxFit.cover, // Adjust fit as needed
                  ),
                SizedBox(height: 5,),
                Text('Take a photo',style: TextStyle(fontWeight: FontWeight.bold),),]
              ),
      
            ),),
      
            // Camera Button
            TextButton(
              onPressed: _takePhoto,
              style: TextButton.styleFrom(
                backgroundColor: buttonBlue, // Change to your desired color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Adjust as needed
                ),
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4), // Adjust for clipping effect
                    child: Image.asset(
                      'assets/images/icons/camera.png', // Replace with your image path
                      width: 24, // Adjust size
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8), // Space between image and text
                  Text(
                    'Capture',
                    style: TextStyle(
                      color: textColorLight, // Adjust color for visibility
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
      
      
            const Spacer(),
      
            // Punch Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonGreeen,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'PUNCH IN',
                        style: TextStyle(
                          color: textColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: borderColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'PUNCH OUT',
                        style: TextStyle(
                          color: textColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}