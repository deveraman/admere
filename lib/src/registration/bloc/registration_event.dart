part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RequestLocationPermissions extends RegistrationEvent {
  const RequestLocationPermissions();

  @override
  List<Object> get props => [];
}

class LocationPermissionsDenied extends RegistrationEvent {
  const LocationPermissionsDenied();

  @override
  List<Object> get props => [];
}

class RegistrationFormChanged extends RegistrationEvent {
  const RegistrationFormChanged({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.dob = '',
    this.country = '',
    this.pincode = '',
    this.address = '',
  });

  final String firstName;
  final String lastName;
  final String email;
  final String dob;
  final String country;
  final String pincode;
  final String address;

  @override
  List<Object> get props => [
        firstName,
        lastName,
        email,
        dob,
        country,
        pincode,
        address,
      ];
}

class RegistrationFormValidate extends RegistrationEvent {
  const RegistrationFormValidate({required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  List<Object> get props => [formKey];
}
