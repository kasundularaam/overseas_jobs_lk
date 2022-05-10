import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exceptions/route_exception.dart';
import '../../data/models/vacancy.dart';
import '../../logic/cubit/login_cubit/login_cubit.dart';
import '../../logic/cubit/organization_cubit/organization_cubit.dart';
import '../../logic/cubit/register_cubit/register_cubit.dart';
import '../screens/auth/login_page.dart';
import '../screens/auth/register_page.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/landing_screen/landing_page.dart';
import '../screens/vacancy_screen/vacancy_page.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String homeScreen = '/homeScreen';
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';
  static const String vacancyPage = '/vacancyPage';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(
          builder: (_) => const LandingPage(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginPage(),
          ),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterPage(),
          ),
        );
      case vacancyPage:
        final Vacancy vacancy = settings.arguments as Vacancy;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OrganizationCubit(),
            child: VacancyPage(
              vacancy: vacancy,
            ),
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
