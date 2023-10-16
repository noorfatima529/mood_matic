import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final String? hintText;
  final Image? prefixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const TextInput(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.controller,
      this.onChanged});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFFE4DEDE),
                width: 0.5,
              ),
            ),
            prefixIcon: widget.prefixIcon,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Color(0xFFB3B1B1),
              fontSize: 15,
              fontFamily: 'Airbnb Cereal App',
              fontWeight: FontWeight.w500,
            ),
          )),
    );
  }
}
