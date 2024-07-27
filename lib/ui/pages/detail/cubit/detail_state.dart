import 'package:electronic_data/domain/models/data_model.dart';
import 'package:equatable/equatable.dart';

class DetailState extends Equatable {
  final bool isUpdate;
  final DataModel? dataModel;
  final int totalPages;
  final List<double>? statisticalV4;
  final List<double>? statisticalV7;

  const DetailState({
    this.isUpdate = true,
    this.dataModel,
    this.totalPages = 0,
    this.statisticalV4,
    this.statisticalV7,
  });

  @override
  List<Object?> get props => [
        isUpdate,
        dataModel,
        totalPages,
        statisticalV4,
        statisticalV7
      ];

  DetailState copyWith({
    bool? isUpdate,
    DataModel? dataModel,
    int? totalPages,
    List<double>? statisticalV4,
    List<double>? statisticalV7,

  }) {
    return DetailState(
      isUpdate: isUpdate ?? this.isUpdate,
      dataModel: dataModel ?? this.dataModel,
      totalPages: totalPages ?? this.totalPages,
      statisticalV4: statisticalV4 ?? this.statisticalV4,
      statisticalV7: statisticalV7 ?? this.statisticalV7

    );
  }
}
