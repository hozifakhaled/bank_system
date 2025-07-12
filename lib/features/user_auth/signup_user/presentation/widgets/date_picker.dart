import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';


class DatePickerField extends StatefulWidget {
  final void Function(String)? onDateSelected;

  const DatePickerField({Key? key, this.onDateSelected}) : super(key: key);

  @override
  State<DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  String? _selectedDate;

  void _showDatePicker() {
    DatePicker.showDatePicker(
      context,
      pickerTheme: const DateTimePickerTheme(
        showTitle: true,
      ),
      minDateTime: DateTime(1900),
      maxDateTime: DateTime.now(),
      initialDateTime: DateTime(2000),
      dateFormat: 'dd-MM-yyyy',
      locale: DateTimePickerLocale.en_us,
      onConfirm: (dateTime, _) {
        final formatted = DateFormat('yyyy-MM-dd').format(dateTime);
        setState(() => _selectedDate = formatted);
        if (widget.onDateSelected != null) {
          widget.onDateSelected!(formatted);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showDatePicker,
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            hintText: _selectedDate ?? 'Date of Birth',
            suffixIcon: const Icon(Icons.calendar_today),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
