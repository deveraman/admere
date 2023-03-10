import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationInitial()) {
    on<RequestLocationPermissions>(_onRequestLocationPermissions);
  }

  Future<void> _onRequestLocationPermissions(
    RequestLocationPermissions event,
    Emitter<RegistrationState> emit,
  ) async {
    emit(const LocationRequesting());

    try {
      // final pos = await _determinePosition();
      // final dest = await _determineAddressFromCoordinates(pos.latitude, pos.longitude);

      emit(const LocationAccessGranted());
    } on Exception catch (e) {
      switch (e) {
        case LocationServiceDisabledException():
          emit(const LocationServiceDisabled());
          break;
        case LocationPermissionDeniedException():
          emit(const LocationAccessDenied());
          break;
        case LocationPermissionDeniedForeverException():
          emit(const LocationAccessDeniedForever());
      }
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error(const LocationServiceDisabledException());
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(const LocationPermissionDeniedException());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(const LocationPermissionDeniedForeverException());
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return Geolocator.getCurrentPosition();
  }

  Future<List<Placemark>> _determineAddressFromCoordinates(double lat, double lon) async {
    return placemarkFromCoordinates(lat, lon);
  }
}

class LocationPermissionDeniedException implements Exception {
  const LocationPermissionDeniedException();
}

class LocationPermissionDeniedForeverException implements Exception {
  const LocationPermissionDeniedForeverException();
}
