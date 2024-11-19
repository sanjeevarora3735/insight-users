
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insight_users/pages/home/bloc/home_page_bloc.dart';
import 'package:insight_users/pages/profile/ui/profile_page.dart';

import '../build/splash_screen.dart';
import '../navigation/my_routes.dart';
import '../pages/home/ui/home_page.dart';
import '../theme/my_text_styles.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {

      case MyRoutes.splashRoute:
        return CustomAnimationRoute(builder: (context) => const SplashScreen(), settings: settings);


      case MyRoutes.profilePage:
        return CustomAnimationRoute(builder: (context) => UserProfilePage(args: args,), settings: settings);

      case MyRoutes.homePage:
        return CustomAnimationRoute(builder: (context) => BlocProvider.value( value: HomePageBloc(), child: HomePage(args: args)), settings: settings);

      default:
        return CustomAnimationRoute(
            builder: (context) => const Scaffold(
                  body: Center(
                    child: Text("Page not found", style: MyTextStyles.h2),
                  ),
                ),
            settings: settings);
    }
  }
}

class CustomAnimationRoute extends MaterialPageRoute {
  CustomAnimationRoute({required WidgetBuilder builder, RouteSettings? settings}) : super(builder: builder, settings: settings);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);
}
