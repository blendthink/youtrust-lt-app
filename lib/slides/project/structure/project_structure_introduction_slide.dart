import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtrust_lt_app/components/scaler_text.dart';
import 'package:youtrust_lt_app/config.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';
import 'package:youtrust_lt_app/slides/project/structure/project_structure_video_slide.dart';

class ProjectStructureIntroductionSlide extends StatefulWidget {
  const ProjectStructureIntroductionSlide({super.key});

  static const path = '/8';

  @override
  State<ProjectStructureIntroductionSlide> createState() => _State();
}

class _State extends State<ProjectStructureIntroductionSlide> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final body = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.6,
          height: size.height * 0.6,
          child: Stack(
            children: [
              const ColoredBox(
                color: Colors.green,
                child: SizedBox.expand(),
              ),
              PageView(
                controller: _controller,
                children: const [
                  Center(
                      child: ScalerText(
                    text: 'Slide 1',
                    style: null,
                  )),
                  Center(
                      child: ScalerText(
                    text: 'Slide 2',
                    style: null,
                  )),
                  Center(
                      child: ScalerText(
                    text: 'Slide 3',
                    style: null,
                  )),
                  Center(
                      child: ScalerText(
                    text: 'Slide 4',
                    style: null,
                  )),
                  Center(
                      child: ScalerText(
                    text: 'Slide 5',
                    style: null,
                  )),
                ],
              ),
              Positioned(
                bottom: 9.6 * context.appScale,
                left: 9.6 * context.appScale,
                child: const ScalerText(text: 'LT会', style: null),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                _controller.previousPage(
                  duration: kTabScrollDuration,
                  curve: Curves.easeIn,
                );
              },
              icon: const Icon(Icons.navigate_before),
            ),
            IconButton(
              onPressed: () {
                _controller.nextPage(
                  duration: kTabScrollDuration,
                  curve: Curves.easeIn,
                );
              },
              icon: const Icon(Icons.navigate_next),
            ),
          ],
        )
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
    context.push(ProjectStructureVideoSlide.path);
  }
}
