import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:go_router/go_router.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';
import 'package:youtrust_lt_app/components/ticking_builder.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';
import 'package:youtrust_lt_app/slides/project/conclusion/conclusion_slide.dart';

class ConclusionContentSlide extends StatelessWidget {
  const ConclusionContentSlide({super.key});

  static const path = '/11';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context).height * 0.75;
    final body = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScalerText(
              text: 'Animation',
              style: theme.textTheme.labelLarge,
            ),
            SizedBox.square(
              dimension: size,
              child: Center(
                child: const FlutterLogo(size: 78)
                    .animate(
                      onPlay: (controller) => controller.repeat(),
                    )
                    .fade(duration: 500.ms)
                    .scale(
                      delay: 500.ms,
                      duration: 500.ms,
                      end: const Offset(3, 3),
                    )
                    .shake(
                      delay: 1000.ms,
                      duration: 2000.ms,
                      hz: 4,
                      curve: Curves.easeInOutCubic,
                    ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScalerText(
              text: 'Fragment Shader',
              style: theme.textTheme.labelLarge,
            ),
            const _ConclusionContentShader()
          ],
        ),
      ],
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Actions(
        actions: <Type, Action<Intent>>{
          BackIntent: _BackAction(context),
          NextIntent: _NextAction(context),
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            body: body,
          ),
        ),
      ),
    );
  }
}

class _BackAction extends Action<BackIntent> {
  _BackAction(this.context);

  final BuildContext context;

  @override
  void invoke(BackIntent intent) {
    context.pop();
  }
}

class _NextAction extends Action<NextIntent> {
  _NextAction(this.context);

  final BuildContext context;

  @override
  void invoke(NextIntent intent) {
    context.push(ConclusionSlide.path);
  }
}

class _ConclusionContentShader extends StatelessWidget {
  const _ConclusionContentShader();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.75;
    final size = Size(
      height,
      height,
    );
    return TickingBuilder(
      builder: (context, time) {
        return ShaderBuilder(
          assetKey: 'shaders/radar.frag',
          (context, shader, child) => CustomPaint(
            size: size,
            painter: _ConclusionContentShaderPainter(shader, time),
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class _ConclusionContentShaderPainter extends CustomPainter {
  const _ConclusionContentShaderPainter(this.shader, this.time);

  final FragmentShader shader;
  final double time;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..shader = shader,
    );
  }

  @override
  bool shouldRepaint(covariant _ConclusionContentShaderPainter oldDelegate) {
    return oldDelegate.shader != shader || oldDelegate.time != time;
  }
}
