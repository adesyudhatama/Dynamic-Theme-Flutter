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
          itemCount: 15,
          itemBuilder: (context, pos) {
            return Card(
              elevation: 0,
              child: ListTile(
                title: Text(
                  'Title $pos',
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Text(
                  'Subtitle $pos',
                  style: Theme.of(context).textTheme.subtitle2,
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
