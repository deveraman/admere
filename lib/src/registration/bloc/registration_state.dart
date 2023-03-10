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
