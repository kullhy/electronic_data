import 'dart:async';

import 'package:dio/dio.dart';
import 'package:electronic_data/domain/models/data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(const DetailState());

  DataModel? _previousResponse;
  late Timer _timer;
  final Dio _dio = Dio();
  final String _apiUrl =
      'https://sgp1.blynk.cloud/external/api/getAll?token=0GJNZioSZW3n17B_MAUfcdJAuYVqlPW8';

  Future<void> startPolling() async {
    DataModel? newResponse = await fetchData();
    if (_previousResponse == null || newResponse != _previousResponse) {
      _previousResponse = newResponse;
      emit(state.copyWith(
          dataModel: _previousResponse, isUpdate: !state.isUpdate));
    }
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      DataModel? newResponse = await fetchData();
      if (_previousResponse == null || newResponse != _previousResponse) {
        _previousResponse = newResponse;
        emit(state.copyWith(
            dataModel: _previousResponse, isUpdate: !state.isUpdate));
      }
    });
  }

  Future<DataModel?> fetchData() async {
    // try {
    Response response = await _dio.get(_apiUrl);
    return DataModel.fromJson(response.data);
    // } catch (e) {
    //   debugPrint('Failed to fetch data: $e');
    //   return null;
    // }
  }

  void dispose() {
    _timer.cancel();
  }
}
