# Settings UI for Flutter

<p align="center">
  <img src="https://i.imgur.com/cSWCUsd.png" height="250px" alt="">
  <img src="https://i.imgur.com/N7dSrF9.png" height="250px" alt="">
  <img src="https://i.imgur.com/4POezmu.png" height="250px" alt="">
</p>

## Installing:

In your pubspec.yaml

```yaml
dependencies:
  settings_ui: <latest-version>
```

Then in dart file , do

```
import 'package:keepsettings/keepsettings.dart';
```

## Basic Usage:

```

@override
Widget build(BuildContext context) {
return Scaffold(
  appBar: AppBar(
    shape: BeveledRectangleBorder(),
    toolbarHeight: 60,
    title: Center(child: const Text('Settings UI')),
  ),
  body: Padding(
    padding: const EdgeInsets.only(top: 10),
    child: SafeArea(
      child: settingsList(),
    ),
  ),
);
}
  
Widget settingsList() {
    return SettingsList(
      sections: [
        TilesSection(
          title: 'UI',
          tiles: [
            SettingsTile(
              trailing: Icon(
                CupertinoIcons.forward,
                color: iconColor,
              ),
              title: ' Accent Color',
              leading: Icon(
                Icons.color_lens_outlined,
                color: iconColor,
              ),
              onPressed: (_) {
                showPrimaryColorPicker();
              },
            ),
            SettingsTile.switchTile(
              title: ' Dark Mode',
              leading: Icon(CupertinoIcons.cloud_sun, color: iconColor),
              switchActiveColor: Theme.of(context).accentColor,
              switchValue: tileManager,
              onToggle: toggleDarkMode,
            ),
            SettingsTile.checkListTile(
              leading: Icon(EvaIcons.clock, color: iconColor),
              onChanged: onCheckChanged,
              enabled: checkBoxManager,
              title: 'Slow Down Animations',
            ),
          ],
        ),
        RadioButtonSection(
          title: 'Subscription',
          tiles: [
            RadioButton(
              label: 'Monthly',
              value: RadioButtonOptions.op1,
              groupValue: initialRadioChoice,
              onChanged: onRadioChanged,
            ),
            RadioButton(
              label: 'Yearly',
              value: RadioButtonOptions.op2,
              groupValue: initialRadioChoice,
              onChanged: onRadioChanged,
            ),
            RadioButton(
              label: 'Life Time',
              value: RadioButtonOptions.op3,
              groupValue: initialRadioChoice,
              onChanged: onRadioChanged,
            ),
          ],
        ),
      ],
    );
  }
```

## Example App

https://github.com/ProblematicDude/settings_ui

## Inspired from (Actually Heavily)

https://github.com/yako-dev/flutter-settings-ui

<br>

<p align="center">
  <img src="https://raw.githubusercontent.com/ProblematicDude/settings_ui/master/assets/ui.gif" height="600px" alt="">
</p>
