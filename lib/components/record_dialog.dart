import 'package:data_managing_app/components/primary_button.dart';
import 'package:data_managing_app/components/primary_textfield.dart';
import 'package:data_managing_app/components/record_form.dart';
import 'package:data_managing_app/constants/app_font.dart';
import 'package:data_managing_core/constants/utils.dart';
import 'package:data_managing_core/models/record_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecordDialog {
  static TextEditingController subjectController = TextEditingController(text: '');
  static TextEditingController remarkController = TextEditingController(text: '');
  static Future<RecordModel?> show(BuildContext context, {RecordModel? record}) async {
    return showDialog(
      context: context,
      builder: (context) {
        return RecordForm(
          record: record,
        );
      },
    );
  }
}
