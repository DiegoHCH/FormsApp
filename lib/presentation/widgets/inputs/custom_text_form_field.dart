import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? labelMessage;
  final String? hintMessage;
  final String? errorMessage;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;


  const CustomTextFormField({
    super.key,
    this.labelMessage, 
    this.hintMessage, 
    this.errorMessage, 
    this.obscureText = false,
    this.onChanged, 
    this.validator,
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      //borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(50)
    );

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: BorderSide(color: colors.primary)),
        errorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder: border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),

        isDense: true,
        label: labelMessage != null ? Text(labelMessage!) : null,
        hintText: hintMessage,
        errorText: errorMessage,
        focusColor: colors.primary,
        //prefixIcon: Icon(Icons.supervised_user_circle_outlined, color: colors.primary,)
      ),
    );
  }
}