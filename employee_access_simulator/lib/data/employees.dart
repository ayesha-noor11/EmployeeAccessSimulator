class Employee {
  final String id;
  final int accessLevel;
  final String requestTime;
  final String room;

  Employee({
    required this.id,
    required this.accessLevel,
    required this.requestTime,
    required this.room,
  });
}

// Sample employee data
final List<Employee> employees = [
  Employee(id: "EMP001", accessLevel: 2, requestTime: "09:15", room: "ServerRoom"),
  Employee(id: "EMP002", accessLevel: 1, requestTime: "09:30", room: "Vault"),
  Employee(id: "EMP003", accessLevel: 3, requestTime: "10:05", room: "ServerRoom"),
  Employee(id: "EMP004", accessLevel: 3, requestTime: "09:45", room: "Vault"),
  Employee(id: "EMP005", accessLevel: 2, requestTime: "08:50", room: "R&D Lab"),
  Employee(id: "EMP006", accessLevel: 1, requestTime: "10:10", room: "R&D Lab"),
  Employee(id: "EMP007", accessLevel: 2, requestTime: "10:18", room: "ServerRoom"),
  Employee(id: "EMP008", accessLevel: 3, requestTime: "09:55", room: "Vault"),
  Employee(id: "EMP001", accessLevel: 2, requestTime: "09:28", room: "ServerRoom"),
  Employee(id: "EMP006", accessLevel: 1, requestTime: "10:15", room: "R&D Lab"),
];
