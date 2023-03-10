import 'package:admere/src/registration/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        if (state == const LocationRequesting()) {
          return const SizedBox(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.black12),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
