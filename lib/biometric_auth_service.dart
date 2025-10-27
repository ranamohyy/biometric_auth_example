import 'package:local_auth/local_auth.dart';

class BiometricAuthService {

  final LocalAuthentication localAuthentication = LocalAuthentication();

  Future<String> auth() async {
    final bool canAuthenticateWithBiometrics = await localAuthentication
        .canCheckBiometrics;
    final bool isSupported = await localAuthentication.isDeviceSupported();
    if (!canAuthenticateWithBiometrics || !isSupported) {
      return "جهازك لا يدعم البصمه";
    }
    try {
      final bool canAuthenticate = await localAuthentication.authenticate(
          localizedReason: 'من فضلك استخدم البصمة لتسجيل الدخول ',
          options: AuthenticationOptions(
              biometricOnly: true, stickyAuth: true));
      return canAuthenticate ? "تم تسجيل الدخول بنجاح " : "فشل في التحقق ";
    } catch (e) {
      return 'error is $e';
    }
  }
}