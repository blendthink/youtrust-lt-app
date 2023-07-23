import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';

class ProjectStructureIntroductionSlide extends StatelessWidget {
  const ProjectStructureIntroductionSlide({super.key});

  static const path = '/8';

  @override
  Widget build(BuildContext context) {
    const body = SizedBox.shrink();

    return WillPopScope(
      onWillPop: () async => false,
      child: Actions(
        actions: <Type, Action<Intent>>{
          BackIntent: _BackAction(context),
          NextIntent: _NextAction(context),
        },
        child: const Focus(
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
  void invoke(NextIntent intent) {}
}
