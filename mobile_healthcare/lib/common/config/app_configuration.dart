import 'package:global_configuration/global_configuration.dart';

class AppConfiguration {
  Future init([String env]) async {
    var file = "app_settings";
    if (env != null) {
      file = file + "_" + env;
    }
    await GlobalConfiguration().loadFromAsset(file);
  }

  int get dbVersion => GlobalConfiguration().getInt("dbVersion");
  String get dbScriptPath => GlobalConfiguration().getString("dbScriptPath");
  String get dbPassword => GlobalConfiguration().getString("dbPassword");
  String get domain => GlobalConfiguration().getString("domain");
}
