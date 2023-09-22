import 'package:practical/api_service/repository.dart';
import 'package:practical/pages/dashbord/bloc/dashbord_bloc.dart';
import 'package:practical/pages/dashbord/dashbord_screen.dart';
import 'package:practical/pages/lead_page/bloc/lead_page_bloc.dart';
import 'package:practical/pages/lead_page/leadPage_screen.dart';
import 'package:practical/pages/login/bloc/login_bloc.dart';
import 'package:practical/pages/login/login_screen.dart';
import 'package:practical/pages/profile/bloc/profile_bloc.dart';
import 'package:practical/pages/profile/profile_screen.dart';
import 'package:practical/pages/register/bloc/register_bloc.dart';
import 'package:practical/pages/register/register_screen.dart';
import 'package:practical/pages/splash/bloc/splash_bloc.dart';
import 'package:practical/pages/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const routeSplash = '/splash';
const routelogin = '/login';
const routeRegister = '/register';
const routeDashboard = '/Dashboard';
const routeUserProfile = '/UserProfile';
const routeLeadPage = '/LeadPage';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routeSplash:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => BlocProvider(
                  create: (create) => SplashBloc()..add(OpenScreenEvent()),
                  child: const SplashScreen(),
                ));
      case routelogin:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => BlocProvider(
                  create: (create) => LoginBloc(),
                  child: LoginScreen(),
                ));
      case routeRegister:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => BlocProvider(
                  create: (create) => RegisterBloc(),
                  child: RegisterScreen(),
                ));
      case routeDashboard:
        final arg = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => BlocProvider(
                  create: (create) => DashbordBloc()..add(InitEvent(arg)),
                  child: const DashbordScreen(),
                ));
      case routeUserProfile:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => BlocProvider(
                  create: (create) => ProfileBloc()..add(ProfileInitEvent()),
                  child: const ProfileScreen(),
                ));
      case routeLeadPage:
        return MaterialPageRoute(
            settings: settings,
            builder: (context) => BlocProvider(
                  create: (create) => LeadPageBloc()..add(LeadInitEvent()),
                  child: const LeadPageScreen(),
                ));
    }
  }
}
