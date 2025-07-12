import 'package:flutter/material.dart';

class MaritalStatusDropdown extends StatefulWidget {
  final void Function(String)? onChanged;

  const MaritalStatusDropdown({super.key, this.onChanged});

  @override
  State<MaritalStatusDropdown> createState() => _MaritalStatusDropdownState();
}

class _MaritalStatusDropdownState extends State<MaritalStatusDropdown> {
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedStatus,
      items: const [
        DropdownMenuItem(value: 'Single', child: Text('Single')),
        DropdownMenuItem(value: 'Married', child: Text('Married')),
        DropdownMenuItem(value: 'Divorced', child: Text('Divorced')),
        DropdownMenuItem(value: 'Widowed', child: Text('Widowed')),
      ],
      onChanged: (value) {
        setState(() => selectedStatus = value);
        if (widget.onChanged != null) widget.onChanged!(value!);
      },
      decoration: const InputDecoration(
        labelText: 'Marital Status',
        border: OutlineInputBorder(),
      ),
    );
  }
}
