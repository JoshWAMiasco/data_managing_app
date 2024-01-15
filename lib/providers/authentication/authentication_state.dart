import 'package:data_managing_core/models/user_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    UserModel? user,
  }) = _UserModel;
}
