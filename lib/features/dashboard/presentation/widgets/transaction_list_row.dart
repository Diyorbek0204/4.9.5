import 'package:flutter/material.dart';

class TransactionListRow extends StatelessWidget {
  final String id;
  final String name;
  final String amount;
  final String status;

  const TransactionListRow({
    super.key,
    required this.id,
    required this.name,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
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
}
