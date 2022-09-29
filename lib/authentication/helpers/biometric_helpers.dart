import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  final LocalAuthentication _authentication = LocalAuthentication();
  Future<bool> hasEnrolledBiometrics() async {
    final List<BiometricType> availableBiometrics =
        await _authentication.getAvailableBiometrics();
    if (availableBiometrics.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> authenticate() async {
    final bool didAuthenticate = await _authentication.authenticate(
        localizedReason: 'Please Authenticate to Procees',
        options: AuthenticationOptions(biometricOnly: false));
    return didAuthenticate;
  }
}
