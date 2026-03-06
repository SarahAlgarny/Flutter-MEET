// import 'package:flutter/material.dart';
// import 'login.dart';
// import 'HomePage.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   State<SignUpPage> createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController =
//       TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(height: 120, color: const Color(0xFF386641)),
//             const SizedBox(height: 40),
//             const LogoDots(),
//             const SizedBox(height: 20),
//             const Text(
//               "Create Account",
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF386641),
//               ),
//             ),
//             const Text(
//               "Join our stand-up community",
//               style: TextStyle(color: Colors.grey),
//             ),
//             const SizedBox(height: 30),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 children: [
//                   CustomInputField(
//                     label: "Full Name",
//                     hint: "Sarah Mohammed",
//                     icon: Icons.person_outline,
//                     controller: nameController,
//                   ),
//                   CustomInputField(
//                     label: "Email (Company)",
//                     hint: "Sarah@misa.gov.sa",
//                     icon: Icons.email_outlined,
//                     controller: emailController,
//                   ),
//                   CustomInputField(
//                     label: "Password",
//                     hint: "******",
//                     icon: Icons.lock_outline,
//                     isPassword: true,
//                     controller: passwordController,
//                   ),
//                   CustomInputField(
//                     label: "Confirm Password",
//                     hint: "******",
//                     icon: Icons.lock_outline,
//                     isPassword: true,
//                     controller: confirmPasswordController,
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     height: 55,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         String name =
//                             nameController.text; // ناخذ الاسم من الـ TextField
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => HomePage(userName: name),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF386641),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 4,
//                       ),
//                       child: const Text(
//                         "Create Account",
//                         style: TextStyle(color: Colors.white, fontSize: 16),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text("Already have an account? "),
//                       GestureDetector(
//                         onTap: () => Navigator.pushNamed(context, '/login'),
//                         child: const Text(
//                           "Login",
//                           style: TextStyle(
//                             color: Color(0xFF386641),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomInputField extends StatelessWidget {
//   final String label;
//   final String hint;
//   final IconData icon;
//   final bool isPassword;
//   final TextEditingController controller;

//   const CustomInputField({
//     super.key,
//     required this.label,
//     required this.hint,
//     required this.icon,
//     required this.controller,
//     this.isPassword = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: TextField(
//             controller: controller,
//             obscureText: isPassword,
//             decoration: InputDecoration(
//               prefixIcon: Icon(icon, color: Colors.grey),
//               hintText: hint,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide.none,
//               ),
//               filled: true,
//               fillColor: Colors.white,
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }
// }

// class LogoDots extends StatelessWidget {
//   const LogoDots({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const CircleAvatar(radius: 12, backgroundColor: Color(0xFF386641)),
//         const SizedBox(width: 8),
//         CircleAvatar(
//           radius: 8,
//           backgroundColor: const Color(0xFF386641).withOpacity(0.8),
//         ),
//         const SizedBox(width: 8),
//         CircleAvatar(
//           radius: 6,
//           backgroundColor: const Color(0xFF386641).withOpacity(0.6),
//         ),
//       ],
//     );
//   }
// }import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _submit() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    if (!email.endsWith('@misa.gov.sa')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email must end with @misa.gov.sa')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    // بعد Create Account نودي المستخدم على صفحة Login
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 120, color: const Color(0xFF386641)),
            const SizedBox(height: 40),
            const LogoDots(),
            const SizedBox(height: 20),
            const Text(
              "Create Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF386641),
              ),
            ),
            const Text(
              "Join our stand-up community",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  CustomInputField(
                    label: "Full Name",
                    hint: "Enter your full name",
                    icon: Icons.person_outline,
                    controller: nameController,
                  ),
                  CustomInputField(
                    label: "Email (Company)",
                    hint: "Enter your email",
                    icon: Icons.email_outlined,
                    controller: emailController,
                  ),
                  CustomInputField(
                    label: "Password",
                    hint: "Enter password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: passwordController,
                  ),
                  CustomInputField(
                    label: "Confirm Password",
                    hint: "Confirm password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF386641),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () =>
                            Navigator.pushReplacementNamed(context, '/login'),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Color(0xFF386641),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Custom Widgets ----

class CustomInputField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;

  const CustomInputField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.grey),
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class LogoDots extends StatelessWidget {
  const LogoDots({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(radius: 12, backgroundColor: Color(0xFF386641)),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 8,
          backgroundColor: const Color(0xFF386641).withOpacity(0.8),
        ),
        const SizedBox(width: 8),
        CircleAvatar(
          radius: 6,
          backgroundColor: const Color(0xFF386641).withOpacity(0.6),
        ),
      ],
    );
  }
}
