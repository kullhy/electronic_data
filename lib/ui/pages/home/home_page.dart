import 'package:electronic_data/ui/resources/themes/app_text_theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 120,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 12,
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "PZEM004T",
                        style: AppTextTheme.blackS14Bold,
                      ),
                      const Spacer(),
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
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDataItem(parameter: "205", unit: "V"),
                      _buildDataItem(parameter: "0", unit: "A"),
                      _buildDataItem(parameter: "0", unit: "W"),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Row _buildDataItem({
    required String parameter,
    required String unit,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          parameter,
          style: AppTextTheme.blackS18Bold,
        ),
        Text(
          unit,
          style: AppTextTheme.blackS12W400,
        ),
      ],
    );
  }
}
