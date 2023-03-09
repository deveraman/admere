part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationInitialized extends RegistrationEvent {
  const RegistrationInitialized();

  @override
  List<Object> get props => [];
}
