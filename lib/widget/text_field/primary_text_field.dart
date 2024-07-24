import 'package:flutter/material.dart';

import '../../../ui/resources/colors/colors.dart';
import '../../../ui/resources/dimension/dimens.dart';
import '../../../ui/resources/themes/app_text_theme.dart';
import '../image/primary_svg_picture.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    super.key,
    this.prefixIcon,
    this.labelIcon,
    this.suffixIcon,
    required this.controller,
    this.hintText,
    this.validator,
    this.formKey,
    this.readOnly = false,
    this.textInputType,
    this.context,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputAction = TextInputAction.next,
    this.onTap,
    this.onSubmitted,
    this.isDense = false,
    this.fillColor,
    this.borderColor,
    this.maxLength,
    this.minLines = 1,
    this.maxLines = 20,
    this.counterText = '',
    this.obscureText = false,
    this.label,
    this.isRequired = false,
    this.labelStyle,
    this.onChanged,
    this.focusNode,
  });

  // final String? label;
  final String? hintText;
  final dynamic prefixIcon;
  final dynamic suffixIcon;
  final dynamic labelIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextInputType? textInputType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;

  /// context must be provided if used to show dialog
  final BuildContext? context;
  final Function()? onTap;
  final Function(String value)? onSubmitted;
  final bool isDense;
  final bool obscureText;
  final Color? fillColor;
  final Color? borderColor;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final String? counterText;
  final String? label;
  final TextStyle? labelStyle;
  final bool isRequired;
  final Function(String? value)? onChanged;
  final FocusNode? focusNode;

  final GlobalKey<FormState>? formKey;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        focusNode: widget.focusNode,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        style: AppTextTheme.whiteS14,
        controller: widget.controller,
        validator: widget.validator,
        obscureText: widget.obscureText,
        onChanged: (value) {
          widget.formKey?.currentState!.validate();
          widget.onChanged?.call(value);
        },
        onFieldSubmitted: widget.onSubmitted,
        maxLength: widget.maxLength,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        textAlignVertical:
            (widget.suffixIcon == null && widget.prefixIcon == null)
                ? null
                : TextAlignVertical.center,
        decoration: InputDecoration(
          counterText: widget.counterText,
          isDense: widget.isDense,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          hintText: widget.hintText,
          hintStyle: AppTextTheme.greyS14,
          // labelStyle: AppTextTheme.textPrimary,
          errorMaxLines: 2,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.transparent, width: 0),
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimens.defaultRadius))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.borderColor ?? AppColor.transparent, width: 0),
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimens.defaultRadius))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: widget.borderColor ?? AppColor.primaryColor, width: 2),
              borderRadius: const BorderRadius.all(
                  Radius.circular(Dimens.defaultRadius))),
          filled: true,
          fillColor: widget.fillColor ?? AppColor.grey1,
          alignLabelWithHint: true,
          prefixIcon: widget.prefixIcon == null
              ? null
              : (widget.prefixIcon is String)
                  ? PrimarySvgPicture(
                      widget.prefixIcon ?? '',
                      height: 20,
                      width: 16,
                    )
                  : widget.prefixIcon,
          suffixIcon: widget.suffixIcon == null
              ? null
              : (widget.suffixIcon is String)
                  ? PrimarySvgPicture(
                      widget.suffixIcon ?? '',
                      height: 20,
                      width: 16,
                    )
                  : widget.suffixIcon,
        ),
      ),
    );
  }
}
