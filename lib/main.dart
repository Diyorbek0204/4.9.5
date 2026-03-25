import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebDashboardScreen(),
    );
  }
}

class WebDashboardScreen extends StatefulWidget {
  const WebDashboardScreen({super.key});

  @override
  State<WebDashboardScreen> createState() => _WebDashboardScreenState();
}

class _WebDashboardScreenState extends State<WebDashboardScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(width: 8),
            Container(
              color: Colors.blue[800],
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: const Text(
                'SAP',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'Home',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Expanded(
                child: NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  labelType: NavigationRailLabelType.all,
                  backgroundColor: Colors.white,
                  leading: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0, top: 8.0),
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: Colors.blueAccent,
                      onPressed: () {},
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                  selectedLabelTextStyle: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  unselectedLabelTextStyle: const TextStyle(color: Colors.black54),
                  selectedIconTheme: const IconThemeData(color: Colors.blueAccent),
                  unselectedIconTheme: const IconThemeData(color: Colors.black54),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.home_outlined),
                      selectedIcon: Icon(Icons.home),
                      label: Text('Home'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.inbox_outlined),
                      selectedIcon: Icon(Icons.inbox),
                      label: Text('Inbox'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.checklist_rtl_outlined),
                      selectedIcon: Icon(Icons.checklist_rtl),
                      label: Text('To Do'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.shopping_basket_outlined),
                      selectedIcon: Icon(Icons.shopping_basket),
                      label: Text('Basket'),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 24.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
                ),
              )
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1, color: Colors.black12),
          Expanded(
            child: _getSelectedPage(_selectedIndex),
          ),
        ],
      ),
    );
  }

  Widget _getSelectedPage(int index) {
    switch (index) {
      case 0:
        return _buildMainContent();
      case 1:
        return const Center(
            child: Text('Inbox', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black54)));
      case 2:
        return const Center(
            child: Text('To Do', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black54)));
      case 3:
        return const Center(
            child: Text('Basket', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black54)));
      default:
        return const Center(
            child: Text('Not Found', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black54)));
    }
  }

  Widget _buildMainContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: _buildTopCard('Total Revenue', '\$45,231', Colors.blue.shade50)),
              const SizedBox(width: 24),
              Expanded(child: _buildTopCard('Active Users', '2,405', Colors.green.shade50)),
              const SizedBox(width: 24),
              Expanded(child: _buildTopCard('Open Tickets', '34', Colors.orange.shade50)),
            ],
          ),
          const SizedBox(height: 48),
          const Text(
            'Recent Transactions',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 24),
          _buildListRow('Invoice #0098', 'Acme Corporation', '\$1,200.00', 'Completed'),
          const Divider(color: Colors.black12, height: 32),
          _buildListRow('Invoice #0099', 'Global Tech', '\$3,450.00', 'Pending'),
          const Divider(color: Colors.black12, height: 32),
          _buildListRow('Invoice #0100', 'Stark Industries', '\$12,500.00', 'Completed'),
          const Divider(color: Colors.black12, height: 32),
          _buildListRow('Invoice #0101', 'Wayne Enterprises', '\$8,900.00', 'Failed'),
          const SizedBox(height: 48),
          const Text(
            'Quick Shortcuts',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildQuickAccessBox(Icons.analytics_outlined, 'Analytics'),
              const SizedBox(width: 24),
              _buildQuickAccessBox(Icons.group_outlined, 'Customers'),
              const SizedBox(width: 24),
              _buildQuickAccessBox(Icons.account_balance_wallet_outlined, 'Finance'),
              const SizedBox(width: 24),
              _buildQuickAccessBox(Icons.settings_outlined, 'Settings'),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTopCard(String title, String value, Color color) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w500)),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildListRow(String id, String name, String amount, String status) {
    Color statusColor;
    switch (status) {
      case 'Completed':
        statusColor = Colors.green;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Failed':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: Text(id, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        Expanded(flex: 3, child: Text(name, style: const TextStyle(fontSize: 16, color: Colors.black87))),
        Expanded(flex: 2, child: Text(amount, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600))),
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: TextStyle(color: statusColor, fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickAccessBox(IconData icon, String label) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: Colors.black87),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black87)),
        ],
      ),
    );
  }
}