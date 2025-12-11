import 'package:local_auth/local_auth.dart';

class BiometricService {
  BiometricService._();

  static final BiometricService instance = BiometricService._();

  final LocalAuthentication _auth = LocalAuthentication();

  /// هل الجهاز يدعم أي نوع من الـ biometrics (بصمة / وجه / قزحية...)
  Future<bool> canUseBiometrics() async {
    try {
      final isSupported = await _auth.isDeviceSupported();
      final canCheck = await _auth.canCheckBiometrics;
      return isSupported && canCheck;
    } catch (_) {
      return false;
    }
  }

  /// محاولة التحقق بالبصمة/Face ID
  Future<bool> authenticate({
    String reason = 'Authenticate to continue',
    bool biometricOnly = true,
  }) async {
    try {
      final canUse = await canUseBiometrics();
      if (!canUse) return false;

      final didAuthenticate = await _auth.authenticate(
        localizedReason: reason,
        biometricOnly: biometricOnly,
        // stickyAuth: true,
        // useErrorDialogs: true, // يظهر Dialog Error من النظام لو فيه مشكلة
      );

      return didAuthenticate;
    } catch (e) {
      // ممكن تطبع e في الـ log لو حابب
      return false;
    }
  }

  /// لو حابب تعرف الأنواع المتاحة (fingerprint, face, ...)
  Future<List<BiometricType>> getAvailableTypes() async {
    try {
      return await _auth.getAvailableBiometrics();
    } catch (_) {
      return [];
    }
  }
}
