import 'package:admere/routes/routes.dart';
import 'package:admere/src/registration/bloc/bloc.dart';
import 'package:admere/src/registration/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if (state is RegistrationFormValidated) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Registration Successful!"),
              content: const Center(
                child: Flexible(
                  child: RegistrationSuccess(),
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    context.go(HomeScreenRoute().location);
                  },
                  child: const Text("Go Back"),
                ),
              ],
            ),
          );
        }
      },
      child: BlocBuilder<RegistrationBloc, RegistrationState>(
        builder: (context, state) {
          void updateDobField(String value) {
            context.read<RegistrationBloc>().add(
                  RegistrationFormChanged(dob: value),
                );
          }

          if (state is RegistrationFormState) {
            return Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: CustomFormField(
                          value: state.firstName,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Field cannot be empty";
                            }

                            return null;
                          },
                          onChanged: (String? value) {
                            context.read<RegistrationBloc>().add(
                                  RegistrationFormChanged(
                                      firstName: value ?? ''),
                                );
                          },
                          label: 'First Name',
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Flexible(
                        child: CustomFormField(
                          value: state.lastName,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Field cannot be empty";
                            }

                            return null;
                          },
                          onChanged: (String? value) {
                            context.read<RegistrationBloc>().add(
                                  RegistrationFormChanged(
                                      firstName: value ?? ''),
                                );
                          },
                          label: 'Last Name',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomFormField(
                    value: state.email,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }

                      // Best way to validate email is to send an email to the address.
                      final emailRegExp = RegExp(
                        r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
                      );

                      if (!emailRegExp.hasMatch(value)) {
                        return "Please enter a valid email";
                      }

                      return null;
                    },
                    onChanged: (String? value) {
                      context.read<RegistrationBloc>().add(
                            RegistrationFormChanged(firstName: value ?? ''),
                          );
                    },
                    label: 'Email',
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // TODO: Fix DOB field not updating from DatePicker.
                      //
                      // Context: Doesn't show changes in the field if a date is chosen from the calendar.
                      Flexible(
                        child: CustomFormField(
                          value: state.dob,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Field cannot be empty";
                            }

                            return null;
                          },
                          onChanged: (String? value) {
                            context.read<RegistrationBloc>().add(
                                  RegistrationFormChanged(
                                      dob: value ?? state.dob),
                                );
                          },
                          label: 'Date of birth',
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: IconButton(
                          onPressed: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );

                            updateDobField(
                                '${date?.year}/${date?.month}/${date?.day}');
                          },
                          icon: const Icon(
                            Icons.calendar_today,
                            size: 36,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomFormField(
                    value: state.country,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }

                      return null;
                    },
                    onChanged: (String? value) {
                      context.read<RegistrationBloc>().add(
                            RegistrationFormChanged(
                                country: value ?? state.country),
                          );
                    },
                    label: 'Country',
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomFormField(
                    value: state.pincode,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }

                      final regEx = RegExp(r'^\d');

                      if (!regEx.hasMatch(value)) {
                        return "Pincode can only contain numbers";
                      }

                      if (value.length != 6) {
                        return "Pincode must be of 6 digits";
                      }

                      return null;
                    },
                    onChanged: (String? value) {
                      context.read<RegistrationBloc>().add(
                            RegistrationFormChanged(
                                firstName: value ?? state.pincode),
                          );
                    },
                    label: 'Pincode',
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomFormField(
                    value: state.address,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Field cannot be empty";
                      }

                      return null;
                    },
                    onChanged: (String? value) {
                      context.read<RegistrationBloc>().add(
                            RegistrationFormChanged(
                                address: value ?? state.address),
                          );
                    },
                    label: 'Address',
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  CheckboxListTile(
                    value: termsAccepted,
                    onChanged: (value) {
                      setState(() {
                        termsAccepted = !termsAccepted;
                      });
                    },
                    subtitle: const Text.rich(
                      TextSpan(
                        text: 'I hereby accept all ',
                        children: [
                          TextSpan(
                            text: 'terms and policies ',
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text: 'of this contest',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: termsAccepted
                          ? () {
                              context.read<RegistrationBloc>().add(
                                    RegistrationFormValidate(formKey: _formKey),
                                  );
                            }
                          : null,
                      child: const Center(
                        child: Text('Submit'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
