// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   final String userName;
//   const HomePage({super.key, required this.userName});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     // Start the popup sequence after the frame is rendered
//     WidgetsBinding.instance.addPostFrameCallback((_) => _showMeetingPopup());
//   }

//   void _showMeetingPopup() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               "Did you attend today's meeting?",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                       _showParticipationPopup();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF386641),
//                     ),
//                     child: const Text(
//                       "Yes",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey[200],
//                     ),
//                     child: const Text(
//                       "Skip",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showParticipationPopup() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               "Did you participate?",
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF386641),
//                     ),
//                     child: const Text(
//                       "Yes (+5 pts)",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey[200],
//                     ),
//                     child: const Text(
//                       "Skip",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F9FA),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Curved Header
//             Container(
//               height: 220,
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
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Icon(Icons.person_pin, color: Colors.white, size: 40),
//                       Row(
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
//                      alignment: Alignment.centerLeft,
//                   child: Text(
//                       "Hello ${widget.userName}!",
//                       style: TextStyle(
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
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30),
//             // Menu Grid
//             GridView.count(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisCount: 2,
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
//             const SizedBox(height: 30),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Upcoming Session",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//             _buildSession(
//               "The Power of Slow Progress",
//               "Sarah Mohammed",
//               "Mar 5",
//               "Insight Bites",
//             ),
//             _buildSession(
//               "Unlearning Perfection",
//               "Ali Mohammed",
//               "Mar 14",
//               "Stories & Reflections",
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
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
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

//   Widget _buildSession(String title, String author, String date, String tag) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.green[50],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Text(
//                   tag,
//                   style: const TextStyle(
//                     color: Color(0xFF386641),
//                     fontSize: 10,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             author,
//             style: const TextStyle(color: Colors.grey, fontSize: 12),
//           ),
//           const SizedBox(height: 10),
//           Row(
//             children: [
//               const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
//               const SizedBox(width: 5),
//               Text(
//                 date,
//                 style: const TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String userName;
  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220,
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.person_pin, color: Colors.white, size: 40),
                      Row(
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
                      "Hello, $userName!",
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
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
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
