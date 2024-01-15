import 'package:data_managing_app/constants/constants.dart';
import 'package:data_managing_app/providers/authentication/authentication_state.dart';
import 'package:data_managing_app/providers/provider_instance.dart';
import 'package:data_managing_app/routes/app_router.dart';
import 'package:data_managing_core/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InitializedScreen extends StatelessWidget {
  const InitializedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (contex, ref, child) {
      ref.invalidate(appInitProvider);
      ref.listen<AsyncValue<UserModel?>>(appInitProvider, (previous, next) async {
        final authData = next.value;
        if (authData != null) {
          ref.read(authenticationProvider.notifier).setUser(authData);
          GoRouter.of(context).go(AppRouter.mainScreen);
        } else {
          GoRouter.of(context).go(AppRouter.lobbyScreen);
        }
      });

      return Scaffold(
        appBar: null,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(17.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image(
                    image: const AssetImage(Constants.appIcon),
                    height: 35.sp,
                    width: 35.sp,
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                const CircularProgressIndicator(
                  color: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation<Color>(Constants.primaryColor),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
