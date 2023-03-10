part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {
  const RegistrationInitial();

  @override
  List<Object> get props => [];
}

class LocationRequesting extends RegistrationState {
  const LocationRequesting();

  @override
  List<Object> get props => [];
}

class LocationServiceDisabled extends RegistrationState {
  const LocationServiceDisabled();

  @override
  List<Object> get props => [];
}

class LocationAccessDenied extends RegistrationState {
  const LocationAccessDenied();

  @override
  List<Object> get props => [];
}

class LocationAccessDeniedForever extends RegistrationState {
  const LocationAccessDeniedForever();

  @override
  List<Object> get props => [];
}

class LocationAccessGranted extends RegistrationState {
  const LocationAccessGranted();

  @override
  List<Object> get props => [];
}

// Form State for watching form field changes and autocompleting
class RegistrationFormState extends RegistrationState {
  const RegistrationFormState({
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

class RegistrationFormValidated extends RegistrationState {
  const RegistrationFormValidated();

  @override
  List<Object> get props => [];
}
