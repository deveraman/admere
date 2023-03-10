import 'package:admere/src/registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationBloc()
        ..add(
          const RequestLocationPermissions(),
        ),
      child: const RegistrationView(),
    );
  }
}
