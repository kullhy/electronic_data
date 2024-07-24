import 'package:electronic_data/ui/pages/detail/components/line_chart.dart';
import 'package:electronic_data/ui/resources/themes/app_text_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "PZEM004T",
              style: AppTextTheme.blackS14Bold,
            ),
            // const Spacer(),
            Container(
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _infoWidget(
                    title: "ĐIỆN ÁP",
                    parameter: "205",
                    textColor: Colors.red,
                    unit: "V",
                  ),
                  _infoWidget(
                    title: "Dòng điện",
                    parameter: "0",
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
                    parameter: "0",
                    textColor: Colors.purple,
                    unit: "W",
                  ),
                  _infoWidget(
                    title: "Điện năng hiện tại",
                    parameter: "0,104",
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
                    parameter: "49,9",
                    textColor: Colors.black,
                    unit: "Hz",
                  ),
                  _infoWidget(
                    title: "Điện năng hiện tại",
                    parameter: "0",
                    textColor: Colors.orange,
                    unit: "",
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text("ĐIỆN NĂNG QUA CÁC NGÀY"),
              const DataLineCharts()
            ],
          ),
        ),
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
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title.toUpperCase(),
            style: AppTextTheme.greyS14Bold,
          ),
          const SizedBox(height: 20),
          _buildDataItem(
            parameter: parameter,
            unit: unit,
            textColor: textColor,
          )
        ],
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
