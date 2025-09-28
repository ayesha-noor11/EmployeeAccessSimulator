import 'package:flutter/material.dart';
import '../data/employees.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Access Simulator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Employees List",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: employees.length,
                itemBuilder: (context, index) {
                  final emp = employees[index];
                  return ListTile(
                    title: Text(emp.id),
                    subtitle: Text(
                        'Level: ${emp.accessLevel}, Room: ${emp.room}, Time: ${emp.requestTime}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print("Simulate Access button clicked");
              },
              child: const Text('Simulate Access Button'),
            ),
          ],
        ),
      ),
    );
  }
}
