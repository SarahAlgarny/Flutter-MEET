//TUESDAY
// //perfect!!! KEEP THIS!
// import 'package:flutter/material.dart';
// import 'profile.dart';

// class HomePage extends StatefulWidget {
//   final String userName;

//   const HomePage({super.key, required this.userName});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<bool> monthlyFires = List.generate(4, (_) => false);
//   int currentMonth = DateTime.now().month;
//   int todayTuesdayIndex = -1;
//   bool popupShown = false;

//   @override
//   void initState() {
//     super.initState();
//     calculateTuesdayIndex();
//     checkForPopup();
//   }

//   void calculateTuesdayIndex() {
//     DateTime now = DateTime.now();
//     DateTime firstDay = DateTime(now.year, now.month, 1);

//     int count = 0;

//     for (int i = 0; i < now.day; i++) {
//       DateTime day = firstDay.add(Duration(days: i));

//       if (day.weekday == DateTime.tuesday) {
//         if (day.day == now.day) {
//           todayTuesdayIndex = count;
//         }
//         count++;
//       }
//     }
//   }

//   void checkForPopup() {
//     if (DateTime.now().weekday == DateTime.tuesday &&
//         todayTuesdayIndex != -1 &&
//         !monthlyFires[todayTuesdayIndex] &&
//         !popupShown) {
//       popupShown = true;

//       Future.delayed(Duration.zero, () {
//         showFirePopup(todayTuesdayIndex);
//       });
//     }
//   }

//   void markFireCompleted(int index) {
//     setState(() {
//       monthlyFires[index] = true;
//     });
//   }

//   void resetIfNewMonth() {
//     int monthNow = DateTime.now().month;

//     if (monthNow != currentMonth) {
//       currentMonth = monthNow;

//       setState(() {
//         monthlyFires = List.generate(4, (_) => false);
//       });
//     }
//   }

//   void showFirePopup(int index) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Tuesday Activity 🔥"),
//           content: const Text("Did you complete this week's Tuesday activity?"),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text("No"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 markFireCompleted(index);
//                 Navigator.pop(context);
//               },
//               child: const Text("Yes 🔥"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     resetIfNewMonth();

