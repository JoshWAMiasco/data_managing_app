import 'package:data_managing_app/providers/records/record_state.dart';
import 'package:data_managing_core/models/create_record_response.dart';
import 'package:data_managing_core/models/delete_record_response.dart';
import 'package:data_managing_core/models/record_model.dart';
import 'package:data_managing_core/models/update_record_response.dart';
import 'package:data_managing_core/services/data_managing_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecordProvider extends StateNotifier<RecordState> {
  RecordProvider() : super(const RecordState(records: AsyncValue.loading()));

  final dataManagingService = DataManagingService();

  List<RecordModel> originalList = [];

  Future<void> getAllRecords(String userId) async {
    state = state.copyWith(records: const AsyncValue.loading());
    await dataManagingService.getAll(userId).then((res) {
      if (res.success) {
        originalList = res.records ?? [];
        state = state.copyWith(records: AsyncValue.data(res.records ?? []));
      } else {
        state = state.copyWith(records: AsyncError(res.message, StackTrace.current));
      }
    });
  }

  Future<CreateRecordResponse> createRecord(String userId, RecordModel newRecord) async {
    return await dataManagingService.create(userId, newRecord).then((res) {
      if (res.success) {
        var updatedList = state.records.value;
        updatedList?.add(newRecord);
        originalList = updatedList ?? [];
        state = state.copyWith(records: AsyncValue.data(updatedList ?? []));
      }
      return res;
    });
  }

  Future<DeleteRecordResponse> deleteRecord(String recordId, String userId) async {
    return await dataManagingService.delete(userId, recordId).then((res) {
      if (res.success) {
        var updatedList = state.records.value;
        for (var i = 0; i < updatedList!.length; i++) {
          if (updatedList[i].recordId == recordId) {
            updatedList.removeAt(i);
          }
        }
        originalList = updatedList;
        state = state.copyWith(records: AsyncValue.data(updatedList ?? []));
      }
      return res;
    });
  }

  Future<UpdateRecordResponse> updateRecord(RecordModel record, String userId) async {
    return await dataManagingService.update(userId, record).then((res) {
      if (res.success) {
        var updatedList = state.records.value;
        for (var i = 0; i < updatedList!.length; i++) {
          if (updatedList[i].recordId == record.recordId) {
            updatedList[i] = record;
          }
        }
        originalList = updatedList;
        state = state.copyWith(records: AsyncValue.data(updatedList ?? []));
      }
      return res;
    });
  }

  void searchBySubjectId(String keyword) {
    if (keyword.isNotEmpty) {
      final filteredList = originalList.where((record) => record.subject!.toLowerCase().contains(keyword.toLowerCase())).toList();
      state = state.copyWith(records: AsyncValue.data(filteredList));
    } else {
      state = state.copyWith(records: AsyncValue.data(originalList));
    }
  }
}
