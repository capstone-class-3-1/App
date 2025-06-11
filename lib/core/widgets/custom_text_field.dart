import 'package:flutter/material.dart';
import 'package:gitmago/core/theme/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool showClearButton;
  final bool showVisibilityToggle;
  final Widget? prefixIcon;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.showClearButton = true,
    this.showVisibilityToggle = false,
    this.prefixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    widget.controller.addListener(_handleTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTextChanged);
    super.dispose();
  }

  void _handleTextChanged() {
    setState(() {
      _hasText = widget.controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
        ),
        filled: true,
        fillColor: Colors.grey[100],
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_hasText && widget.showClearButton)
              IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () => widget.controller.clear(),
              ),
            if (widget.showVisibilityToggle)
              IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
          ],
        ),
      ),
      cursorColor: AppColors.primaryColor,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
    );
  }
}
