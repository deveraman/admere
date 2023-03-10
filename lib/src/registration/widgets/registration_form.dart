import 'package:admere/src/registration/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  bool termsAccepted = false;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _dobController = TextEditingController();

  Future<void> _showDatePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    _dobController.text = '${date?.year}/${date?.month}/${date?.day}';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CustomFormField(
                  controller: _firstNameController,
                  label: 'First Name',
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Flexible(
                child: CustomFormField(
                  controller: _lastNameController,
                  label: 'Last Name',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomFormField(
            controller: _emailController,
            label: 'Email',
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CustomFormField(
                  controller: _firstNameController,
                  label: 'Date of birth',
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: IconButton(
                  onPressed: () => _showDatePicker(context),
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
            controller: _pincodeController,
            label: 'Pincode',
          ),
          const SizedBox(
            height: 16.0,
          ),
          CustomFormField(
            controller: _addressController,
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
              onPressed: termsAccepted ? () {} : null,
              child: const Center(
                child: Text('Submit'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
