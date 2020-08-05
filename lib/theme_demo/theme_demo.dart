import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dynamic_theme/theme_demo/app_state_notifier.dart';

class ThemeDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ThemeDemoState();
}

class ThemeDemoState extends State<ThemeDemo> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Flutter Themes'),
        leading: Icon(Icons.menu),
        actions: <Widget>[
          Switch(
            value: Provider.of<AppStateNotifier>(context, listen: false)
                .isDarkModeOn,
            onChanged: (boolVal) {
              Provider.of<AppStateNotifier>(context, listen: false)
                  .updateTheme(boolVal);
            },
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, pos) {
            return Card(
              elevation: 0,
              child: ListTile(
                title: Text(
                  'Title $pos',
                ),
                subtitle: Text(
                  'Subtitle $pos',
                ),
                leading: Icon(
                  Icons.alarm,
                  color: Theme.of(context).iconTheme.color,
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
