import 'package:electronic_data/ui/pages/detail/components/line_chart.dart';
import 'package:electronic_data/ui/resources/themes/app_text_theme.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({super.key});

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
            children: [
              const SizedBox(height: 12),
              Text(
                "ĐIỆN NĂNG QUA CÁC NGÀY",
                style: AppTextTheme.blackS16,
              ),
              // const SizedBox(height: 12),
              const DataLineCharts(),
            ],
          ),
        )
      ],
    );
  }
}
