import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

final double xxsmallSpace = 4;
final double xsmallSpace = 8;
final double smallSpace = 12;
final double mediumSpace = 16;
final double largeSpace = 20;
final double xlargeSpace = 24;

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get xxsmallSpaceHorizontal => width * 0.04;
  double get xsmallSpaceHorizontal => width * 0.08;
  double get smallSpaceHorizontal => width * 0.12;
  double get mediumSpaceHorizontal => width * 0.16;
  double get largeSpaceHorizontal => width * 0.2;
  double get xlargeSpaceHorizontal => width * 0.24;

  double get xxsmallSpaceVertical => height * 0.04;
  double get xsmallSpaceVertical => height * 0.08;
  double get smallSpaceVertical => height * 0.12;
  double get mediumSpaceVertical => height * 0.16;
  double get largeSpaceVertical => height * 0.2;
  double get xlargeSpaceVertical => height * 0.24;
}
