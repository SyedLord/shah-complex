import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'in_app_player_model.dart';
export 'in_app_player_model.dart';

class InAppPlayerWidget extends StatefulWidget {
  const InAppPlayerWidget({
    super.key,
    required this.url,
  });

  final String? url;

  static String routeName = 'InAppPlayer';
  static String routePath = '/inAppPlayer';

  @override
  State<InAppPlayerWidget> createState() => _InAppPlayerWidgetState();
}

class _InAppPlayerWidgetState extends State<InAppPlayerWidget> {
  late InAppPlayerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InAppPlayerModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: custom_widgets.PremiumVideoPlayer(
            width: double.infinity,
            height: double.infinity,
            videoUrl: widget.url!,
          ),
        ),
      ),
    );
  }
}
