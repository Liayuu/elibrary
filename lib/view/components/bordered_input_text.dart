import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BorderedInputText extends StatelessWidget {
  // Timer _timer;
  Function(dynamic)? data;
  // final productForm = Get.find<ProductController>();
  // final box = GetStorage();
  String? hint;
  bool addSuffix;
  TextEditingController? textEditingController;
  bool readOnly;
  int? maxLines;
  String? initValue;
  TextAlign? textAlign;
  FocusNode? focusNode;
  // var model;
  ValueChanged<dynamic>? onSaved;
  ValueChanged<dynamic>? onChanged;
  TextInputType? type;

  BorderedInputText({
    Key? key,
    this.data,
    this.hint,
    required this.addSuffix,
    this.textEditingController,
    required this.readOnly,
    this.maxLines,
    this.initValue,
    this.textAlign,
    this.focusNode,
    this.onSaved,
    this.onChanged,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      readOnly: readOnly,
      initialValue: initValue,
      focusNode: focusNode,
      keyboardType: type,
      textAlign: textAlign ?? TextAlign.left,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: Get.theme.primaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: addSuffix
            ? Icon(
                Icons.info_sharp,
                color: Get.theme.primaryColor,
                size: 24,
              )
            : null,
        enabledBorder: Get.theme.inputDecorationTheme.enabledBorder,
        focusedBorder: Get.theme.inputDecorationTheme.focusedBorder,
        hintText: hint,
        hintStyle: Get.textTheme.bodyMedium,
      ),
      onChanged: (value) {
        if (onChanged != null) onChanged!(value);
      },
      onSaved: (value) {
        if (onSaved != null) onSaved!(value);
      },
    );
  }
}
