import 'package:data_managing_app/providers/authentication/authentication_state.dart';
import 'package:data_managing_core/models/logout_response.dart';
import 'package:data_managing_core/models/register_request.dart';
import 'package:data_managing_core/models/register_response.dart';
import 'package:data_managing_core/models/user_model.dart';
import 'package:data_managing_core/models/user_response.dart';
import 'package:data_managing_core/services/authentication_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationProvider extends StateNotifier<AuthenticationState> {
  AuthenticationProvider()
      : super(const AuthenticationState(
          user: null,
        ));

  final authenticationService = AuthenticationService();

  Future<UserResponse> loginAsGuest() async {
    return await authenticationService.loginAsGuest();
  }

  Future<UserResponse> login(String username, String pin) async {
    return await authenticationService.login(username, pin);
  }

  setUser(UserModel data) {
    state = state.copyWith(
      user: data,
    );
  }

  Future<LogoutResponse> logout() async {
    final res = await authenticationService.logout();
    return res;
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    return await authenticationService.register(request);
  }
}
