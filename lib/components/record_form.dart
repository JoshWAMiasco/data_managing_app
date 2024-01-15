import 'package:data_managing_app/components/primary_button.dart';
import 'package:data_managing_app/components/primary_textfield.dart';
import 'package:data_managing_core/constants/utils.dart';
import 'package:data_managing_core/models/record_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/app_font.dart';

class RecordForm extends StatefulWidget {
  const RecordForm({super.key, this.record});
  // this record model indicated wheter its create or edit
  // when null its create
  // when has value its edit
  final RecordModel? record;

  @override
  State<RecordForm> createState() => _RecordFormState();
}

class _RecordFormState extends State<RecordForm> {
  late TextEditingController subjectController;
  late TextEditingController remarkController;

  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    subjectController = TextEditingController(text: widget.record != null ? widget.record!.subject! : '');
    remarkController = TextEditingController(text: widget.record != null ? widget.record!.remarks! : '');
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.record != null ? 'Edit Subject' : 'Add Subject',
            style: AppFont.h4DarkBold(),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
          )
        ],
      ),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrimaryTextField(
                labelText: 'Subject',
                isMandatory: true,
                controller: subjectController,
                validator: (val) {
                  if (val == null || val == '') {
                    return 'Please input subject';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 10.sp,
              ),
              PrimaryTextField(
                controller: remarkController,
                labelText: 'Remarks',
                isMandatory: true,
                validator: (val) {
                  if (val == null || val == '') {
                    return 'Please input subject';
                  } else {
                    return null;
                  }
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        PrimaryButton(
          active: true,
          title: widget.record != null ? 'Update' : 'Add Entry',
          onPressed: () {
            if (formKey.currentState!.validate()) {
              RecordModel record = RecordModel(
                recordId: widget.record != null ? widget.record!.recordId : Utils.getUID(),
                dateCreated: DateTime.now(),
                remarks: remarkController.text,
                subject: subjectController.text,
              );
              Navigator.of(context).pop(record);
            }
          },
        )
      ],
    );
  }
}
