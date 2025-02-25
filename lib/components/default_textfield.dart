import 'package:app/common/helpers/size.dart';
import 'package:app/common/helpers/theme.dart';
import 'package:flutter/material.dart';

class DefaultTextfield extends StatelessWidget {
  const DefaultTextfield(
      {super.key,
      required this.focusNode,
      required this.controller,
      required this.hide});

  final FocusNode focusNode;
  final TextEditingController controller;
  final String hide;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.o,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 12.w),
      decoration: BoxDecoration(
        color: theme.transparent,
        border: Border.all(color: theme.borderColor, width: 1.o),
        borderRadius: BorderRadius.circular(50.o),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        cursorColor: theme.textPrimary,
        style: theme.textStyle
            .copyWith(fontWeight: FontWeight.w500, fontSize: 15.o),
        decoration: InputDecoration(
          hintText: hide,
          hintStyle: theme.textStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.textPrimary.withOpacity(0.5),
            fontSize: 15.o,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
