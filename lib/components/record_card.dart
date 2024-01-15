// ignore_for_file: use_build_context_synchronously

import 'package:data_managing_app/components/record_dialog.dart';
import 'package:data_managing_app/constants/app_font.dart';
import 'package:data_managing_core/constants/utils.dart';
import 'package:data_managing_core/models/record_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/constants.dart';
import '../providers/provider_instance.dart';
import 'app_dialog.dart';
import 'loading_indicator.dart';

class RecordCard extends ConsumerWidget {
  const RecordCard({required this.record, super.key});
  final RecordModel record;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  Utils.dateFormatter(record.dateCreated),
                  style: AppFont.h5PrimaryBold(),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () async {
                        final result = await RecordDialog.show(context, record: record);
                        if (result != null) {
                          final userId = ref.read(authenticationProvider).user!.id!;
                          LoadingIndicator.show(context);
                          await ref.read(recordProvider.notifier).updateRecord(result, userId).then((res) {
                            LoadingIndicator.close(context);
                            if (res.success == false) {
                              AppDialog.show(context, title: 'Alert', content: res.message);
                            }
                          });
                        }
                      },
                      child: Icon(
                        Icons.edit,
                        color: Constants.primaryColor,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(
                      width: 10.sp,
                    ),
                    InkWell(
                      onTap: () async {
                        final userId = ref.read(authenticationProvider).user!.id!;
                        LoadingIndicator.show(context);
                        await ref.read(recordProvider.notifier).deleteRecord(record.recordId!, userId).then((res) {
                          LoadingIndicator.close(context);
                          if (res.success == false) {
                            AppDialog.show(context, title: 'Alert', content: res.message);
                          }
                        });
                      },
                      child: Icon(
                        Icons.delete,
                        color: Constants.red,
                        size: 20.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subject ID',
                  style: AppFont.h5DisableBold(),
                ),
                SizedBox(
                  width: 40.w,
                  child: Text(
                    record.subject ?? '',
                    style: AppFont.h5DarkReqular(),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'remark',
                  style: AppFont.h5DisableBold(),
                ),
                SizedBox(
                  width: 40.w,
                  child: Text(
                    record.remarks ?? '',
                    style: AppFont.h5DarkReqular(),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
