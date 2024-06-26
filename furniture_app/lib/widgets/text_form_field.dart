import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
  Created By : Jainil Dalwadi
  Purpose : Custom Textform field
 */
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.color,
      required this.textInputType,
      required this.labelText,
      this.showIcon,
      this.maxLength,
      this.validation,
      this.focusNode});

  final bool? showIcon;
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final Color? color;
  final TextInputType? textInputType;
  final int? maxLength;
  final Function? validation;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: (focusNode != null) ? focusNode : null,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium,
        fillColor: Theme.of(context).hoverColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
      ),
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // ignore: body_might_complete_normally_nullable
      validator: (value) {
        if (value!.isEmpty) {
          return "Field is mandatory";
        }

        if (textInputType == TextInputType.emailAddress) {
          if (!value.isEmail) {
            return "Invalid email address";
          }
        }

        if (textInputType == TextInputType.phone) {
          if (value.isPhoneNumber) {
            return "Invalid Phone number";
          }
        }

        return null;
      },
    );
  }
}
