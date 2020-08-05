import 'package:flutter/material.dart';
import 'package:flutter_dynamic_theme/theme_demo/theme_demo.dart';
import 'package:flutter_dynamic_theme/theme_demo/app_theme.dart';
import 'package:flutter_dynamic_theme/theme_demo/app_state_notifier.dart';
import 'package:provider/provider.dart';

/*
void main() {
  runApp(MyApp());
}
*/
void main() {
  runApp(
    // ignore: missing_required_param
    ChangeNotifierProvider<AppStateNotifier>(
      create: (context) => AppStateNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateNotifier>(
      builder: (context, appState, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          //darkTheme: ThemeData.dark(),
          themeMode: appState.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          home: ThemeDemo(),
        );
      },
    );
  }
}
