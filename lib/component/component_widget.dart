import '/components/code_expired_pop_up_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'component_model.dart';
export 'component_model.dart';

class ComponentWidget extends StatefulWidget {
  const ComponentWidget({super.key});

  static String routeName = 'component';
  static String routePath = '/component';

  @override
  State<ComponentWidget> createState() => _ComponentWidgetState();
}

class _ComponentWidgetState extends State<ComponentWidget> {
  late ComponentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'component',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  wrapWithModel(
                    model: _model.codeExpiredPopUpModel,
                    updateCallback: () => safeSetState(() {}),
                    child: CodeExpiredPopUpWidget(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
