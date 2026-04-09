import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'description_widget_model.dart';
export 'description_widget_model.dart';

class DescriptionWidgetWidget extends StatefulWidget {
  const DescriptionWidgetWidget({
    super.key,
    this.description,
  });

  final String? description;

  @override
  State<DescriptionWidgetWidget> createState() =>
      _DescriptionWidgetWidgetState();
}

class _DescriptionWidgetWidgetState extends State<DescriptionWidgetWidget> {
  late DescriptionWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DescriptionWidgetModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        _model.isExpanded = !_model.isExpanded;
        safeSetState(() {});
      },
      child: Text(
        widget.description!,
        maxLines: _model.isExpanded == true ? 999 : 3,
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(
                fontWeight: FontWeight.normal,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
              color: FlutterFlowTheme.of(context).primaryText,
              fontSize: 14.0,
              letterSpacing: 0.0,
              fontWeight: FontWeight.normal,
              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              lineHeight: 1.4,
            ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
