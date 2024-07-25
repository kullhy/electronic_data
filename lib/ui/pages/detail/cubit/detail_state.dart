import 'package:electronic_data/domain/models/data_model.dart';
import 'package:equatable/equatable.dart';

class DetailState extends Equatable {
  final bool isUpdate;
  final DataModel? dataModel;
  final int totalPages;

  const DetailState({
    this.isUpdate = true,
    this.dataModel,
    this.totalPages = 0,
  });

  @override
  List<Object?> get props => [
        isUpdate,
        dataModel,
        totalPages,
      ];

  DetailState copyWith({
    bool? isUpdate,
    DataModel? dataModel,
    int? totalPages,
  }) {
    return DetailState(
      isUpdate: isUpdate ?? this.isUpdate,
      dataModel: dataModel ?? this.dataModel,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
