import 'package:app/common/export/assistant.dart';
import 'package:app/common/export/helper.dart';
import 'package:app/common/utils/utils.dart';
import 'package:app/components/back_appbar.dart';
import 'package:app/components/custom_button.dart';
import 'package:app/components/default_textfield.dart';
import 'package:app/components/password_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final returnPasswordController = TextEditingController();
  final returnPasswordFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final nameFocusNode = FocusNode();

  void update() => setState(() {});

  @override
  void initState() {
    nameFocusNode.addListener(update);
    emailFocusNode.addListener(update);
    passwordFocusNode.addListener(update);
    returnPasswordFocusNode.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    returnPasswordController.dispose();
    returnPasswordFocusNode.dispose();
    passwordFocusNode.dispose();
    emailFocusNode.dispose();
    nameFocusNode.dispose();
    super.dispose();
  }

  bool isGmail() {
    return gmailRegex.hasMatch(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    Widget body() {
      return ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
        children: [
          Text(
            "Ism",
            style: theme.textStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.o,
            ),
          ),
          SizedBox(height: 4.h),
          DefaultTextfield(
            focusNode: nameFocusNode,
            controller: nameController,
            hide: "Ismingizni kiriting",
          ),
          SizedBox(height: 16.h),
          Text(
            "Email",
            style: theme.textStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.o,
            ),
          ),
          SizedBox(height: 4.h),
          DefaultTextfield(
            focusNode: emailFocusNode,
            controller: emailController,
            hide: "Emailingizni kiriting",
          ),
          if (!isGmail() && emailFocusNode.hasFocus)
            Text(
              "Emailingizni to'liq kiriting",
              style: theme.textStyle.copyWith(
                color: theme.errorColor,
                fontWeight: FontWeight.w400,
                fontSize: 12.o,
              ),
            ),
          SizedBox(height: 16.h),
          Text(
            "Parol",
            style: theme.textStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.o,
            ),
          ),
          SizedBox(height: 4.h),
          PasswordTextfiled(
            focusNode: passwordFocusNode,
            controller: passwordController,
            hide: "Parol kiriting",
          ),
          SizedBox(height: 16.h),
          Text(
            "Parolni qaytaring",
            style: theme.textStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 14.o,
            ),
          ),
          SizedBox(height: 4.h),
          PasswordTextfiled(
            focusNode: returnPasswordFocusNode,
            controller: returnPasswordController,
            hide: "Parolni qaytaring",
          ),
        ],
      );
    }

    Widget floatingActionButton() {
      return Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 24.o),
        child: CustomButton(
          title: "asdasdas",
          onTap: () {
            Loading.show(context: context);
          },
        ),
      );
    }

    return Scaffold(
      appBar: theme.appbar,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton(),
      body: Column(children: [
        BackAppbar(onTap: () => pop(context), title: "Ro'yhatdan o'tish"),
        Expanded(child: body()),
      ]),
    );
  }
}
