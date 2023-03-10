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
