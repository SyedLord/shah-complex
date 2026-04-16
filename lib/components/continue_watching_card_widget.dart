import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'continue_watching_card_model.dart';
export 'continue_watching_card_model.dart';

class ContinueWatchingCardWidget extends StatefulWidget {
  const ContinueWatchingCardWidget({
    super.key,
    required this.continueDoc,
  });

  final ItemsRecord? continueDoc;

  @override
  State<ContinueWatchingCardWidget> createState() =>
      _ContinueWatchingCardWidgetState();
}

class _ContinueWatchingCardWidgetState
    extends State<ContinueWatchingCardWidget> {
  late ContinueWatchingCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ContinueWatchingCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await actions.launchExternalPlayer(
          functions.emptyMovieDoc(),
          functions.emptyEpisodeDoc(),
          widget.continueDoc,
          FFAppState().activeProfileRef!.id,
          '',
        );
      },
      child: Container(
        width: 200.0,
        height: 120.0,
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 200),
                fadeOutDuration: Duration(milliseconds: 200),
                imageUrl: widget.continueDoc!.imageUrl,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    FlutterFlowTheme.of(context).primaryBackground
                  ],
                  stops: [0.2, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                child: LinearPercentIndicator(
                  percent: functions.calculateProgressRatio(
                      widget.continueDoc?.watchedSeconds,
                      widget.continueDoc?.totalSeconds),
                  lineHeight: 3.0,
                  animation: true,
                  animateFromLastPercent: true,
                  progressColor: FlutterFlowTheme.of(context).primary,
                  backgroundColor: FlutterFlowTheme.of(context).accent4,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
