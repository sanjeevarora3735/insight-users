import '../../utils/log.dart';
import '../build_variant_def.dart';
import '../../main.dart';

void main() {
  BuildVariant.setEnvironment(Environment.appConfigs_m);
  Log(BuildVariant.whereAmI);
  mainFromDelegate();
}
