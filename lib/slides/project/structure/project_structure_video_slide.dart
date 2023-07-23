import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';
import 'package:youtrust_lt_app/slides/project/conclusion/conclusion_title_slide.dart';

class ProjectStructureVideoSlide extends StatefulWidget {
  const ProjectStructureVideoSlide({super.key});

  static const path = '/9';

  @override
  State<ProjectStructureVideoSlide> createState() =>
      _ProjectStructureVideoSlideState();
}

class _ProjectStructureVideoSlideState
    extends State<ProjectStructureVideoSlide> {
  late final Player _player;
  late final VideoController _controller;

  @override
  void initState() {
    super.initState();
    _player = Player();
    _controller = VideoController(_player);
    _player.open(
      Media(
        'asset://assets/project_setup.mov',
      ),
      play: false,
    );
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final body = Center(
      child: SizedBox(
        width: size.width,
        height: size.width * 8.0 / 16.0,
        child: Video(controller: _controller),
      ),
    );

    return WillPopScope(
      onWillPop: () async => false,
      child: Actions(
        actions: <Type, Action<Intent>>{
          BackIntent: _BackAction(context, _player),
          NextIntent: _NextAction(context, _player),
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
  _BackAction(this.context, this.player);

  final BuildContext context;
  final Player player;

  @override
  void invoke(BackIntent intent) {
    const initPosition = Duration.zero;
    final state = player.state;
    if (state.position == initPosition) {
      context.pop();
      return;
    }

    if (state.playing) {
      player.pause();
    } else {
      player.seek(initPosition);
    }
  }
}

class _NextAction extends Action<NextIntent> {
  _NextAction(this.context, this.player);

  final BuildContext context;
  final Player player;

  @override
  void invoke(NextIntent intent) {
    const lastPosition =
        Duration(minutes: 1, seconds: 25, microseconds: 533333);
    final state = player.state;
    if (state.position == lastPosition) {
      context.push(ConclusionTitleSlide.path);
      return;
    }

    if (state.playing) {
      player.seek(lastPosition);
    } else {
      player.play();
    }
  }
}
