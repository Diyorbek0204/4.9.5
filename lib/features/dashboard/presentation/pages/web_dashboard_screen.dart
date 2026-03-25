import 'package:flutter/material.dart';
import '../widgets/dashboard_main_content.dart';

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
        return const DashboardMainContent();
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
}
