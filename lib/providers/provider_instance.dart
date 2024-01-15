import 'package:data_managing_app/providers/app_init/app_init_provider.dart';
import 'package:data_managing_app/providers/authentication/authentication_provider.dart';
import 'package:data_managing_app/providers/authentication/authentication_state.dart';
import 'package:data_managing_app/providers/records/record_provider.dart';
import 'package:data_managing_app/providers/records/record_state.dart';
import 'package:data_managing_core/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appInitProvider = FutureProvider<UserModel?>((ref) async {
  return await AppInitProvider.checkUser();
});

final authenticationProvider = StateNotifierProvider<AuthenticationProvider, AuthenticationState>((ref) {
  return AuthenticationProvider();
});

final recordProvider = StateNotifierProvider<RecordProvider, RecordState>((ref) {
  return RecordProvider();
});
