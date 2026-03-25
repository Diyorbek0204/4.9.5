import 'package:flutter/material.dart';
import 'top_card.dart';
import 'transaction_list_row.dart';
import 'quick_access_box.dart';

class DashboardMainContent extends StatelessWidget {
  const DashboardMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: TopCard(title: 'Total Revenue', value: '\$45,231', color: Colors.blue.shade50)),
              const SizedBox(width: 24),
              Expanded(child: TopCard(title: 'Active Users', value: '2,405', color: Colors.green.shade50)),
              const SizedBox(width: 24),
              Expanded(child: TopCard(title: 'Open Tickets', value: '34', color: Colors.orange.shade50)),
            ],
          ),
          const SizedBox(height: 48),
          const Text(
            'Recent Transactions',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 24),
          const TransactionListRow(id: 'Invoice #0098', name: 'Acme Corporation', amount: '\$1,200.00', status: 'Completed'),
          const Divider(color: Colors.black12, height: 32),
          const TransactionListRow(id: 'Invoice #0099', name: 'Global Tech', amount: '\$3,450.00', status: 'Pending'),
          const Divider(color: Colors.black12, height: 32),
          const TransactionListRow(id: 'Invoice #0100', name: 'Stark Industries', amount: '\$12,500.00', status: 'Completed'),
          const Divider(color: Colors.black12, height: 32),
          const TransactionListRow(id: 'Invoice #0101', name: 'Wayne Enterprises', amount: '\$8,900.00', status: 'Failed'),
          const SizedBox(height: 48),
          const Text(
            'Quick Shortcuts',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              QuickAccessBox(icon: Icons.analytics_outlined, label: 'Analytics'),
              SizedBox(width: 24),
              QuickAccessBox(icon: Icons.group_outlined, label: 'Customers'),
              SizedBox(width: 24),
              QuickAccessBox(icon: Icons.account_balance_wallet_outlined, label: 'Finance'),
              SizedBox(width: 24),
              QuickAccessBox(icon: Icons.settings_outlined, label: 'Settings'),
            ],
          )
        ],
      ),
    );
  }
}