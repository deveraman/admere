import 'package:admere/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
              onTap: () => context.go(RegistrationScreenRoute().location),
              child: ColoredBox(
                color: Colors.teal,
                child: Center(
                  child: Text(
                    'SET A',
                    style: textStyle.displayLarge!
                        .copyWith(fontWeight: FontWeight.bold),
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
                  child: Text(
                    'SET B',
                    style: textStyle.displayLarge!
                        .copyWith(fontWeight: FontWeight.bold),
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
