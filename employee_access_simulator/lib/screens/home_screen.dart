import 'package:flutter/material.dart';
import '../data/employees.dart';
import '../core/access_simulator.dart';
import '../models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<AccessResult>? results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Employee Access Simulator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Employees List Title
            const Text("Employees List",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            // Employees List
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

            // Simulate Access Button
            ElevatedButton(
              onPressed: () {
                final simulator = AccessSimulator();
                setState(() {
                  results = simulator.simulateAccess();
                });
              },
              child: const Text('Simulate Access'),
            ),

            const SizedBox(height: 16),

            // Display Results
            if (results != null) ...[
              const Text("Results",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Expanded(
                child: ListView.builder(
                  itemCount: results!.length,
                  itemBuilder: (context, index) {
                    final r = results![index];
                    return ListTile(
                      title: Text(r.id),
                      subtitle: Text('Status: ${r.granted ? 'Granted' : 'Denied'}\nReason: ${r.reason}'),
                      trailing: Icon(
                        r.granted ? Icons.check_circle : Icons.cancel,
                        color: r.granted ? Colors.green : Colors.red,
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
