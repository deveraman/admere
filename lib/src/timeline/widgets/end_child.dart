import 'package:flutter/material.dart';

class EndChild extends StatelessWidget {
  const EndChild({
    required this.title,
    required this.subtitle,
    this.gap = 36.0,
    super.key,
  });

  final String title;
  final String subtitle;
  final double gap;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        top: gap,
        bottom: 36.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        constraints: const BoxConstraints(
          minHeight: 120,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: textStyle.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigoAccent,
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Text(
                subtitle,
                style: textStyle.bodyLarge!.copyWith(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
