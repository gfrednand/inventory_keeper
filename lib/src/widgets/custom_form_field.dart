// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    this.icon,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String label,
    required String hint,
    String? Function(String?)? validator,
    this.isObscure = false,
    this.enabled = true,
    // this.initialValue,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.isLabelEnabled = true,
    this.inputFormatters,
  })  : _emailController = controller,
        _emailFocusNode = focusNode,
        _keyboardtype = keyboardType,
        _inputAction = inputAction,
        _label = label,
        _hint = hint,
        _validator = validator,
        super(key: key);

  final TextEditingController _emailController;
  final FocusNode _emailFocusNode;
  final TextInputType _keyboardtype;
  final TextInputAction _inputAction;
  final String _label;
  final String _hint;
  final bool isObscure;
  // final String? initialValue;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool isCapitalized;
  final int maxLines;
  final int minLines;
  final bool isLabelEnabled;
  final String? Function(String?)? _validator;
  final Icon? icon;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: widget.initialValue,
      inputFormatters: widget.inputFormatters,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      controller: widget._emailController,
      focusNode: widget._emailFocusNode,
      keyboardType: widget._keyboardtype,
      obscureText: _obscureText && widget.isObscure,
      textCapitalization: widget.isCapitalized
          ? TextCapitalization.words
          : TextCapitalization.none,
      textInputAction: widget._inputAction,
      validator: (String? value) =>
          widget._validator != null ? widget._validator!(value) : null,
      decoration: InputDecoration(
        filled: true,
        labelText: widget.isLabelEnabled ? widget._label : null,
        hintText: widget._hint,
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 2,
          ),
        ),
        suffixIcon: widget.isObscure
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: _toggle,
              )
            : null,
      ),
    );
  }
}
