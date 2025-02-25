import 'package:app/common/export/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PasswordTextfiled extends StatefulWidget {
  const PasswordTextfiled(
      {super.key,
      required this.hide,
      required this.controller,
      required this.focusNode});

  final String hide;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  State<PasswordTextfiled> createState() => _PasswordTextfiledState();
}

class _PasswordTextfiledState extends State<PasswordTextfiled> {
  bool _isEye = false;

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
        obscureText: _isEye,
        cursorColor: theme.textPrimary,
        focusNode: widget.focusNode,
        controller: widget.controller,
        textAlignVertical: TextAlignVertical.center,
        style: theme.textStyle
            .copyWith(fontWeight: FontWeight.w500, fontSize: 15.o),
        decoration: InputDecoration(
          hintText: widget.hide,
          hintStyle: theme.textStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: theme.textPrimary.withOpacity(0.5),
            fontSize: 15.o,
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () => setState(() => _isEye = !_isEye),
            icon: SvgPicture.asset(
              _isEye ? Assets.icon.eyeHide : Assets.icon.eyeShow,
              colorFilter: theme.colorFilter,
              fit: BoxFit.contain,
              height: 32.o,
              width: 32.o,
            ),
          ),
        ),
      ),
    );
  }
}
