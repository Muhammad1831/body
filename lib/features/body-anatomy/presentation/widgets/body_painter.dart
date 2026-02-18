import 'package:body/config/constant/app_colors.dart';
import 'package:body/config/constant/app_dimens.dart';
import 'package:body/features/body-anatomy/data/model/body_part_model.dart';
import 'package:flutter/material.dart';

class BodyPainter extends CustomPainter {
  final BodyPartModel? selectedPart;
  final List<BodyPartModel> parts;

  BodyPainter({required this.selectedPart, required this.parts});

  static const double svgWidth = 146.0;
  static const double svgHeight = 338.0;

  @override
  void paint(Canvas canvas, Size size) {
    final scaleX = size.width / svgWidth;
    final scaleY = size.height / svgHeight;
    final scale = scaleX < scaleY ? scaleX : scaleY;

    final offsetX = (size.width - svgWidth * scale) / 2;
    final offsetY = (size.height - svgHeight * scale) / 2;

    canvas.save();
    canvas.translate(offsetX, offsetY);
    canvas.scale(scale);

    for (final part in parts) {
      final path = part.path;

      final isSelected = (selectedPart != null && selectedPart!.id == part.id);

      if (isSelected) {
        final fillPaint = Paint()
          ..color = AppColors.primary600
          ..style = PaintingStyle.fill;
        canvas.drawPath(path, fillPaint);
      }

      final strokePaint = Paint()
        ..color = isSelected ? AppColors.primary800 : AppColors.neutral50
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelected ? 1.5 / scale : 1.0 / scale
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round;
      canvas.drawPath(path, strokePaint);
    }

    final eyePaint = Paint()
      ..color = AppColors.neutral50
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(
        center: const Offset(66.0, 18.0),
        width: AppDimens.size4,
        height: AppDimens.size2,
      ),
      eyePaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
        center: const Offset(78.0, 18.0),
        width: AppDimens.size4,
        height: AppDimens.size2,
      ),
      eyePaint,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant BodyPainter oldDelegate) {
    return oldDelegate.selectedPart != selectedPart;
  }
}
