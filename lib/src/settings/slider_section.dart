import 'package:flutter/material.dart';
import 'package:keepsettings/src/settings/abstract_section.dart';
import 'package:keepsettings/src/settings/settings_tiles.dart';

class SliderTile extends StatelessWidget {
  const SliderTile({
    required this.initialSliderValue,
    required this.onSliderChange,
    required this.min,
    required this.max,
    this.division,
    this.activeColor,
    this.inactiveColor,
    Key? key,
  }) : super(key: key);

  final double initialSliderValue;
  final Function(double value)? onSliderChange;
  final double min;

  final double max;
  final int? division;

  final Color? activeColor;
  final Color? inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: activeColor ?? Theme.of(context).colorScheme.secondary,
      inactiveColor: inactiveColor ?? Colors.grey,
      value: initialSliderValue,
      onChanged: onSliderChange,
      max: max,
      divisions: division ?? (max - min).round(),
      label: initialSliderValue.round().toString(),
    );
  }
}

// ignore: must_be_immutable
class SliderSection extends AbstractSection {
  SliderSection({
    required String title,
    required this.slider,
    Key? key,
  }) : super(key: key, title: title, titlePadding: defaultTitlePadding);

  final SliderTile slider;

  @override
  Widget build(BuildContext context) {
    final temp = '${title!} (${slider.initialSliderValue.toInt()})';
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (title != null)
          Padding(
            padding: titlePadding!,
            child: Text(
              temp,
              style: TextStyle(
                color: Theme.of(context).textTheme.headline1!.color,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        slider,
        if (showBottomDivider) const Divider(height: 1)
      ]),
    );
  }
}
