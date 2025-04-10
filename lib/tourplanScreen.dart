import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'globalColors.dart';

class TourPlanScreen extends StatefulWidget {
  const TourPlanScreen({Key? key}) : super(key: key);

  @override
  State<TourPlanScreen> createState() => _WeeklyTourPlanPageState();
}

class _WeeklyTourPlanPageState extends State<TourPlanScreen> {
  DateTime selectedDate = DateTime.now();
  String? selectedTourType;
  String? selectedWorkType;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.white,
              onPrimary: Color(0xFF1A1B25),
              surface: Color(0xFF282935),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: const Color(0xFF1A1B25),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  String _getDayName() {
    return DateFormat('EEEE').format(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1B25),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1B25),
        elevation: 0,
        title: Text(
          'Weekly Tour Plan',
          style: TextStyle(
            color: textColorLight,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: iconColorLight),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: iconColorLight),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Play Day'),
            const SizedBox(height: 8),
            _buildDaySelector(context),
            const SizedBox(height: 24),

            _buildLabel('Tour Type'),
            const SizedBox(height: 8),
            _buildDropdown(
              value: selectedTourType,
              hint: 'Select your tour type',
              onChanged: (value) {
                setState(() {
                  selectedTourType = value;
                });
              },
            ),
            const SizedBox(height: 24),

            _buildLabel('Work Type'),
            const SizedBox(height: 8),
            _buildDropdown(
              value: selectedWorkType,
              hint: 'Select your work type',
              onChanged: (value) {
                setState(() {
                  selectedWorkType = value;
                });
              },
            ),

            const Spacer(),
            _buildSubmitButton(),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 16,
          color: borderColor,
          margin: const EdgeInsets.only(right: 8),
        ),
        Text(
          title,
          style: TextStyle(
            color: textColorLight,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDaySelector(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: dropDownColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.calendar_today, color: iconColorLight, size: 20),
            const SizedBox(width: 8),
            Text(
              _getDayName(),
              style: TextStyle(
                color: textColorLight,
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_drop_down, color: textColorLight),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: textColorLight,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildDropdown({
    required String? value,
    required String hint,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: dropDownColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: TextStyle(color:boxColorGrey),
          ),
          isExpanded: true,
          dropdownColor: dropDownColor,
          icon: Icon(Icons.arrow_drop_down, color: iconColorLight),
          style: TextStyle(color: textColorLight),
          onChanged: onChanged,
          items: ['Option 1', 'Option 2', 'Option 3']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          })
              .toList(),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle submit action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: dropDownColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          'Submit',
          style: TextStyle(
            color: textColorLight,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: dropDownColor,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(Icons.home, 'Home', false),
          _buildBottomNavItem(Icons.business, 'Report', false),
          _buildBottomNavItem(Icons.person, 'My Profile', false),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, bool isSelected) {
    return Column(
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
    );
  }
}