# Employee Access Simulator

**Purpose:** Flutter mobile app to simulate employee access to secure rooms based on time, access level, and cooldown periods.

## Repo Layout
- `main` branch: only this README.md
- `dev` branch: full application code

## Overview
The app allows an HR/security manager to:
- Load a static list of employees with access levels, requested times, and rooms.
- Simulate access requests based on:
  - Employee access level
  - Room open/close times
  - Room-specific cooldown periods
- Display whether access is **Granted** or **Denied**, along with the reason.

## Features
1. **Employees List**  
   Displays all employees with their access level, requested room, and time.

2. **Simulate Access Button**  
   Runs the access logic when clicked.

3. **Results Display**  
   Shows simulation results for each employee with:
   - Status: Granted / Denied
   - Reason: e.g., "Access granted to ServerRoom" or "Denied: Below required level"

## Setup Instructions (dev branch)
```bash
git clone https://github.com/ayesha-noor11/EmployeeAccessSimulator.git
cd EmployeeAccessSimulator
git checkout dev
flutter pub get
flutter run
