import 'package:machine_test_zartek/app/helper/colors/app_color.dart';
import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final bool? isEnable;
  final FormFieldValidator? validator;
  final TextInputType? keytype;
  final Widget? prefixIcon;
  final Function? onChanged;
  final TextInputType? textInputType;
  final bool obscureText;
  final Function? suffixIconClick;
  final TextEditingController? textEditingController;
  final Widget? suffixIcon;
  const LoginTextField(
      {super.key,
      this.isEnable,
      this.textInputType,
      this.suffixIconClick,
      this.prefixIcon,
      this.onChanged,
      required this.hintText,
      this.obscureText = false,
      this.textEditingController,
      this.validator,
      this.suffixIcon,
      this.keytype});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.width * 0.18,
      child: TextFormField(
        textAlign: TextAlign.start,
        validator: validator,
        onChanged: onChanged == null
            ? null
            : (String? value) {
                onChanged!(value);
              },
        obscureText: obscureText,
        controller: textEditingController,
        enabled: isEnable ?? true,
        style: const TextStyle(
            fontSize: 17, letterSpacing: 1, fontWeight: FontWeight.w500),
        keyboardType: keytype,
        // TextInputType.number,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.allow(RegExp(r'^[0-9][0-9]*')),
        //   LengthLimitingTextInputFormatter(10),
        // ],

        decoration: InputDecoration(
          fillColor: const Color(0xFFF3F3F3),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontSize: 15,
            fontFamily: "Manrope",
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          isDense: true,
          suffixIcon: suffixIcon == null
              ? null
              : IconButton(
                  onPressed: () => suffixIconClick!(), icon: suffixIcon!),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF3F3F3),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.primaryColor,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF3F3F3),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFF3F3F3),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
          prefixIcon: prefixIcon,
          hintText: hintText,
        ),
      ),
    );
  }
}
