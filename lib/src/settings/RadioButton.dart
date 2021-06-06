import 'package:flutter/material.dart';
import 'package:keepsettings/src/settings/AbstractSection.dart';
import 'package:keepsettings/src/settings/SettingsTiles.dart';

class RadioButton<T> extends StatelessWidget {
  const RadioButton(
      {required this.label,
      required this.groupValue,
      required this.value,
      required this.onChanged,
      this.padding = const EdgeInsets.symmetric(horizontal: 5),
      Key? key})
      : super(key: key);
  final String label;
  final EdgeInsets padding;
  final T groupValue;
  final T value;
  final void Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<T>(
              activeColor: Theme.of(context).accentColor,
              groupValue: groupValue,
              value: value,
              onChanged: onChanged,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RadioButtonSection extends AbstractSection {
  RadioButtonSection({required this.tiles, required title, Key? key})
      : super(key: key, title: title, titlePadding: defaultTitlePadding);

  final List<RadioButton> tiles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (title != null)
          Padding(
            padding: titlePadding!,
            child: Text(
              title!,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tiles.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            return tiles[index];
          },
        ),
        if (showBottomDivider) const Divider(height: 1)
      ]),
    );
  }
}
