import 'dart:developer';
import 'package:flutter/material.dart';
import 'biometric_auth_service.dart';

class BiometricAuthScreen extends StatefulWidget {
  const BiometricAuthScreen({super.key});
  @override
  State<BiometricAuthScreen> createState() => _BiometricAuthScreenState();
}
class _BiometricAuthScreenState extends State<BiometricAuthScreen> {
 final BiometricAuthService biometricAuthService= BiometricAuthService();
 String _message = "اضغط الزر لتسجيل الدخول بالبصمة";
 Future<void>handleAuth()async{
  final result= await biometricAuthService.auth();
  _message=result;
  setState(() {});
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول بالبصمة')),
      body: Center(
        child: Column(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                handleAuth();
                log(_message);
              },
              icon: const Icon(Icons.fingerprint,color: Colors.blue, size: 30,),
              label: const Text('سجّل ببصمه الاصبع او الوجه ',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlueAccent[200]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
