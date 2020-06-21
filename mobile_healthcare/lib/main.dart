import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobile_healthcare/common/config/app_configuration.dart';
import 'package:mobile_healthcare/common/config/global_translation.dart';
import 'package:mobile_healthcare/dependencies.dart';
import 'package:mobile_healthcare/home.dart';
import 'package:mobile_healthcare/common/theme/theme_app/theme_bloc.dart';
import 'package:mobile_healthcare/common/theme/theme_app/theme_state.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final rootFolder = await getApplicationDocumentsDirectory();
  final injector = AppDependencies.initialize(rootFolder.path);
  await injector.get<GlobalTranslation>().init();
  await injector.get<AppConfiguration>().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Root of application
  GlobalTranslation translator =
      AppDependencies.injector.get<GlobalTranslation>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          if (state is LoadedThemeState) {
            return MaterialApp(
              color: Theme.of(context).backgroundColor,
              title: "Mobile Project",
              theme: state.themeData,
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              supportedLocales: translator.supportedLocales(),
              initialRoute: getInitialRoute(),
              routes: buildRoutes(),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  String getInitialRoute(){
    return '/';
  }

  Map<String, WidgetBuilder> buildRoutes(){
    return {
      '/': (context) => Home(),
    };
  }
}
