import 'package:data_managing_app/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'constants/app_theme.dart';

final appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.1);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return ProviderScope(
          child: MaterialApp.router(
            supportedLocales: const [
              Locale('en'),
              Locale('he'),
            ],
            localeResolutionCallback: (locale, supportedLocales) {
              return const Locale("en");
            },
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              DefaultMaterialLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            theme: AppTheme.data(context),
            routerConfig: appRouter.route,
          ),
        );
      }),
    );
  }
}
