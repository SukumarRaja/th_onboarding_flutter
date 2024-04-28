import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.obscureText,
      this.maxLength,
      this.errorText,
      this.maxLines = 1,
      this.textAlign = false,
      this.keyboardType = TextInputType.text})
      : super(key: key);
  final String hintText;
  final String? errorText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? textAlign;
  final int? maxLength;
  final int? maxLines;
  final TextInputType keyboardType;

  @override
  State<CommonTextFormField> createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        style: const TextStyle(
          fontFamily: "",
          fontSize: 14,
        ),
        validator: widget.validator,
        cursorColor: Theme.of(context).primaryColor,
        controller: widget.controller,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        textAlign:
            widget.textAlign == true ? TextAlign.center : TextAlign.start,
        obscuringCharacter: "*",
        obscureText: widget.obscureText == true ? !passwordVisible : false,
        decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).primaryColor.withOpacity(.090),
            hintText: widget.hintText,
            errorText: widget.errorText,
            errorStyle: TextStyle(
                fontWeight: FontWeight.w400,
                color: Theme.of(context).cardColor),
            hintStyle: TextStyle(
                fontFamily: "medium",
                color: Theme.of(context).hintColor,
                fontSize: 14),
            counterText: "",
            contentPadding: const EdgeInsets.only(left: 15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor.withOpacity(.00),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).primaryColor, width: 2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error, width: 1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            suffixIcon: showPassword()),
      ),
    );
  }

  bool passwordVisible = false;

  Widget showPassword() {
    if (widget.obscureText == true) {
      return ButtonTheme(
          child: TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
              child: Icon(
                passwordVisible == true
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: Theme.of(context).hintColor.withOpacity(.3),
              )));
    } else {
      return const SizedBox.shrink();
    }
  }
}
