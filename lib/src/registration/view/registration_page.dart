import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admere/src/registration/registration.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegistrationBloc(),
      child: const RegistrationView(),
    );
  }
}
