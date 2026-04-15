import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'icon_category_row_model.dart';
export 'icon_category_row_model.dart';

class IconCategoryRowWidget extends StatefulWidget {
  const IconCategoryRowWidget({
    super.key,
    this.category_name,
  });

  final String? category_name;

  @override
  State<IconCategoryRowWidget> createState() => _IconCategoryRowWidgetState();
}

class _IconCategoryRowWidgetState extends State<IconCategoryRowWidget> {
  late IconCategoryRowModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconCategoryRowModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          0.0, 0.0, 0.0, FlutterFlowTheme.of(context).designToken.spacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(
                  FlutterFlowTheme.of(context).designToken.spacing.lg,
                  0.0,
                  FlutterFlowTheme.of(context).designToken.spacing.lg,
                  0.0),
              child: Text(
                valueOrDefault<String>(
                  widget.category_name,
                  'The Classics',
                ),
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      lineHeight: 1.3,
                    ),
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [],
          ),
        ].divide(SizedBox(
            height: FlutterFlowTheme.of(context).designToken.spacing.md)),
      ),
    );
  }
}
