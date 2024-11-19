import 'dart:async';

import 'package:flutter/material.dart';
import 'api/tool/build_variant_def.dart';
import 'build/build_tools.dart';
import 'constants/global_variables.dart';
import 'navigation/app_router.dart';
import 'navigation/my_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Building APK always in (release+prod) mode
  BuildVariant.setEnvironment(Environment.appConfigs_m);

  ///Initialize app
  await BuildTools.initializeApp();

  runApp(
    const MyApp(),
  );
}

Future<void> mainFromDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///Initialize app
  await BuildTools.initializeApp();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// This widget is the root of the application.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  String _lastVisitedRoute = MyRoutes.splashRoute;
  Timer? _delayedTimer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scaffoldMessengerKey: GlobalVariables.scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          _lastVisitedRoute = settings.name ?? MyRoutes.splashRoute;
          return AppRouter().onGenerateRoute(settings);
        },
        initialRoute: _lastVisitedRoute,
        navigatorKey: navigatorKey,
        builder: (context, child) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(textScaleFactor: 1), child: child ?? const Placeholder());
        });
  }
}
