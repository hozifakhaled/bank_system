import 'package:flutter/material.dart';

class EditableFieldWidget extends StatelessWidget {
  final String label;
  final String initialValue;
  final TextEditingController? controller;

  const EditableFieldWidget({
    super.key,
    required this.label,
    required this.initialValue,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final textController = controller ?? TextEditingController(text: initialValue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
