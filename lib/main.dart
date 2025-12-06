import 'package:e_commerce/core/helper/on_generate_function.dart';
import 'package:e_commerce/core/services/custom_bloc_observer.dart';
import 'package:e_commerce/core/services/get_it.dart';
import 'package:e_commerce/core/services/shared_perfernces.dart';
import 'package:e_commerce/core/utiles/colors.dart';
import 'package:e_commerce/features/home/presentation/cubits/card_cubit/cart_cubit.dart';
import 'package:e_commerce/features/splash/splash_view.dart';
import 'package:e_commerce/generated/l10n.dart'; // intl generated file
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = CustomBlocObserver();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Preferences.init();
  setupGetIt();

  runApp(const FruitsApp());
}

/// لو عندك ThemeCubit في ملف تاني "ما تعرّفوش هنا تاني"
class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(false) {
    AppColors.setLightMode();
  }

  void toggleTheme() {
    final isDark = !state;

    if (isDark) {
      AppColors.setDarkMode();
    } else {
      AppColors.setLightMode();
    }

    emit(isDark);
  }
}

/// Cubit مسؤولة عن اللغة
class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(const Locale('ar')); // افتراضي عربي

  void setArabic() => emit(const Locale('ar'));

  void setEnglish() => emit(const Locale('en'));
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
        BlocProvider<CartCubit>(create: (_) => CartCubit()),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, bool>(
            builder: (context, isDark) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,

                // ✅ Localization
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: locale,

                // ✅ Theme
                themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
                theme: ThemeData(
                  fontFamily: 'Cairo',
                  primaryColor: AppColors.primaryColor,
                  brightness: Brightness.light,
                ),
                darkTheme: ThemeData(
                  fontFamily: 'Cairo',
                  primaryColor: AppColors.primaryColor,
                  brightness: Brightness.dark,
                  scaffoldBackgroundColor: const Color(0xFF121212),
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(color: Colors.white),
                    bodyMedium: TextStyle(color: Colors.white),
                    bodySmall: TextStyle(color: Colors.white),
                    titleLarge: TextStyle(color: Colors.white),
                    titleMedium: TextStyle(color: Colors.white),
                    titleSmall: TextStyle(color: Colors.white),
                    labelLarge: TextStyle(color: Colors.white),
                    labelMedium: TextStyle(color: Colors.white),
                    labelSmall: TextStyle(color: Colors.white),
                  ),
                ),

                onGenerateRoute: onGenerateRoute,
                initialRoute: SplashView.routeName,
              );
            },
          );
        },
      ),
    );
  }
}
