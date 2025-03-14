import 'package:flutter/material.dart';
import 'package:gitmago/theme/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.textColorOpacity, fontSize: 12),
        filled: true,
        fillColor: AppColors.textColor2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.textColorOpacity),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.textColorOpacity),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: AppColors.textColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: AppColors.textColorOpacity,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
                : widget.controller.text.isNotEmpty
                ? IconButton(
                  icon: Icon(Icons.cancel, color: AppColors.textColorOpacity),
                  onPressed: () {
                    widget.controller.clear();
                    setState(() {}); // Refresh to hide the icon
                  },
                )
                : null,
      ),
      cursorColor: AppColors.textColorOpacity,
      style: TextStyle(color: AppColors.textColorOpacity),
      onChanged: (text) {
        setState(() {}); // Refresh to show/hide the clear icon
      },
    );
  }
}
