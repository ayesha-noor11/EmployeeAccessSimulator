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

class Room {
  final String name;
  final int minAccessLevel;
  final String openTime;
  final String closeTime;
  final int cooldownMinutes;

  Room({
    required this.name,
    required this.minAccessLevel,
    required this.openTime,
    required this.closeTime,
    required this.cooldownMinutes,
  });
}

class AccessResult {
  final String id;
  final bool granted;
  final String reason;

  AccessResult({
    required this.id,
    required this.granted,
    required this.reason,
  });
}
