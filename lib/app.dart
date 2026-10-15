import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'domain/core/configs/app_config.dart';
import 'presentation/music/music_screen.dart';
import 'presentation/theme/app_theme.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppStateNotifier>(context);
    return MaterialApp(
      title: appState.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const MusicScreen(),
    );
  }
}

void appInitializer(AppConfig appConfig) {
  final appStateNotifier = AppStateNotifier(appTitle: appConfig.appTitle);
  runApp(
    AppConfig(
      appTitle: appConfig.appTitle,
      child: ChangeNotifierProvider<AppStateNotifier>.value(
        value: appStateNotifier,
        child: ResponsiveSizer(builder: (_, _, _) => const MainApp()),
      ),
    ),
  );
}
