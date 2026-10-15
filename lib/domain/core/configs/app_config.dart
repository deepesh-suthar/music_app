import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  const AppConfig({required this.appTitle, required super.child, super.key});

  final String appTitle;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(AppConfig oldWidget) =>
      appTitle != oldWidget.appTitle;
}

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier({required this.appTitle, this.isOffline = false});

  final String appTitle;
  bool isOffline;

  void updateNetworkState({required bool isOffline}) {
    if (this.isOffline == isOffline) return;
    this.isOffline = isOffline;
    notifyListeners();
  }
}
