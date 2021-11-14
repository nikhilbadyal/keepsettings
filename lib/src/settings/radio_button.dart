import 'package:flutter/material.dart';
import 'package:keepsettings/src/settings/abstract_section.dart';
import 'package:keepsettings/src/settings/settings_tiles.dart';

/// Represent a radio button in Radio Button section
class RadioButton<T> extends StatelessWidget {
  /// Constructor
  const RadioButton({
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    this.padding = const EdgeInsets.symmetric(horizontal: 5),
    this.activeColor,
    Key? key,
    this.secondary,
    this.listTileControlAffinity = ListTileControlAffinity.leading,
    this.subLabel,
  }) : super(key: key);

  /// Radio button label/description
  final String label;

  /// Radio button sub-label
  final String? subLabel;

  /// To pad the label
  final EdgeInsets padding;

  /// Group value
  final T groupValue;
  final T value;
  final void Function(T?) onChanged;
  final Color? activeColor;
  final Widget? secondary;
  final ListTileControlAffinity listTileControlAffinity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: RadioListTile<T>(
        controlAffinity: listTileControlAffinity,
        onChanged: onChanged,
        groupValue: groupValue,
        secondary: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: secondary,
        ),
        activeColor: activeColor ?? Theme.of(context).colorScheme.secondary,
        value: value,
        title: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            label,
            style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
                fontWeight: FontWeight.w300),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: subLabel != null
            ? Text(
                subLabel!,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        contentPadding: padding,
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
                color: Theme.of(context).textTheme.headline1!.color,
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
