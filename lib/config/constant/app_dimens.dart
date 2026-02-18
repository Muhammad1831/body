import 'package:flutter/material.dart';

abstract class AppDimens {
  AppDimens._();

  // Spacing values
  static const double size2 = 2;
  static const double size4 = 4;
  static const double size6 = 6;
  static const double size8 = 8;
  static const double size12 = 12;
  static const double size14 = 14;
  static const double size16 = 16;
  static const double size24 = 24;
  static const double size32 = 32;
  static const double size36 = 36;
  static const double size48 = 48;
  static const double size64 = 64;
  static const double size72 = 72;

  // SizedBox for vertical spacing
  static SizedBox get vSpaceVeryVerySmall => SizedBox(height: size4);
  static SizedBox get vSpaceVerySmall => SizedBox(height: size8);
  static SizedBox get vSpaceSmall => SizedBox(height: size12);
  static SizedBox get vSpaceMedium => SizedBox(height: size16);
  static SizedBox get vSpaceLarge => SizedBox(height: size24);
  static SizedBox get vSpaceVeryLarge => SizedBox(height: size32);
  static SizedBox get vSpaceVeryVeryLarge => SizedBox(height: size36);
  static SizedBox get vSpaceExtraLarge => SizedBox(height: size48);

  // SizedBox for horizontal spacing
  static SizedBox get hSpaceVeryVerySmall => SizedBox(width: size4);
  static SizedBox get hSpaceVerySmall => SizedBox(width: size8);
  static SizedBox get hSpaceSmall => SizedBox(width: size12);
  static SizedBox get hSpaceMedium => SizedBox(width: size16);
  static SizedBox get hSpaceLarge => SizedBox(width: size24);
  static SizedBox get hSpaceVeryLarge => SizedBox(width: size32);
  static SizedBox get hSpaceVeryVeryLarge => SizedBox(width: size36);
  static SizedBox get hSpaceExtraLarge => SizedBox(width: size48);

  // Padding
  static const double paddingTiny = size2;
  static const double paddingVeryVerySmall = size4;
  static const double paddingVerySmall = size8;
  static const double paddingSmall = size12;
  static const double paddingMediumSmall = size14;
  static const double paddingMedium = size16;
  static const double paddingLarge = size24;
  static const double paddingVeryLarge = size32;
  static const double paddingExtraLarge = size48;

  // Border Radius
  static const double borderRadiusVeryVerySmall = size4;
  static const double borderRadiusVerySmall = size8;
  static const double borderRadiusSmall = size12;
  static const double borderRadiusMedium = size16;
  static const double borderRadiusLarge = size24;
  static const double borderRadiusVeryLarge = size32;
  static const double borderRadiusExtraLarge = size48;

  // Icon Sizes
  static const double iconSmall = 16;
  static const double iconMedium = 20;
  static const double iconLarge = 24;
  static const double iconVeryLarge = 32;
  static const double iconExtraLarge = 48;
}
