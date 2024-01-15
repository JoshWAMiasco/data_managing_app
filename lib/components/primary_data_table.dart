// ignore_for_file: use_build_context_synchronously

import 'package:data_managing_app/components/app_dialog.dart';
import 'package:data_managing_app/components/loading_indicator.dart';
import 'package:data_managing_app/components/record_card.dart';
import 'package:data_managing_app/components/record_dialog.dart';
import 'package:data_managing_app/providers/provider_instance.dart';
import 'package:data_managing_core/constants/utils.dart';
import 'package:data_managing_core/models/record_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/app_font.dart';
import '../constants/constants.dart';

class PrimaryDataTable extends StatelessWidget {
  const PrimaryDataTable({super.key, required this.records});
  final List<RecordModel> records;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (records.isEmpty) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No data capture entries yet.',
              style: AppFont.h3DarkBold(),
            ),
            SizedBox(
              height: 10.sp,
            ),
            Text(
              'Add a subject',
              style: AppFont.h5DisableRegular(),
            ),
          ],
        );
      }

      // Mobile View
      if (Device.screenType == ScreenType.mobile) {
        return Column(
          children: List.generate(records.length, (index) {
            return RecordCard(record: records[index]);
          }),
        );
      }

      // Table View
      return DataTable(
          columns: [
            DataColumn(
              label: Text(
                'Date Created',
                style: AppFont.h5PrimaryBold(),
              ),
            ),
            DataColumn(
              label: Text(
                'Subject ID',
                style: AppFont.h5PrimaryBold(),
              ),
            ),
            DataColumn(
              label: Text(
                'Remarks',
                style: AppFont.h5PrimaryBold(),
              ),
            ),
            DataColumn(
              label: Text(
                'Action',
                style: AppFont.h5PrimaryBold(),
              ),
            ),
          ],
          rows: List.generate(records.length, (index) {
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    Utils.dateFormatter(records[index].dateCreated),
                    style: AppFont.h5DarkReqular(),
                  ),
                ),
                DataCell(
                  Text(
                    records[index].subject ?? '',
                    style: AppFont.h5DarkReqular(),
                  ),
                ),
                DataCell(
                  Text(
                    records[index].remarks ?? '',
                    style: AppFont.h5DarkReqular(),
                  ),
                ),
                DataCell(
                  Consumer(builder: (context, ref, child) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            final record = await RecordDialog.show(context, record: records[index]);
                            if (record != null) {
                              final userId = ref.read(authenticationProvider).user!.id!;
                              LoadingIndicator.show(context);
                              await ref.read(recordProvider.notifier).updateRecord(record, userId).then((res) {
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
                            await ref.read(recordProvider.notifier).deleteRecord(records[index].recordId!, userId).then((res) {
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
                    );
                  }),
                )
              ],
            );
          }));
    });
  }
}
