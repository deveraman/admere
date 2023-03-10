import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.value,
    required this.onChanged,
    required this.validator,
    required this.label,
    super.key,
  });

  final String value;
  final String label;
  final void Function(String? value) onChanged;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textStyle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        FormField(
          builder: (field) {
            return TextFormField(
              initialValue: value,
              onChanged: onChanged,
              validator: validator,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            );
          },
        ),
      ],
    );
  }
}
