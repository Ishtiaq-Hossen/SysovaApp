import 'package:flutter/material.dart';
import 'package:hella/dashboardScreen.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191A22),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF191A22),
        elevation: 0,
        title: const Text(
          'Report',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (Navigator.canPop(context)) {
              print("Hobe na dada ${Navigator.canPop(context)} \n ==========");
              Navigator.pop(context);
            } else {
              print("Hobe dada ${Navigator.canPop(context)} \n ==========");
              Navigator.pushReplacementNamed(context, '/dashboard');
            }
          }
        ),
        // actions: const [Icon(Icons.more_vert)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1,
              children: [
                _buildReportCard(
                  icon: Icons.person_3_sharp,
                  label: 'Attendance',
                  onTap: () {
                    Navigator.pushNamed(context, '/attendance_report'); //
                  },
                ),
                _buildReportCard(
                  icon: Icons.receipt_long,
                  label: 'Order',
                  onTap: () {
                    Navigator.pushNamed(context, '/order_summary');
                  },
                ),
                _buildReportCard(
                  icon: Icons.description,
                  label: 'Collection',
                  onTap: () {},
                ),
                _buildReportCard(
                  icon: Icons.shopping_cart,
                  label: 'Stock',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, '/reports'),
    );
  }

  Widget _buildReportCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF292B3E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
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
            currentRoute == '/reports', // Check if selected
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
