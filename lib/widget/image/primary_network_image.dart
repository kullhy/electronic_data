import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../ui/resources/colors/colors.dart';

class PrimaryNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? borderRadius;

  const PrimaryNetworkImage(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            LayoutBuilder(builder: (context, constraint) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/ic_image_placeholder.svg',
                width: constraint.maxWidth / 2,
                height: (constraint.maxWidth / 2) * 14 / 76,
              ),
            ),
          );
        }),
        errorWidget: (context, url, error) => Container(
          padding: const EdgeInsets.all(16),
          color: AppColor.grey2,
          child: Icon(
            Icons.error,
            color: AppColor.grey,
          ),
        ),
      ),
    );
  }
}
