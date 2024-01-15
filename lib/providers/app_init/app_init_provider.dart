import 'package:data_managing_core/models/user_model.dart';
import 'package:data_managing_core/services/authentication_service.dart';

class AppInitProvider {
  static final authenticationService = AuthenticationService();

  static Future<UserModel?> checkUser() async {
    final alreadyLogin = authenticationService.hasAlreadyLogin();
    if (alreadyLogin) {
      final userId = authenticationService.getUserId();
      final userRes = await authenticationService.getUser(userId);
      if (userRes.success) {
        return userRes.user;
      }
    }
    return null;
  }
}
