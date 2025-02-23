import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: const Color(0xFF191A22), // Dark background
      appBar: AppBar(
        backgroundColor: const Color(0xFF191A22), // Slightly lighter for visibility
        title: const Text("Weekly Tour Plan"),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white), // Ensures back button is white
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Play Day Row
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF292B3E),
                borderRadius: BorderRadius.circular(8),
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
                        color: Colors.red, // Color of the bar
                      ),
                      // "Play Day" text
                      const Text(
                        "Play Day",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(

                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white, // White outline color
                        width: 1,// Outline thickness
                      ),
                      borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
                    ),
                    padding: const EdgeInsets.all(8), //
                    child: DropdownButton<String>(

                      value: selectedDay,
                      icon: const Icon(Icons.calendar_month, color: Colors.white),
                      dropdownColor: const Color(0xFF191A22),
                      style: const TextStyle(color: Colors.white),
                      underline: const SizedBox(), // Remove the default underline
                      onChanged: (newValue) {
                        setState(() => selectedDay = newValue!);
                      },
                      items: days.map((day) {
                        return DropdownMenuItem(
                          value: day,
                          child: Text(day, style: const TextStyle(color: Colors.white)),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tour Type Dropdown
            const Text("Tour Type", style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 10),
            _buildDropdown("Select your tour type", tourTypes, selectedTourType, (value) {
              setState(() => selectedTourType = value);
            }),
            const SizedBox(height: 16),

            // Work Type Dropdown
            const Text("Work Type", style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 5),
            _buildDropdown("Select your work type", workTypes, selectedWorkType, (value) {
              setState(() => selectedWorkType = value);
            }),
            const SizedBox(height: 150),
            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF292B3E),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {},
                child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: _buildBottomNavigationBar(context, '/tr'),
    );
  }

  // Custom Dropdown Builder
  Widget _buildDropdown(String hint, List<String> items, String? selectedValue, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF191A22),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(hint, style: const TextStyle(color: Colors.grey)),
          dropdownColor: const Color(0xFF292B3E),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
          isExpanded: true,
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
        ),
      ),
    );
  }
  Widget _buildBottomNavigationBar(BuildContext context, String currentRoute) {
    return Container(
      color: const Color(0xFF282935),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(
            context,
            Icons.home,
            'Home',
            '/dashboard', // Route for Home
            currentRoute == '/', // Check if selected
          ),
          _buildBottomNavItem(
            context,
            Icons.business,
            'Report',
            '/reports', // Route for Report
            currentRoute == '/', // Check if selected
          ),
          _buildBottomNavItem(
            context,
            Icons.person,
            'Profile',
            '/', // Route for Profile
            currentRoute == '/', // Check if selected
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(BuildContext context, IconData icon, String label,
      String route, bool isSelected) {
    return GestureDetector(
      onTap: () {
        if(route=='/dashboard')
          Navigator.pushNamedAndRemoveUntil(context, route, (route)=>false);
        else if(route=='/reports'){
          Navigator.pushReplacementNamed(context, route);
        }
        else
          Navigator.pushNamed(context, route);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.white : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
