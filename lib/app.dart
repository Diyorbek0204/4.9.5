import 'package:flutter/material.dart';
import 'features/dashboard/presentation/pages/web_dashboard_screen.dart';

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
