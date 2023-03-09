import 'package:flutter/material.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final _formKey = GlobalKey<FormState>();
  bool termsAccepted = false;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _countryController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _dobController = TextEditingController();

  final list = [
    '',
    'Australia',
    'Netherlands',
    'Russia',
    'New York',
    'India',
  ];

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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
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
                    CountryPickerField(
                      controller: _countryController,
                      items: list,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    required this.controller,
    required this.label,
    super.key,
  });

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textStyle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        FormField(
          builder: (field) {
            return TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class CountryPickerField extends StatelessWidget {
  const CountryPickerField({
    required this.controller,
    required this.items,
    super.key,
  });

  final TextEditingController controller;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Country',
          style: textStyle,
        ),
        const SizedBox(
          height: 8.0,
        ),
        DropdownButtonFormField(
          value: '',
          items: items
              .map(
                (countryName) => DropdownMenuItem(
                  value: countryName,
                  child: Text(countryName),
                ),
              )
              .toList(),
          onChanged: (value) {
            controller.text = value ?? '';
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
