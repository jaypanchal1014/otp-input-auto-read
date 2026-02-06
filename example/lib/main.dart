import 'package:flutter/material.dart';
import 'package:otp_input_auto_read_widget/otp_input_auto_read_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpDemoScreen(),
    );
  }
}

class OtpDemoScreen extends StatefulWidget {
  const OtpDemoScreen({super.key});

  @override
  State<OtpDemoScreen> createState() => _OtpDemoScreenState();
}

class _OtpDemoScreenState extends State<OtpDemoScreen> {
  String enteredOtp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OTP Input Demo"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Enter OTP",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            /// 🔥 Smart OTP Widget
            SmartOtpField(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              // filledBorderColor: Colors.black,
              length: 4,
              autoRead: true,
              boxSize: 55,
              spacing: 12,

              borderColor: Colors.grey,
              // focusedBorderColor: Colors.red,
              fillColor: Colors.grey.shade100,
              onCompleted: (otp) {
                setState(() {
                  enteredOtp = otp;
                });

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("OTP Entered: $otp")));
              },
            ),

            const SizedBox(height: 40),

            Text(
              "Entered OTP: $enteredOtp",
              style: const TextStyle(fontSize: 18, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
