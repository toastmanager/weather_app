import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/core/routes/router.dart';
import 'package:weather_app/injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.initDI();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = di.locator<AppRouter>();

    return MaterialApp.router(
      title: 'Weather Forecast App',
      scrollBehavior: CustomScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeDelta: 2,
              fontFamily: GoogleFonts.onest().fontFamily,
            ),
      ),
      routerConfig: appRouter.config(),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
