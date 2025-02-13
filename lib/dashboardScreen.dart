import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1B25),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1B25),
        title: const Text('SPL',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[700],
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Imtiaz Hossain',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'MO',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Plan & Attend Section
              _buildSectionTitle('Plan & Attend (PA)'),
              const SizedBox(height: 16),
              _buildGridSection([
                GridItem(Icons.calendar_today, 'Weekly\nplan'),
                GridItem(Icons.schedule, 'My\nSchedule'),
                GridItem(Icons.person_3_sharp, 'Attendance'),
                GridItem(Icons.exit_to_app, 'Leave\nRequest'),
              ]),

              const SizedBox(height: 24),

              // Sales & Collection Section
              _buildSectionTitle('Sales & Collection Activities (SCA)'),
              const SizedBox(height: 16),
              _buildGridSection([
                GridItem(Icons.note_add, 'Place Order'),
                GridItem(Icons.location_on, 'Track Order'),
                GridItem(Icons.article, 'Collection'),
              ]),

              const SizedBox(height: 24),

              // Dashboard Section
              _buildSectionTitle('Dash Board'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildDashboardCard(
                      'Order (Carton)',
                      '200',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildDashboardCard(
                      'Collection (BDT)',
                      '2,30,000',
                    ),
                  ),
                ],
              ),
            ],
          ),
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
          color: Colors.red,
          margin: const EdgeInsets.only(right: 8),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildGridSection(List<GridItem> items) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      childAspectRatio: 0.9,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: items.map((item) => _buildGridItem(item)).toList(),
    );
  }

  Widget _buildGridItem(GridItem item) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF282935),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF282935),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: const Color(0xFF282935),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(Icons.home, 'Home', true),
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

class GridItem {
  final IconData icon;
  final String title;

  GridItem(this.icon, this.title);
}