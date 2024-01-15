import 'package:data_managing_core/models/record_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_state.freezed.dart';

@freezed
class RecordState with _$RecordState {
  const factory RecordState({
    required AsyncValue<List<RecordModel>> records,
  }) = _RecordState;
}
