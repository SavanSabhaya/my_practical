import 'package:practical/common/constants/color_constants.dart';
import 'package:practical/common/constants/font_constants.dart';
import 'package:practical/utils/app_theme.dart';
import 'package:practical/utils/componets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFormField extends StatefulWidget {
  CommonTextFormField(
      {Key? key,
      required this.editController,
      required this.focusNode,
      required this.labelText,
      required this.onChange,
      // required this.onValidate,
      this.onFieldSubmitted,
      this.maxLength,
      this.backgroundColor,
      this.isEnabled = true,
      this.textAlign = TextAlign.start,
      required this.textInputType,
      this.maxLines = 1,
      this.minLines = 1,
      this.textCounter,
      this.prefixIcon,
      this.prefixWidget,
      this.suffixIcon,
      this.contentPadding,
      this.isAlignLabelWithHint,
      this.isPassword = false,
      this.isObscureText = false,
      this.textInputAction,
      this.hintTextstyle,
      this.cursorColor,
      this.labelTextstyle,
      this.inputBorders})
      : super(key: key);

  final TextEditingController editController;
  final FocusNode focusNode;
  final int? maxLength;
  final String labelText;
  final Color? backgroundColor;
  bool isEnabled = true;
  TextAlign textAlign;
  bool isPassword;
  bool isObscureText;
  TextInputType textInputType;
  final void Function(String?) onChange;
  // final String? Function(String?) onValidate;
  final void Function(String?)? onFieldSubmitted;
  int maxLines = 1;
  int minLines = 1;
  final Widget? textCounter;
  final Widget? prefixIcon;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final EdgeInsets? contentPadding;
  final bool? isAlignLabelWithHint;
  TextInputAction? textInputAction;
  TextStyle? hintTextstyle;
  Color? cursorColor;
  TextStyle? labelTextstyle;
  InputBorder? inputBorders;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        showCursor: true,
        // expands: true,
        autofocus: false,
        enableInteractiveSelection: true,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        controller: widget.editController,
        focusNode: widget.focusNode,
        maxLines: widget.maxLines,
        enabled: widget.isEnabled,
        textAlign: widget.textAlign,
        obscuringCharacter: '*',
        inputFormatters: onGetInputFormatter(),
        keyboardType: widget.textInputType,
        onChanged: widget.onChange,
        obscureText: widget.isObscureText,
        cursorColor: ColorConstants.primaryColor,
        textCapitalization: widget.textInputType == TextInputType.emailAddress || widget.isPassword
            ? TextCapitalization.none
            : TextCapitalization.sentences,
        minLines: widget.minLines,
        maxLength: widget.maxLength ?? 100,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          alignLabelWithHint: widget.isAlignLabelWithHint ?? false,
          prefixIcon: widget.prefixIcon,
          prefix: widget.prefixWidget ?? const Offstage(),
          suffixIcon: widget.suffixIcon,
          counter: null,
          isDense: true,
          counterText: "",
          hintText: widget.labelText,
          hintStyle: widget.hintTextstyle ??
              AppThemeState()
                  .textStyleMedium(Colors.grey, fontSize: FontConstants.font_12, decoration: TextDecoration.none),
          filled: true,
          fillColor: Colors.white,
          border: AppThemeState.borderStyle(),
          enabledBorder: AppThemeState.enableBorderStyle(),
          disabledBorder: AppThemeState.disabledBorderStyle(),
          focusedBorder: widget.inputBorders ?? AppThemeState.focusBorderStyle(),
          errorBorder: AppThemeState.errorBorderStyle(),
          focusedErrorBorder: AppThemeState.errorBorderStyle(),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
        style: widget.labelTextstyle ??
            AppThemeState().textStyleMedium(ColorConstants.textColor,
                fontSize: FontConstants.font_12, decoration: TextDecoration.none));
  }

  List<TextInputFormatter> onGetInputFormatter() {
    List<TextInputFormatter> inputFormatter = [];
    inputFormatter.addAll([
      FilteringTextInputFormatter.deny(
          RegExp('(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])')),
      InitialSpaceInputFormatter()
    ]);
    if (widget.textInputType == TextInputType.name) {
      inputFormatter.addAll([
        InitialZeroInputFormatter(),
        FilteringTextInputFormatter.allow(RegExp(r'^-?[A-Za-z\s]*')),
        LengthLimitingTextInputFormatter(70),
      ]);
    } else if (widget.textInputType == TextInputType.phone || widget.textInputType == TextInputType.number) {
      inputFormatter.addAll([
        FilteringTextInputFormatter.allow(RegExp(
          r'^-?\d*',
        )),
        InitialZeroInputFormatter()
      ]);
      // inputFormatter.addAll([FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*',)), InitialZeroInputFormatter()]);
    } else if (widget.textInputType == TextInputType.visiblePassword ||
        widget.textInputType == TextInputType.emailAddress) {
      inputFormatter.addAll([
        // InitialZeroInputFormatter(),
      ]);
      // inputFormatter.addAll([FilteringTextInputFormatter.allow(RegExp(r'^-?[0-9]*',)), InitialZeroInputFormatter()]);
    } else if (widget.textInputType == TextInputType.none) {
      inputFormatter.addAll([FilteringTextInputFormatter.allow(RegExp("(^[+A-Z+a-z+0-9]+\$)"))]);
    }
    return inputFormatter;
  }
}
