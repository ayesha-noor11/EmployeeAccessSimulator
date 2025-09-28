import '../models/models.dart';
import '../data/employees.dart';

class AccessSimulator {
  final Map<String, Room> rooms = {
    "ServerRoom": Room(
        name: "ServerRoom",
        minAccessLevel: 2,
        openTime: "09:00",
        closeTime: "11:00",
        cooldownMinutes: 15),
    "Vault": Room(
        name: "Vault",
        minAccessLevel: 3,
        openTime: "09:00",
        closeTime: "10:00",
        cooldownMinutes: 30),
    "R&D Lab": Room(
        name: "R&D Lab",
        minAccessLevel: 1,
        openTime: "08:00",
        closeTime: "12:00",
        cooldownMinutes: 10),
  };

  final Map<String, Map<String, String>> lastAccessTimes = {};

  List<AccessResult> simulateAccess() {
    List<AccessResult> results = [];

    for (var emp in employees) {
      final room = rooms[emp.room];
      if (room == null) continue;

      final requestMinutes = _toMinutes(emp.requestTime);
      final openMinutes = _toMinutes(room.openTime);
      final closeMinutes = _toMinutes(room.closeTime);

      // 1. Access level check
      if (emp.accessLevel < room.minAccessLevel) {
        results.add(AccessResult(
            id: emp.id,
            granted: false,
            reason: "Below required level"));
        continue;
      }

      // 2. Time window check
      if (requestMinutes < openMinutes || requestMinutes > closeMinutes) {
        results.add(AccessResult(
            id: emp.id,
            granted: false,
            reason: "Outside room hours"));
        continue;
      }

      // 3. Cooldown check
      final lastAccess = lastAccessTimes[emp.id]?[emp.room];
      if (lastAccess != null) {
        final lastMinutes = _toMinutes(lastAccess);
        if (requestMinutes - lastMinutes < room.cooldownMinutes) {
          results.add(AccessResult(
              id: emp.id,
              granted: false,
              reason: "Cooldown not finished"));
          continue;
        }
      }

      // Granted
      lastAccessTimes.putIfAbsent(emp.id, () => {})[emp.room] = emp.requestTime;
      results.add(AccessResult(
          id: emp.id, granted: true, reason: "Access granted to ${emp.room}"));
    }

    return results;
  }

  int _toMinutes(String time) {
    final parts = time.split(":");
    return int.parse(parts[0]) * 60 + int.parse(parts[1]);
  }
}
