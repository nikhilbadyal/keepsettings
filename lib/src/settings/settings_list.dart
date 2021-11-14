import 'package:flutter/material.dart';
import 'package:keepsettings/src/settings/abstract_section.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({Key? key, this.sections, this.appInfo}) : super(key: key);

  final List<AbstractSection>? sections;
  final String? appInfo;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: sections!.length,
          itemBuilder: (context, index) {
            final current = sections![index];
            AbstractSection? futureOne;
            if (index + 1 != sections!.length) {
              futureOne = sections![index + 1];
            }
            if (futureOne != null && futureOne.title != null) {
              current.showBottomDivider = false;
              return current;
            } else {
              current.showBottomDivider = true;
              return current;
            }
          },
        ),
      ),
    );
  }
}
