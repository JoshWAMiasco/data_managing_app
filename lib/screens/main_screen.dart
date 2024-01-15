// ignore_for_file: use_build_context_synchronously

import 'package:data_managing_app/components/app_dialog.dart';
import 'package:data_managing_app/components/loading_indicator.dart';
import 'package:data_managing_app/components/primary_button.dart';
import 'package:data_managing_app/components/primary_data_table.dart';
import 'package:data_managing_app/components/primary_textfield.dart';
import 'package:data_managing_app/components/record_dialog.dart';
import 'package:data_managing_app/constants/constants.dart';
import 'package:data_managing_app/providers/provider_instance.dart';
import 'package:data_managing_app/routes/app_router.dart';
import 'package:data_managing_core/constants/utils.dart';
import 'package:data_managing_core/models/record_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/app_font.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = ref.read(authenticationProvider).user;
      ref.read(recordProvider.notifier).getAllRecords(user!.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor,
        title: Text(
          'Data Managing Application',
          style: AppFont.h4PrimaryBold(),
        ),
        actions: [
          if (Device.screenType == ScreenType.tablet)
            Center(
              child: Row(
                children: [
                  Text(
                    ref.read(authenticationProvider).user?.username ?? '',
                    style: AppFont.h4DarkBold(),
                  ),
                  SizedBox(
                    width: 10.sp,
                  ),
                  InkWell(
                    onTap: () async {
                      LoadingIndicator.show(context);
                      await ref.read(authenticationProvider.notifier).logout().then((res) {
                        LoadingIndicator.close(context);
                        if (res.success) {
                          AppRouter.popUntilFirst(context);
                        } else {
                          AppDialog.show(context, title: 'Alert', content: res.message);
                        }
                      });
                    },
                    child: Icon(
                      Icons.logout_rounded,
                      color: Colors.black,
                      size: 20.sp,
                    ),
                  )
                ],
              ),
            ),
          if (Device.screenType == ScreenType.tablet)
            SizedBox(
              width: 20.sp,
            ),
          if (Device.screenType == ScreenType.tablet)
            SizedBox(
              width: 20.w,
              child: PrimaryButton(
                active: true,
                title: 'Add Record',
                onPressed: () async {
                  final record = await RecordDialog.show(context);
                  if (record != null) {
                    final userId = ref.read(authenticationProvider).user!.id!;
                    LoadingIndicator.show(context);
                    await ref.read(recordProvider.notifier).createRecord(userId, record).then((res) {
                      LoadingIndicator.close(context);
                      if (res.success == false) {
                        AppDialog.show(context, title: 'Alert', content: res.message);
                      }
                    });
                  }
                },
              ),
            )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(17.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Device.screenType == ScreenType.mobile)
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20.sp,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ref.read(authenticationProvider).user?.username ?? '',
                            style: AppFont.h4DarkBold(),
                          ),
                          SizedBox(
                            width: 10.sp,
                          ),
                          InkWell(
                            onTap: () async {
                              LoadingIndicator.show(context);
                              await ref.read(authenticationProvider.notifier).logout().then((res) {
                                LoadingIndicator.close(context);
                                if (res.success) {
                                  AppRouter.popUntilFirst(context);
                                } else {
                                  AppDialog.show(context, title: 'Alert', content: res.message);
                                }
                              });
                            },
                            child: Icon(
                              Icons.logout_rounded,
                              color: Colors.black,
                              size: 20.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                PrimaryTextField(
                  labelText: 'Search By Subject',
                  onChange: (keyword) {
                    ref.read(recordProvider.notifier).searchBySubjectId(keyword);
                  },
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Constants.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10.sp,
                ),
                ref.watch(recordProvider).records.when(
                  loading: () {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.sp),
                        child: const CircularProgressIndicator(
                          color: Colors.transparent,
                          valueColor: AlwaysStoppedAnimation(Constants.primaryColor),
                        ),
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    return Column(
                      children: [
                        Text(
                          'Something went wrong.',
                          style: AppFont.h4DarkBold(),
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                        Text(
                          error as String,
                          style: AppFont.h5DarkReqular(),
                        )
                      ],
                    );
                  },
                  data: (data) {
                    return PrimaryDataTable(records: data);
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) {
          if (Device.screenType == ScreenType.mobile) {
            return FloatingActionButton(
              backgroundColor: Constants.primaryColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () async {
                final record = await RecordDialog.show(context);
                if (record != null) {
                  final userId = ref.read(authenticationProvider).user!.id!;
                  LoadingIndicator.show(context);
                  await ref.read(recordProvider.notifier).createRecord(userId, record).then((res) {
                    LoadingIndicator.close(context);
                    if (res.success == false) {
                      AppDialog.show(context, title: 'Alert', content: res.message);
                    }
                  });
                }
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
