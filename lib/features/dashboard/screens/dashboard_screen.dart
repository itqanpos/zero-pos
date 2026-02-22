import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: GridView.count(
        crossAxisCount: 2,
        children: const [
          Card(child: Center(child: Text("Products"))),
          Card(child: Center(child: Text("Sales"))),
          Card(child: Center(child: Text("Customers"))),
          Card(child: Center(child: Text("Reports"))),
        ],
      ),
    );
  }
}
