import 'package:data_managing_app/components/app_dialog.dart';
import 'package:data_managing_app/components/loading_indicator.dart';
import 'package:data_managing_app/components/primary_button.dart';
import 'package:data_managing_app/components/primary_textfield.dart';
import 'package:data_managing_app/constants/app_font.dart';
import 'package:data_managing_app/constants/constants.dart';
import 'package:data_managing_app/providers/provider_instance.dart';
import 'package:data_managing_app/routes/app_router.dart';
import 'package:data_managing_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends State<LobbyScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 17.sp,
              right: 17.sp,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 20.sp,
                      width: 20.sp,
                      image: const AssetImage(
                        Constants.appIcon,
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    Text(
                      'Welcome to Data Managing App',
                      style: Device.screenType == ScreenType.tablet ? AppFont.h2PrimaryBold() : AppFont.h3PrimaryBold(),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Text(
                    'This is a simple app that records data with simple crud operation via firebase.',
                    style: AppFont.h5DarkReqular(),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                PrimaryTextField(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Icon(
                      Icons.people,
                      color: Constants.primaryColor,
                      size: 20.sp,
                    ),
                  ),
                  labelText: 'Username',
                  controller: usernameController,
                ),
                SizedBox(
                  height: 15.sp,
                ),
                PrimaryTextField(
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: Icon(
                      Icons.key,
                      color: Constants.primaryColor,
                      size: 20.sp,
                    ),
                  ),
                  labelText: 'pin',
                  controller: pinController,
                  textInputType: TextInputType.number,
                  maxLength: 4,
                ),
                SizedBox(
                  height: 15.sp,
                ),
                Consumer(builder: (context, ref, child) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 45.w,
                        child: PrimaryButton(
                          title: 'Login',
                          active: true,
                          onPressed: () async {
                            LoadingIndicator.show(context);
                            final username = "${usernameController.text}@data.com";
                            final pin = "${pinController.text}@data";
                            await ref.read(authenticationProvider.notifier).login(username, pin).then((res) {
                              LoadingIndicator.close(context);
                              if (res.success) {
                                ref.read(authenticationProvider.notifier).setUser(res.user);
                                GoRouter.of(context).go(AppRouter.mainScreen);
                              } else {
                                AppDialog.show(context, title: 'Alert', content: res.message);
                              }
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.sp,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 45.w,
                            child: PrimaryButton(
                              active: true,
                              title: 'Login as Guest',
                              isOutlined: true,
                              onPressed: () async {
                                LoadingIndicator.show(context);
                                await ref.read(authenticationProvider.notifier).loginAsGuest().then((res) {
                                  LoadingIndicator.close(context);
                                  if (res.success) {
                                    ref.read(authenticationProvider.notifier).setUser(res.user);
                                    GoRouter.of(context).go(AppRouter.mainScreen);
                                  } else {
                                    AppDialog.show(context, title: 'Alert', content: res.message);
                                  }
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10.sp,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const RegisterScreen();
                                },
                              );
                            },
                            child: Text(
                              'Register',
                              style: AppFont.h4PrimaryRegular(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
