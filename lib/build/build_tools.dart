
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../api/client/api_client.dart';
import '../api/client/rest_client.dart';
import '../constants/global_variables.dart';
import '../utils/app_utils.dart';
import '../utils/log.dart';
import '../utils/session_manager.dart';

class BuildTools {
  static Future<void> initializeApp() async {
    Log.i("App Utils initializeApp Starts ...");
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    GetIt locator = GetIt.instance;

    /// To initialize the ApiClient.
    if (!locator.isRegistered<RestClient>()) {
      locator.registerSingleton<RestClient>(getApiClient());
    }

    /// To initialize the SessionManager.
    if (!locator.isRegistered<SessionManager>()) {
      locator.registerSingleton<SessionManager>(SessionManager());
      await locator.get<SessionManager>().init();
    }


    Log.i("App Utils Initialising Success ...");
  }

}
