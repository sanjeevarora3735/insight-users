import 'package:get_it/get_it.dart';
import '../utils/session_manager.dart';

class UserSessionHandler {
  static Future<bool> logoutUser() async {
    GetIt locator = GetIt.instance;
    await locator.get<SessionManager>().logout();
    return await locator.get<SessionManager>().logout() ?? false;
  }
}
