import 'package:flutter/material.dart';

class GenderDropdown extends StatefulWidget {
  final void Function(String)? onChanged;

  const GenderDropdown({super.key, this.onChanged});

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      items: const [
        DropdownMenuItem(value: 'Male', child: Text('Male')),
        DropdownMenuItem(value: 'Female', child: Text('Female')),
      ],
      onChanged: (value) {
        setState(() => selectedGender = value);
        if (widget.onChanged != null) widget.onChanged!(value!);
      },
      decoration: const InputDecoration(
        labelText: 'Gender',
        border: OutlineInputBorder(),
      ),
    );
  }
}
