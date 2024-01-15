import 'package:data_managing_app/components/app_dialog.dart';
import 'package:data_managing_app/components/loading_indicator.dart';
import 'package:data_managing_app/components/primary_button.dart';
import 'package:data_managing_app/components/primary_textfield.dart';
import 'package:data_managing_app/constants/app_font.dart';
import 'package:data_managing_app/providers/provider_instance.dart';
import 'package:data_managing_app/routes/app_router.dart';
import 'package:data_managing_core/models/register_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Scaffold(
        appBar: null,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(17.sp),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Registration',
                        style: AppFont.h3PrimaryBold(),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.close,
                          color: Colors.grey,
                          size: 20.sp,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  PrimaryTextField(
                    labelText: 'Username',
                    controller: usernameController,
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  PrimaryTextField(
                    labelText: 'Pin',
                    controller: pinController,
                    textInputType: TextInputType.number,
                    maxLength: 4,
                  ),
                  SizedBox(
                    height: 15.sp,
                  ),
                  PrimaryButton(
                    active: true,
                    title: 'Submit and Login',
                    onPressed: () async {
                      LoadingIndicator.show(context);
                      RegisterRequest request = RegisterRequest(
                        username: usernameController.text,
                        pin: pinController.text,
                      );
                      await ref.read(authenticationProvider.notifier).register(request).then((res) async {
                        if (res.success) {
                          final username = "${request.username}@data.com";
                          final pin = "${request.pin}@data";
                          await ref.read(authenticationProvider.notifier).login(username, pin).then((resLogin) {
                            LoadingIndicator.close(context);
                            if (resLogin.success) {
                              ref.read(authenticationProvider.notifier).setUser(resLogin.user);
                              Navigator.pop(context);
                              GoRouter.of(context).go(AppRouter.mainScreen);
                            } else {
                              AppDialog.show(context, title: 'Alert', content: resLogin.message);
                            }
                          });
                        } else {
                          LoadingIndicator.close(context);
                          AppDialog.show(context, title: 'Alert', content: res.message);
                        }
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
