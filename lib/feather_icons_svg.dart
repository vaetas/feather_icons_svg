library feather_icons_svg;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'src/icons.dart';

export 'src/icons.dart';

/// Similarly to Material Icons, use [FeatherIcons] Widget to display the icon.
///
///
/// ```dart
/// FeatherIcon(FeatherIcons.arrowLeft)
/// ```
class FeatherIcon extends StatelessWidget {
  const FeatherIcon(
    this.icon, {
    this.color,
    this.size,
    this.strokeWidth = 2,
  });

  final FeatherIcons icon;
  final Color? color;
  final double? size;

  /// Customize icon's stroke width. Defaults to 2.0
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      strokeWidth != 2
          ? icon.data.replaceFirst(
              'stroke-width="2"',
              'stroke-width="$strokeWidth"',
            )
          : icon.data,
      color: color ?? IconTheme.of(context).color,
      width: size,
      height: size,
      alignment: Alignment.center,
    );
  }
}
