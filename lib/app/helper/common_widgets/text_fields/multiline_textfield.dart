import 'package:flutter/material.dart';

class MultilineTextField extends StatelessWidget {
  final String hintText;
  final Function? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FormFieldValidator? validator;
  const MultilineTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.onChanged,
      this.validator,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        autofocus: false,
        style: const TextStyle(fontSize: 13),
        onChanged: onChanged == null
            ? null
            : (value) {
                onChanged!(value);
              },
        maxLines: null,
        controller: controller,
        minLines: null,
        expands: true,
        validator: validator,
        focusNode: focusNode,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.top,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ));
  }
}
