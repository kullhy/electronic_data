import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../ui/resources/assets/assets.dart';
import '../../../ui/resources/colors/colors.dart';
import '../../../ui/resources/themes/app_text_theme.dart';

class PrimarySearchTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final int debounceTime;
  const PrimarySearchTextField({
    super.key,
    this.onChanged,
    this.debounceTime = 1500,
  });

  @override
  State<PrimarySearchTextField> createState() => _PrimarySearchTextFieldState();
}

class _PrimarySearchTextFieldState extends State<PrimarySearchTextField> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;

  void onSearchTextChanged(String searchText) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(Duration(milliseconds: widget.debounceTime), () {
      widget.onChanged?.call(searchText);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: onSearchTextChanged,
      autofocus: false,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: AppTextTheme.blackS14W400.copyWith(color: AppColor.grey),
        isDense: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            Assets.icSearch,
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(38)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(38),
            borderSide: const BorderSide(color: Color(0xFFC5C5C5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(38),
            borderSide: const BorderSide(color: Color(0xFFC5C5C5))),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        filled: true,
        fillColor: AppColor.white,
      ),
    );
  }
}
