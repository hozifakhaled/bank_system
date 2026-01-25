import 'package:flutter/material.dart';

class AccountFieldWidget extends StatelessWidget {
  final String label;
  final bool isDropdown;
  final List<String>? options;

  const AccountFieldWidget({
    super.key,
    required this.label,
    this.isDropdown = false,
    this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        const SizedBox(height: 8),
        isDropdown
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: DropdownButton<String>(
                  items: options
                          ?.map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList() ??
                      [],
                  onChanged: (val) {},
                  hint: const Text('Select account'),
                  isExpanded: true,
                  underline: const SizedBox(),
                ),
              )
            : TextField(
                decoration: InputDecoration(
                  hintText: 'Enter $label',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
        const SizedBox(height: 16),
      ],
    );
  }
}
