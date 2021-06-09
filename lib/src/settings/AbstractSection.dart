import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Top level abstract class which represent all the widgets in the settings
// ignore: must_be_immutable
abstract class AbstractSection extends StatelessWidget {
  /// Constructor
  AbstractSection({Key? key, this.title, this.titlePadding}) : super(key: key);

  /// Tells whether to put a divider line after tile or not
  bool showBottomDivider = false;

  /// Every tile has a title for better description
  final String? title;

  ///  Needed to do user defined padding to the title
  final EdgeInsetsGeometry? titlePadding;
}
