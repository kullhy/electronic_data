import 'package:electronic_data/ui/resources/themes/app_text_theme.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            
          ],
        ),
      ),
    );
  }
}
