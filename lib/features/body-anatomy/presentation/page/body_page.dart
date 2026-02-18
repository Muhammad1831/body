import 'package:body/config/constant/app_dimens.dart';
import 'package:body/config/constant/app_strings.dart';
import 'package:body/features/body-anatomy/data/model/body_parts_data.dart';
import 'package:body/features/body-anatomy/presentation/controller/body_controller.dart';
import 'package:body/features/body-anatomy/presentation/widgets/body_painter.dart';
import 'package:body/features/body-anatomy/presentation/widgets/body_hit_detector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  final BodyController controller = Get.put(BodyController());

  final TransformationController _transformationController = TransformationController();

  Size _canvasSize = Size.zero;

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

  void _onTapUp(TapUpDetails details) {
    final Matrix4 inverse = Matrix4.inverted(_transformationController.value);

    final Offset scenePoint = MatrixUtils.transformPoint(inverse, details.localPosition);

    final part = BodyHitDetector.detect(position: scenePoint, size: _canvasSize);

    if (part != null) {
      controller.selectPart(part);
    } else {
      controller.selectPart(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.anatomyOfBody, style: theme.textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Column(
        children: [
          /// ───────── Selected Part Label ─────────
          Obx(() {
            final selectedPart = controller.selectedPart.value;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: selectedPart == null ? AppDimens.size16 : AppDimens.size64,
              width: double.infinity,
              curve: Curves.easeInOut,
              child: selectedPart == null
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(bottom: AppDimens.paddingSmall),
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: theme.cardColor),
                        child: Center(
                          child: Text(selectedPart.name, style: theme.textTheme.bodyLarge),
                        ),
                      ),
                    ),
            );
          }),

          // ───────── Body Viewer ─────────
          Expanded(
            child: GestureDetector(
              onTapUp: _onTapUp,
              child: InteractiveViewer(
                transformationController: _transformationController,
                minScale: 0.5,
                maxScale: 5.0,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    _canvasSize = Size(constraints.maxWidth, constraints.maxHeight);

                    return Obx(() {
                      return CustomPaint(
                        size: _canvasSize,
                        painter: BodyPainter(
                          selectedPart: controller.selectedPart.value,
                          parts: bodyParts,
                        ),
                      );
                    });
                  },
                ),
              ),
            ),
          ),
          AppDimens.vSpaceMedium,
        ],
      ),
    );
  }
}
