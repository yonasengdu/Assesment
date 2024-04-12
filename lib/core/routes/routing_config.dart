import 'package:assesment/core/constants/routing_constants.dart';
import 'package:assesment/features/hospital/presentation/screens/details_page.dart';
import 'package:assesment/features/hospital/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: RouteConstants.homePageRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        }),
    GoRoute(
        path: '/details',
        name: RouteConstants.detailsPageRouteName,
        builder: (BuildContext context, GoRouterState state) {
          return DetailsPage(id: '');
        }),
  ],
);