//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F9FA),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             /// HEADER
//             Container(
//               height: 260,
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               decoration: const BoxDecoration(
//                 color: Color(0xFF386641),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(100),
//                   bottomRight: Radius.circular(100),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   /// TOP ICON ROW
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: const Icon(
//                           Icons.person_pin,
//                           color: Colors.white,
//                           size: 40,
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Profile()),
//                           );
//                         },
//                       ),

//                       const Row(
//                         children: [
//                           Icon(
//                             Icons.emoji_events_outlined,
//                             color: Colors.white,
//                           ),
//                           Icon(
//                             Icons.local_fire_department,
//                             color: Colors.orange,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Hello, ${widget.userName}!",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),

//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Let's make today productive",
//                       style: TextStyle(color: Colors.white70, fontSize: 16),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   /// FIRE STREAK
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       4,
//                       (index) => Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 6),
//                         child: Icon(
//                           Icons.local_fire_department,
//                           color: monthlyFires[index]
//                               ? Colors.orange
//                               : Colors.white,
//                           size: 28,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// MENU TITLE
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Menu",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             /// MENU GRID
//             GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               mainAxisSpacing: 20,
//               crossAxisSpacing: 20,
//               children: [
//                 _buildCard("Booking", Icons.edit_document),
//                 _buildCard("Explore Themes", Icons.lightbulb_outline),
//                 _buildCard("News", Icons.newspaper),
//                 _buildCard("Calendar", Icons.calendar_month),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCard(String title, IconData icon) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             backgroundColor: Colors.green[50],
//             child: Icon(icon, color: const Color(0xFF386641)),
//           ),
//           const SizedBox(height: 10),
//           Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }

///SATURDAY
// import 'package:flutter/material.dart';
// import 'profile.dart';

// class HomePage extends StatefulWidget {
//   final String userName;

//   const HomePage({super.key, required this.userName});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<bool> monthlyFires = List.generate(4, (_) => false);
//   int currentMonth = DateTime.now().month;
//   int todaySaturdayIndex = -1;
//   bool popupShown = false;

//   @override
//   void initState() {
//     super.initState();
//     calculateSaturdayIndex();
//     checkForPopup();
//   }

//   void calculateSaturdayIndex() {
//     DateTime now = DateTime.now();
//     DateTime firstDay = DateTime(now.year, now.month, 1);

//     int count = 0;

//     for (int i = 0; i < now.day; i++) {
//       DateTime day = firstDay.add(Duration(days: i));

//       if (day.weekday == DateTime.saturday) {
//         if (day.day == now.day) {
//           todaySaturdayIndex = count;
//         }
//         count++;
//       }
//     }
//   }

//   void checkForPopup() {
//     if (DateTime.now().weekday == DateTime.saturday &&
//         todaySaturdayIndex != -1 &&
//         !monthlyFires[todaySaturdayIndex] &&
//         !popupShown) {
//       popupShown = true;

//       Future.delayed(Duration.zero, () {
//         showFirePopup(todaySaturdayIndex);
//       });
//     }
//   }

//   void markFireCompleted(int index) {
//     setState(() {
//       monthlyFires[index] = true;
//     });
//   }

//   void resetIfNewMonth() {
//     int monthNow = DateTime.now().month;

//     if (monthNow != currentMonth) {
//       currentMonth = monthNow;

//       setState(() {
//         monthlyFires = List.generate(4, (_) => false);
//       });
//     }
//   }

//   void showFirePopup(int index) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Saturday Activity 🔥"),
//           content: const Text(
//             "Did you complete this week's Saturday activity?",
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text("No"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 markFireCompleted(index);
//                 Navigator.pop(context);
//               },
//               child: const Text("Yes 🔥"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     resetIfNewMonth();

//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F9FA),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             /// HEADER
//             Container(
//               height: 260,
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               decoration: const BoxDecoration(
//                 color: Color(0xFF386641),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(100),
//                   bottomRight: Radius.circular(100),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   /// TOP ICON ROW
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: const Icon(
//                           Icons.person_pin,
//                           color: Colors.white,
//                           size: 40,
//                         ),
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => Profile()),
//                           );
//                         },
//                       ),

//                       const Row(
//                         children: [
//                           Icon(
//                             Icons.emoji_events_outlined,
//                             color: Colors.white,
//                           ),
//                           Icon(
//                             Icons.local_fire_department,
//                             color: Colors.orange,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Hello, ${widget.userName}! 👋",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),

//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Let's make today productive",
//                       style: TextStyle(color: Colors.white70, fontSize: 16),
//                     ),
//                   ),

//                   const SizedBox(height: 20),

//                   /// FIRE STREAK
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       4,
//                       (index) => Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 6),
//                         child: Icon(
//                           Icons.local_fire_department,
//                           color: monthlyFires[index]
//                               ? Colors.orange
//                               : Colors.white,
//                           size: 28,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 30),

//             /// MENU TITLE
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Menu",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             /// MENU GRID
//             GridView.count(
//               crossAxisCount: 2,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               mainAxisSpacing: 20,
//               crossAxisSpacing: 20,
//               children: [
//                 _buildCard("Booking", Icons.edit_document),
//                 _buildCard("Explore Themes", Icons.lightbulb_outline),
//                 _buildCard("News", Icons.newspaper),
//                 _buildCard("Calendar", Icons.calendar_month),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildCard(String title, IconData icon) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             backgroundColor: Colors.green[50],
//             child: Icon(icon, color: const Color(0xFF386641)),
//           ),
//           const SizedBox(height: 10),
//           Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  final String userName;

  const HomePage({super.key, required this.userName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> monthlyFires = List.generate(4, (_) => false);
  int currentMonth = DateTime.now().month;
  int todayMondayIndex = -1;
  bool popupShown = false;

  @override
  void initState() {
    super.initState();
    calculateMondayIndex();
    checkForPopup();
  }

  void calculateMondayIndex() {
    DateTime now = DateTime.now();
    DateTime firstDay = DateTime(now.year, now.month, 1);

    int count = 0;

    for (int i = 0; i < now.day; i++) {
      DateTime day = firstDay.add(Duration(days: i));

      if (day.weekday == DateTime.monday) {
        if (day.day == now.day) {
          todayMondayIndex = count;
        }
        count++;
      }
    }
  }

  void checkForPopup() {
    if (DateTime.now().weekday == DateTime.monday &&
        todayMondayIndex != -1 &&
        !monthlyFires[todayMondayIndex] &&
        !popupShown) {
      popupShown = true;

      Future.delayed(Duration.zero, () {
        showFirePopup(todayMondayIndex);
      });
    }
  }

  void markFireCompleted(int index) {
    setState(() {
      monthlyFires[index] = true;
    });
  }

  void resetIfNewMonth() {
    int monthNow = DateTime.now().month;

    if (monthNow != currentMonth) {
      currentMonth = monthNow;

      setState(() {
        monthlyFires = List.generate(4, (_) => false);
      });
    }
  }

  void showFirePopup(int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          content: const Text("Did you participate?"),
          actions: [
            TextButton.icon(
              icon: const Icon(Icons.close, color: Colors.red),
              label: const Text("Skip", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text("Yes (+2)"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                markFireCompleted(index);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    resetIfNewMonth();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER
            Container(
              height: 260,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                color: Color(0xFF386641),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// TOP ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.person_pin,
                          color: Colors.white,
                          size: 40,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.emoji_events_outlined,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.local_fire_department,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Hello, ${widget.userName}! 👋",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Let's make today productive",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// FIRE STREAK
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.local_fire_department,
                          color: monthlyFires[index]
                              ? Colors.orange
                              : Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// MENU TITLE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// MENU GRID
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                _buildCard("Booking", Icons.edit_document),
                _buildCard("Explore Themes", Icons.lightbulb_outline),
                _buildCard("News", Icons.newspaper),
                _buildCard("Calendar", Icons.calendar_month),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green[50],
            child: Icon(icon, color: const Color(0xFF386641)),
          ),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
