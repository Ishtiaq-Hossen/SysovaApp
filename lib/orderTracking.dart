import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191A22),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF191A22),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Orders Tracking',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text(
              'Progress Bar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: 0.8,
                backgroundColor: Colors.white,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Color(0xFF4C5EFF)),
                minHeight: 10,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 4),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '80%',
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Status Cards
          _buildStatusCard(
            icon: Icons.hourglass_empty,
            title: 'Pending',
            subtitle: 'Your order is still pending',
            isCompleted: true,
          ),
          _buildStatusCard(
            icon: Icons.person_2,
            title: 'Approved',
            subtitle: 'Your order has been approved',
            isCompleted: true,
          ),
          _buildStatusCard(
            icon: Icons.description_outlined,
            title: 'Invoiced',
            subtitle: 'Your order invoice has been created',
            isCompleted: true,
          ),
          _buildStatusCard(
            icon: Icons.local_shipping_outlined,
            title: 'Full Delivery',
            subtitle: 'Your order has been fully delivered',
            isCompleted: false,
            isLast: true,
          ),
          const Spacer(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, '/tracking'),
    );
  }

  Widget _buildStatusCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isCompleted,
    bool isLast = false,
    Color? iconColor, // New parameter for icon color
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF292B3E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isCompleted
                  ? Colors.blue.withOpacity(0.1)
                  : Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor ?? (isCompleted ? Colors.white : Colors.grey),
              // Apply custom color or default
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isCompleted ? Colors.white : Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if (isCompleted)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Colors.black,
                size: 20,
              ),
            ),
        ],
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
