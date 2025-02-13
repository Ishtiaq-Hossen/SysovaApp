import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Daily Attendance',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Map Section
          SizedBox(
            height: 200,
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
              zoomControlsEnabled: true,
              mapType: MapType.normal,
            ),
          ),

          // Date and Time
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Text(
                    '21-Nov-2024',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Text(
                    '1:20 PM',
                    style: TextStyle(
                      color: Colors.white,
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
              color: Colors.grey[300],
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
                : const Center(
              child: Text(
                'Image',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black54,
                ),
              ),
            ),
          ),

          // Camera Button
          TextButton.icon(
            onPressed: _takePhoto,
            icon: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            label: const Text(
              'Capture',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
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
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'PUNCH IN',
                      style: TextStyle(
                        color: Colors.black,
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
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'PUNCH OUT',
                      style: TextStyle(
                        color: Colors.white,
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
    );
  }
}