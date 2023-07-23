import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:youtrust_lt_app/components/scaler_gap.dart';
import 'package:youtrust_lt_app/shortcuts/app_intents.dart';
import 'package:youtrust_lt_app/slides/agenda/agenda_title.dart';
import 'package:youtrust_lt_app/slides/agenda/agenda_headline.dart';
import 'package:youtrust_lt_app/slides/project/creation/project_creation_title_slide.dart';

const agendaTitle01 = '01 プロジェクト作成';
const agendaTitle02 = '02 ウィンドウ設定';
const agendaTitle03 = '03 画面構成';
const agendaTitle04 = '04 おわりに';

class AgendaSlide extends StatelessWidget {
  const AgendaSlide({super.key});

  static const path = '/2';

  @override
  Widget build(BuildContext context) {
    const body = Stack(
      children: [
        Row(
          children: [
            ScalerGap(36),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ScalerGap(12),
                AgendaHeadline(),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: AgendaTitle(agendaTitle01),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: AgendaTitle(agendaTitle02),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: AgendaTitle(agendaTitle03),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24),
                  child: AgendaTitle(agendaTitle04),
                ),
                ScalerGap(24),
              ],
            ),
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
  void invoke(NextIntent intent) {
    context.push(ProjectCreationTitleSlide.path);
  }
}
