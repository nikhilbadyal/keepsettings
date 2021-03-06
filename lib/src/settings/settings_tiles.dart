import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:keepswitch/keepswitch.dart';

enum _SettingsTileType { simple, switchTile, checkListTile }

enum TogglerShapes { heart }

const Color mediumGrayColor = Color(0xFFC7C7CC);
const defaultTitlePadding = EdgeInsets.only(
  left: 15,
  right: 15,
  bottom: 6,
);

const defaultCupertinoForwardIcon = Icon(
  CupertinoIcons.forward,
  size: 21,
  color: mediumGrayColor,
);

const defaultCupertinoForwardPadding = EdgeInsetsDirectional.only(
  start: 2.25,
);

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.title,
    this.titleMaxLines,
    this.subtitle,
    this.subtitleMaxLines,
    this.leading,
    this.trailing,
    this.iosChevron = defaultCupertinoForwardIcon,
    this.iosChevronPadding = defaultCupertinoForwardPadding,
    @Deprecated('Use onPressed instead') this.onTap,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.enabled = true,
    this.onPressed,
    this.switchActiveColor,
    Key? key,
  })  : _tileType = _SettingsTileType.simple,
        onToggle = null,
        switchValue = null,
        onChanged = null,
        onSliderChange = null,
        inactiveColor = Colors.grey,
        isSwitchDisabled = false,
        activeText = 'On',
        inactiveText = 'Off',
        activeTextColor = Colors.white,
        inactiveTextColor = Colors.red,
        initialSliderValue = 0.0,
        boxShape = null,
        togglerShape = null,
        activeColor = Colors.white,
        switchButtonColor = Colors.white,
        switchHeight = 0,
        switchWidth = 0,
        assert(titleMaxLines == null || titleMaxLines > 0, 'Error'),
        assert(subtitleMaxLines == null || subtitleMaxLines > 0, 'Error'),
        super(key: key);

  const SettingsTile.switchTile({
    required this.title,
    required this.onToggle,
    required this.switchValue,
    this.titleMaxLines,
    this.subtitle,
    this.subtitleMaxLines,
    this.leading,
    this.enabled = true,
    this.trailing,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.switchActiveColor,
    this.togglerShape,
    this.boxShape,
    this.activeColor,
    this.inactiveColor = Colors.grey,
    this.activeText = 'On',
    this.inactiveText = 'Off',
    this.activeTextColor = Colors.white,
    this.inactiveTextColor = Colors.white,
    this.isSwitchDisabled = false,
    this.switchHeight = 27,
    this.switchWidth = 55,
    this.switchButtonColor = Colors.white,
    Key? key,
  })  : _tileType = _SettingsTileType.switchTile,
        onTap = null,
        onPressed = null,
        iosChevron = null,
        onSliderChange = null,
        initialSliderValue = 0.0,
        onChanged = null,
        iosChevronPadding = null,
        assert(titleMaxLines == null || titleMaxLines > 0, 'Error'),
        assert(subtitleMaxLines == null || subtitleMaxLines > 0, 'Error'),
        super(key: key);

  const SettingsTile.checkListTile({
    required this.onChanged,
    required this.enabled,
    required this.title,
    this.titleMaxLines,
    this.subtitle,
    this.subtitleMaxLines,
    this.leading,
    this.trailing,
    this.iosChevron,
    this.iosChevronPadding,
    this.onTap,
    this.onPressed,
    this.onToggle,
    this.switchValue,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.switchActiveColor,
    Key? key,
  })  : _tileType = _SettingsTileType.checkListTile,
        onSliderChange = null,
        initialSliderValue = 0.0,
        inactiveColor = Colors.grey,
        isSwitchDisabled = false,
        activeText = 'On',
        inactiveText = 'f',
        activeTextColor = Colors.white,
        inactiveTextColor = Colors.white,
        boxShape = null,
        togglerShape = null,
        activeColor = Colors.white,
        switchButtonColor = Colors.white,
        switchHeight = 0,
        switchWidth = 0,
        super(key: key);

  final ValueChanged<bool?>? onChanged;
  final String title;
  final int? titleMaxLines;
  final String? subtitle;
  final int? subtitleMaxLines;
  final Widget? leading;
  final Widget? trailing;
  final Icon? iosChevron;
  final EdgeInsetsGeometry? iosChevronPadding;
  final VoidCallback? onTap;
  final Function(BuildContext context)? onPressed;
  final Function(bool value)? onToggle;
  final Function(double value)? onSliderChange;
  final bool? switchValue;
  final bool enabled;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final Color? switchActiveColor;
  final _SettingsTileType _tileType;
  final double initialSliderValue;

  final Color inactiveColor;
  final Color switchButtonColor;
  final bool isSwitchDisabled;
  final double switchHeight;
  final double switchWidth;
  final String activeText;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final Color? activeColor;
  final BoxShape? boxShape;
  final TogglerShapes? togglerShape;

  @override
  Widget build(BuildContext context) {
    return tile(context);
  }

  Widget tile(BuildContext context) {
    if (_tileType == _SettingsTileType.switchTile) {
      TogglerShape? shape;
      if (togglerShape != null) {
        shape = getType();
      }
      return ListTile(
        leading: leading,
        trailing: KeepSwitch(
          value: switchValue!,
          onChanged: enabled ? onToggle : null,
          activeColor: switchActiveColor,
          inactiveColor: inactiveColor,
          activeText: activeText,
          inactiveText: inactiveText,
          activeTextColor: activeTextColor,
          inactiveTextColor: inactiveTextColor,
          switchHeight: switchHeight,
          switchWidth: switchWidth,
          switchButtonColor: switchButtonColor,
          togglerShape: shape,
          boxShape: boxShape,
        ),
        title: Text(
          title,
          style: titleTextStyle ??
              TextStyle(
                  color: Theme.of(context).textTheme.headline1!.color,
                  fontWeight: FontWeight.w300),
          maxLines: titleMaxLines,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: subtitle != null
            ? Text(
          subtitle!,
                style: subtitleTextStyle ??
                    titleTextStyle ??
                    TextStyle(
                        color: Theme.of(context).textTheme.headline1!.color,
                        fontWeight: FontWeight.w300),
                maxLines: subtitleMaxLines,
                overflow: TextOverflow.ellipsis,
              )
            : null,
      );
    } else if (_tileType == _SettingsTileType.checkListTile) {
      return CheckboxListTile(
        secondary: leading,
        value: enabled,
        activeColor: Theme.of(context).colorScheme.secondary,
        onChanged: onChanged,
        title: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            title,
            style: titleTextStyle ??
                TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                    fontWeight: FontWeight.w300),
            maxLines: titleMaxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: subtitle != null
            ? Text(
          subtitle!,
                style: subtitleTextStyle ??
                    titleTextStyle ??
                    TextStyle(
                        color: Theme.of(context).textTheme.headline1!.color,
                        fontWeight: FontWeight.w300),
                maxLines: subtitleMaxLines,
                overflow: TextOverflow.ellipsis,
              )
            : null,
      );
    } else {
      return ListTile(
        title: Text(
          title,
          style: titleTextStyle ??
              TextStyle(
                  color: Theme.of(context).textTheme.headline1!.color,
                  fontWeight: FontWeight.w300),
        ),
        subtitle: subtitle != null
            ? Text(
                subtitle!,
                style: subtitleTextStyle ??
                    titleTextStyle ??
                    TextStyle(
                        color: Theme.of(context).textTheme.headline1!.color,
                        fontWeight: FontWeight.w300),
                maxLines: subtitleMaxLines,
                overflow: TextOverflow.ellipsis,
              )
            : null,
        leading: leading,
        enabled: enabled,
        trailing: trailing,
        onTap: onTapFunction(context) as void Function()?,
      );
    }
  }

  Function? onTapFunction(BuildContext context) =>
      onTap != null || onPressed != null
          ? () {
              if (onPressed != null) {
                onPressed!.call(context);
              } else {
                onTap!.call();
              }
            }
          : null;

  TogglerShape getType() {
    switch (togglerShape) {
      case TogglerShapes.heart:
        return TogglerShape.Heart;
      default:
        return TogglerShape.Heart;
    }
  }
}
