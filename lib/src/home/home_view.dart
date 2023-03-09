import 'dart:ui';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => {},
              child: ColoredBox(
                color: Colors.teal,
                child: Center(
                  child: Text('SET A', style: textStyle.displayLarge!.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => {},
              child: ColoredBox(
                color: Colors.greenAccent,
                child: Center(
                  child: Text('SET B', style: textStyle.displayLarge!.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
