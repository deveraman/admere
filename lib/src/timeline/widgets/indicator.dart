import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          title,
          style: textStyle.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.indigoAccent,
          ),
        ),
        Text(
          subtitle,
          style: textStyle.titleSmall!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.indigoAccent,
          ),
        ),
      ],
    );
  }
}
