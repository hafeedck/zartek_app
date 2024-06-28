import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String? hintText;
  final bool? isEnable;
  final FormFieldValidator? validator;
  final Function? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? expands;
  final Function? onTap;
  final TextInputType? textInputType;
  final bool obscureText;
  final Function? suffixIconClick;
  final TextEditingController? textEditingController;
  final bool readonly;
  const CommonTextField(
      {super.key,
      this.hintText,
      this.isEnable,
      this.readonly = false,
      this.validator,
      this.prefixIcon,
      this.textInputType,
      this.onChanged,
      this.obscureText = false,
      this.expands = false,
      this.suffixIconClick,
      this.textEditingController,
      this.suffixIcon,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly,
      textAlign: TextAlign.start,
      validator: validator,
      obscureText: obscureText,
      controller: textEditingController,
      enabled: isEnable ?? true,
      style: const TextStyle(fontSize: 16),
      expands: expands!,
      maxLines: null,
      onChanged: onChanged == null
          ? null
          : (String? value) {
              onChanged!(value);
            },
      onTap: onTap == null
          ? null
          : () {
              FocusScope.of(context).requestFocus(FocusNode());
              onTap!();
            },
      // keyboardType: textInputType,
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.allow(RegExp(r'^[0-9][0-9]*')),
      //   LengthLimitingTextInputFormatter(10),
      // ],
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.8),
          fontFamily: 'Manrope',
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        fillColor: const Color(0xFF8C8C8C).withOpacity(0.1),
        // contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.8),
          fontSize: 14,
          fontFamily: "Manrope",
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        isDense: true,

        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color(0xFF8C8C8C).withOpacity(0.1)),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color(0xFF8C8C8C).withOpacity(0.1)),
          borderRadius: BorderRadius.circular(25.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color(0xFF8C8C8C).withOpacity(0.1)),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color(0xFF8C8C8C).withOpacity(0.1)),
          borderRadius: BorderRadius.circular(25.0),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        hintText: hintText,
      ),
    );
  }
}

class CommonTextField1 extends StatelessWidget {
  final String? hintText;
  final bool? isEnable;
  final FormFieldValidator? validator;
  final Function? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? expands;
  final Function? onTap;
  final TextInputType? textInputType;
  final bool obscureText;
  final Function? suffixIconClick;
  final TextEditingController? textEditingController;
  final bool readonly;
  const CommonTextField1(
      {super.key,
      this.hintText,
      this.isEnable,
      this.readonly = false,
      this.validator,
      this.prefixIcon,
      this.textInputType,
      this.obscureText = false,
      this.expands = false,
      this.suffixIconClick,
      this.textEditingController,
      this.suffixIcon,
      this.onTap,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly,
      textAlign: TextAlign.start,
      validator: validator,
      obscureText: obscureText,
      controller: textEditingController,
      onChanged: onChanged == null
          ? null
          : (String? value) {
              onChanged!(value);
            },
      enabled: isEnable ?? true,
      style: const TextStyle(fontSize: 16),
      expands: expands!,
      maxLines: null,
      onTap: onTap == null
          ? null
          : () {
              FocusScope.of(context).requestFocus(FocusNode());
              onTap!();
            },
      keyboardType: textInputType,
      // inputFormatters: <TextInputFormatter>[
      //   FilteringTextInputFormatter.allow(RegExp(r'^[0-9][0-9]*')),
      //   LengthLimitingTextInputFormatter(10),
      // ],
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.8),
          fontFamily: 'Manrope',
          fontSize: 14.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
        ),
        fillColor: Colors.white,
        // contentPadding: EdgeInsets.symmetric(horizontal: 15),
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.8),
          fontSize: 14,
          fontFamily: "Manrope",
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        isDense: true,

        border: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color(0xFF8C8C8C).withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color(0xFF8C8C8C).withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color(0xFF8C8C8C).withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: const Color(0xFF8C8C8C).withOpacity(0.5)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        hintText: hintText,
      ),
    );
  }
}
