import 'package:flutter/material.dart';
class ItemInSowDepositWitdraw extends StatelessWidget {
  const ItemInSowDepositWitdraw({super.key, required this.title, required this.value});
 final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(child: Text(value, textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}
