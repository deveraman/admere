import 'package:admere/src/home/home_view.dart';
import 'package:admere/src/registration/registration.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeScreenRoute>(
  path: '/',
  routes: [
    TypedGoRoute<RegistrationScreenRoute>(path: 'register'),
  ],
)
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeView();
  }
}

class RegistrationScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegistrationPage();
  }
}
