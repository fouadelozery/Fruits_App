import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/helper/on_generate_function.dart';
import 'package:e_commerce/core/services/custom_bloc_observer.dart';
import 'package:e_commerce/core/services/get_it.dart';
import 'package:e_commerce/core/services/shared_perfernces.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/splash/splash_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  Bloc.observer = CustomBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  /*
  await GoogleAuthInitializer.init(
    clientId:
        '367245762922-0qe5anj6cp2gm52hb7pktnl09bafrme6.apps.googleusercontent.com',
    serverClientId: 'your-server-client-id',
    onAuthEvent: (event) {
      debugPrint('Google Sign-In Auth Event: $event');
    },
    onAuthError: (error) {
      debugPrint('Google Sign-In Error: $error');
    },
  ); */
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Preferences.init();
  setupGetIt();

  runApp(const FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: AppColors.primaryColor,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'),
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
