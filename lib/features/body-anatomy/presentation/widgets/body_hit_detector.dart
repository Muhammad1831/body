import 'dart:ui';
import 'package:body/features/body-anatomy/data/model/body_part_model.dart';
import 'package:body/features/body-anatomy/data/model/body_parts_data.dart';

class BodyHitDetector {
  static const svgWidth = 146.0;
  static const svgHeight = 338.0;

  static BodyPartModel? detect({required Offset position, required Size size}) {
    final scaleX = size.width / svgWidth;
    final scaleY = size.height / svgHeight;
    final scale = scaleX < scaleY ? scaleX : scaleY;

    final offsetX = (size.width - svgWidth * scale) / 2;
    final offsetY = (size.height - svgHeight * scale) / 2;

    final svgPoint = Offset((position.dx - offsetX) / scale, (position.dy - offsetY) / scale);

    for (final part in bodyParts) {
      if (part.path.contains(svgPoint)) {
        return part;
      }
    }

    return null;
  }
}
