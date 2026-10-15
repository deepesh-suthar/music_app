import 'package:flutter/material.dart';

import 'app.dart';
import 'domain/core/configs/app_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appInitializer(
    const AppConfig(appTitle: 'Jamendo Music', child: SizedBox.shrink()),
  );
}
