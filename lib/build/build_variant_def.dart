enum Environment {
  appConfigs_m,
}

class BuildVariant {
  static Map<String, dynamic> _config = _Config.appConfigs_m;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.appConfigs_m:
        _config = _Config.appConfigs_m;
        break;
    }
  }

  static get baseUrl {
    return _config[_Config.baseUrl];
  }

  static get whereAmI {
    return _config[_Config.whereAmI];
  }

  static get isRelease {
    return _config[_Config.isRelease];
  } 
}

class _Config {
  static const baseUrl = "SERVER_ONE";
  static const whereAmI = "WHERE_AM_I";
  static const isRelease = "IS_IN_RELEASE";
 
  static Map<String, dynamic> appConfigs_m = {
    baseUrl: "https://jsonplaceholder.typicode.com/",
    whereAmI: "release_mode",
    isRelease: false,
  }; 
}
