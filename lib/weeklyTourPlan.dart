import 'package:flutter/material.dart';

import 'globalColors.dart';

void main() {
  runApp(const MaterialApp(home: WeeklyTourPlanScreen()));
}

class WeeklyTourPlanScreen extends StatefulWidget {
  const WeeklyTourPlanScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyTourPlanScreen> createState() => _WeeklyTourPlanScreenState();
}

class _WeeklyTourPlanScreenState extends State<WeeklyTourPlanScreen> {
  String selectedDay = "Thursday";
  String? selectedTourType;
  String? selectedWorkType;

  final List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
  final List<String> tourTypes = ["Dealer contact", "Retailer contact", "Agricultural office visit","Farmer meeting","Field visit"];
  final List<String> workTypes = ["Field Work", "Office Work", "Remote Work"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        // backgroundColor: const Color(0xFF191A22), // Dark background
        appBar: AppBar(
          backgroundColor: ScaffholdColor, // Slightly lighter for visibility
          title: const Text("Weekly Tour Plan"),
          centerTitle: true,
          iconTheme: IconThemeData(color: iconColorLight), // Ensures back button is white
          titleTextStyle: TextStyle(color: textColorLight, fontSize: 18, fontWeight: FontWeight.w500),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),

        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Play Day Row
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: cardColorLight,
                  borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color:iconColorDark,
                        blurRadius: 5.0,
                      ),
                    ]
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        // Red bar
                        Container(
                          width: 4, // Width of the red bar
                          height: 20, // Height of the red bar (matches text height)
                          margin: const EdgeInsets.only(right: 8), // Space between the bar and text
                          color: borderColor, // Color of the bar
                        ),
                        // "Play Day" text
                        Text(
                          "Play Day",
                          style: TextStyle(color: textColorDark, fontSize: 16,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(

                      // decoration: BoxDecoration(
                      //   // border: Border.all(
                      //   //   color: Colors.b, // White outline color
                      //   //   width: 1,// Outline thickness
                      //   // ),
                      //   borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
                      // ),
                      padding: const EdgeInsets.all(8), //
                      child: DropdownButton<String>(
                        value: selectedDay,
                        icon: Icon(Icons.calendar_month, color: textColorDark),
                        dropdownColor: dropDownColor2,
                        style: TextStyle(color: textColorDark),
                        underline: const SizedBox(), // Remove the default underline
                        onChanged: (newValue) {
                          setState(() => selectedDay = newValue!);
                        },
                        items: days.map((day) {
                          return DropdownMenuItem(
                            value: day,
                            child: Text(day, style: TextStyle(color: textColorDark)),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Tour Type Dropdown
              Text("Tour Type", style: TextStyle(color: textColorDark, fontSize: 16,fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              _buildDropdown("Select your tour type", tourTypes, selectedTourType, (value) {
                setState(() => selectedTourType = value);
              }),
              const SizedBox(height: 16),

              // Work Type Dropdown
              Text("Work Type", style: TextStyle(color: textColorDark, fontSize: 16,fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              _buildDropdown("Select your work type", workTypes, selectedWorkType, (value) {
                setState(() => selectedWorkType = value);
              }),
              const SizedBox(height: 30),
              // Submit Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ScaffholdColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () {},
                  child: Text("Submit", style: TextStyle(color: textColorLight, fontSize: 16,fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  // Custom Dropdown Builder
  Widget _buildDropdown(String hint, List<String> items, String? selectedValue, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: cardColorLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(hint, style: TextStyle(color: textColorDark)),
          dropdownColor: cardColordark,
          icon: Icon(Icons.arrow_drop_down, color: boxColor),
          isExpanded: true,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: TextStyle(color: textColorDark)),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: borderColor, // Border color
            width: 5, // Border width
          ),
          // You can omit the other sides if you want no borders on them
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide.none,
        ),
        // color: const Color(0xFFE3CECE),
        borderRadius: BorderRadius.circular(30),
      ),
      // color: const Color(0xFFE3CECE),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(
            context,
            'assets/images/icons/home.png', // Path to the image asset
            'Home',
            '/dashboard', // Example route for Home screen
            true, // Is selected
          ),
          _buildBottomNavItem(
            context,
            'assets/images/icons/report.png', // Path to the image asset
            'Report',
            '/reports', // Example route for Report screen
            false, // Not selected
          ),
          _buildBottomNavItem(
            context,
            'assets/images/icons/profile.png', // Pth to the image asset
            'Profile',
            '/', // Example route for Profile screen
            false, // Not selected
          ),
        ],
      ),
    );
  }

  /*Here buildBottomNavItem is a custom widget that is build for buildNavigation bar */

  Widget _buildBottomNavItem(BuildContext context, String imagePath,
      String label, String route, bool isSelected) {
    return GestureDetector(
      onTap: () {
        // For other routes, use Navigator.pushNamed
        if (route == '/dashboard')
          Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
        else if (route == '/reports') {
          Navigator.pushReplacementNamed(context, route);
        } else
          _showMyDialog();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            // color: isSelected ? Colors.white : Colors.grey, // Change image color for selection
            width: 35, // Set width for image
            height: 35, // Set height for image
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              //color: isSelected ? Colors.white : Colors.grey,
                color: textColorDark,
                fontSize: 14,
                fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // icon: Icon(Icons.add_alert, size: 60,),
          // iconColor: Color(0xFFea5a5a),
          title: const Text(
            '🚨 Missing Requirements!',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('⚠️  It looks like you\'ve provided a design without specifying any requirements. To ensure we build exactly what you need, please share details like functionality, features, and any specific preferences.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay Understand'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
