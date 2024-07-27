import 'package:electronic_data/domain/models/data_model.dart';
import 'package:electronic_data/ui/resources/themes/app_text_theme.dart';
import 'package:flutter/material.dart';

class DataWidget extends StatefulWidget {
  const DataWidget({super.key, this.dataModel});

  final DataModel? dataModel;

  @override
  State<DataWidget> createState() => _DataWidgetState();
}

class _DataWidgetState extends State<DataWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _infoWidget(
                title: "ĐIỆN ÁP",
                parameter: "${widget.dataModel?.v1 ?? 0}",
                textColor: Colors.red,
                unit: "V",
              ),
              _infoWidget(
                title: "Dòng điện",
                parameter: "${widget.dataModel?.v2 ?? 0}",
                textColor: Colors.yellow[700]!,
                unit: "A",
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _infoWidget(
                title: "Công suất",
                parameter: "${widget.dataModel?.v3 ?? 0}",
                textColor: Colors.purple,
                unit: "W",
              ),
              _infoWidget(
                title: "Điện năng hiện tại",
                parameter: "${widget.dataModel?.v4 ?? 0}",
                textColor: Colors.blue,
                unit: "kWh",
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _infoWidget(
                title: "Tần số",
                parameter: "${widget.dataModel?.v5 ?? 0}",
                textColor: Colors.black,
                unit: "Hz",
              ),
              _infoWidget(
                title: "Hệ số công suất",
                parameter: "${widget.dataModel?.v6 ?? 0}",
                textColor: Colors.orange,
                unit: "",
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _infoWidget({
    required String title,
    required String parameter,
    required String unit,
    required Color textColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, 1.5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              style: AppTextTheme.greyS12Bold,
            ),
            const SizedBox(height: 20),
            _buildDataItem(
              parameter: parameter,
              unit: unit,
              textColor: textColor,
            )
          ],
        ),
      ),
    );
  }

  Row _buildDataItem({
    required String parameter,
    required String unit,
    required Color textColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          parameter,
          style: AppTextTheme.blackS24.copyWith(color: textColor),
        ),
        Text(
          unit,
          style: AppTextTheme.blackS16.copyWith(color: textColor),
        ),
      ],
    );
  }
}
