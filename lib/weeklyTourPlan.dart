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
  final List<String> tourTypes = ["Business", "Leisure", "Adventure"];
  final List<String> workTypes = ["Field Work", "Office Work", "Remote Work"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Dark background
      appBar: AppBar(
        backgroundColor: const Color(0xFF181818), // Slightly lighter for visibility
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF282838),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Text("Play Day", style: TextStyle(color: Colors.white, fontSize: 16)),
                  const Spacer(),
                  DropdownButton<String>(
                    value: selectedDay,
                    icon: const Icon(Icons.calendar_today, color: Colors.white),
                    dropdownColor: const Color(0xFF282838),
                    style: const TextStyle(color: Colors.white),
                    underline: const SizedBox(),
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
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tour Type Dropdown
            const Text("Tour Type", style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),
            _buildDropdown("Select your tour type", tourTypes, selectedTourType, (value) {
              setState(() => selectedTourType = value);
            }),
            const SizedBox(height: 16),

            // Work Type Dropdown
            const Text("Work Type", style: TextStyle(color: Colors.white, fontSize: 16)),
            const SizedBox(height: 8),
            _buildDropdown("Select your work type", workTypes, selectedWorkType, (value) {
              setState(() => selectedWorkType = value);
            }),
            const SizedBox(height: 32),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E2E3A),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF181818),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Report"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Profile"),
        ],
      ),
    );
  }

  // Custom Dropdown Builder
  Widget _buildDropdown(String hint, List<String> items, String? selectedValue, ValueChanged<String?> onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF282838),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          hint: Text(hint, style: const TextStyle(color: Colors.grey)),
          dropdownColor: const Color(0xFF282838),
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
}
