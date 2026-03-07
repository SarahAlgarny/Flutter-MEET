// import 'package:shared_preferences/shared_preferences.dart';

// class StreakManager {
//   static const int weeks = 5;

//   static Future<List<int>> getMonthlyFires() async {
//     final prefs = await SharedPreferences.getInstance();

//     int currentMonth = DateTime.now().month;
//     int savedMonth = prefs.getInt("savedMonth") ?? -1;

//     if (savedMonth != currentMonth) {
//       await prefs.setInt("savedMonth", currentMonth);
//       await prefs.setStringList(
//         "monthlyFires",
//         List.generate(weeks, (_) => "0"),
//       );
//     }

//     List<String>? fires = prefs.getStringList("monthlyFires");

//     if (fires == null) {
//       fires = List.generate(weeks, (_) => "0");
//       await prefs.setStringList("monthlyFires", fires);
//     }

//     return fires.map((e) => int.parse(e)).toList();
//   }

//   static int getCurrentWeek() {
//     int day = DateTime.now().day;
//     return ((day - 1) ~/ 7);
//   }

//   static Future<void> confirmYes() async {
//     final prefs = await SharedPreferences.getInstance();

//     List<int> fires = await getMonthlyFires();

//     int week = getCurrentWeek();

//     fires[week] = 1;

//     await prefs.setStringList(
//       "monthlyFires",
//       fires.map((e) => e.toString()).toList(),
//     );

//     int total = prefs.getInt("totalStreak") ?? 0;

//     total++;

//     await prefs.setInt("totalStreak", total);

//     await prefs.setInt("skipCount", 0);
//   }

//   static Future<void> confirmSkip() async {
//     final prefs = await SharedPreferences.getInstance();

//     int skip = prefs.getInt("skipCount") ?? 0;

//     skip++;

//     if (skip >= 2) {
//       await prefs.setInt("totalStreak", 0);
//       skip = 0;
//     }

//     await prefs.setInt("skipCount", skip);
//   }

//   static Future<int> getTotalStreak() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getInt("totalStreak") ?? 0;
//   }
// }
