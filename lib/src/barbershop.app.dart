import 'package:asyncstate/widget/async_state_builder.dart';
import 'package:flutter/material.dart';

import 'core/ui/barbershop.theme.dart';
import 'core/ui/widgets/barbershop.loader.dart';
import 'features/auth/login/login_page.dart';
import 'features/splash/splash_page.dart';

class BarberShopApp extends StatelessWidget {
  const BarberShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarberShopLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          title: 'DW Barbershop',
          theme: BarbershopTheme.themeData,
          navigatorObservers: [asyncNavigatorObserver],
          routes: {
            '/': (context) => const SplashPage(),
            'auth/login': (context) => const LoginPage(),
          },
        );
      },
    );
  }
}
