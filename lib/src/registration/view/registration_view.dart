import 'package:admere/src/registration/bloc/bloc.dart';
import 'package:admere/src/registration/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is LocationServiceDisabled) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Location Services are disabled!"),
              content: const Text(
                "Autocompletion will not work without enabling Location Services.",
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("okay"),
                ),
              ],
            ),
          );
        } else if (state is LocationAccessDenied) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Location access was denied!"),
              content: const Text(
                "Autocompletion will not work without access to Location Services.",
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("okay"),
                ),
              ],
            ),
          );
        } else if (state is LocationAccessDeniedForever) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Location access was denied forever!"),
              content: const Text(
                "Autocompletion will not work without access to Location Services.\nKindly grant permissions from settings or relaunch the application.",
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("okay"),
                ),
              ],
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Register',
            style: textStyle.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: const [
            CircularLoader(),
            SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: RegistrationForm(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
