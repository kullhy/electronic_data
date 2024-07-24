import 'package:flutter/material.dart';

import '../../../ui/resources/colors/colors.dart';
import '../../../ui/resources/themes/app_text_theme.dart';

class PrimarySlider extends StatefulWidget {
  final Function(double value)? onChanged;
  final double? initialValue;
  final String? label;
  const PrimarySlider({
    super.key,
    this.onChanged,
    this.initialValue,
    this.label,
  });

  @override
  State<PrimarySlider> createState() => _PrimarySliderState();
}

class _PrimarySliderState extends State<PrimarySlider> {
  double value = 1;

  @override
  void initState() {
    value = widget.initialValue ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? '',
          style: AppTextTheme.greyS14Bold,
          textAlign: TextAlign.end,
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Expanded(
              child: SliderTheme(
                data: SliderThemeData(
                  overlayShape: SliderComponentShape.noOverlay,
                ),
                child: Slider(
                  value: value,
                  activeColor: AppColor.primaryColor,
                  thumbColor: AppColor.primaryColorDark,
                  inactiveColor: AppColor.grey,
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                    });
                    widget.onChanged?.call(value);
                  },
                ),
              ),
            ),
            SizedBox(
              width: 42,
              child: Text(
                '${(value * 100).floor()}%',
                style: AppTextTheme.whiteS14,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
