import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'section_header_search_model.dart';
export 'section_header_search_model.dart';

class SectionHeaderSearchWidget extends StatefulWidget {
  const SectionHeaderSearchWidget({
    super.key,
    this.moviesData,
    this.seriesData,
    required this.title,
  });

  final List<MoviesRecord>? moviesData;
  final List<SeriesRecord>? seriesData;
  final String? title;

  @override
  State<SectionHeaderSearchWidget> createState() =>
      _SectionHeaderSearchWidgetState();
}

class _SectionHeaderSearchWidgetState extends State<SectionHeaderSearchWidget> {
  late SectionHeaderSearchModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SectionHeaderSearchModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              valueOrDefault<String>(
                widget.title,
                'Title',
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
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.goNamed(
                  SearchResultsWidget.routeName,
                  queryParameters: {
                    'passedMovieList': serializeParam(
                      widget.moviesData,
                      ParamType.Document,
                      isList: true,
                    ),
                    'passedSeriesList': serializeParam(
                      widget.seriesData,
                      ParamType.Document,
                      isList: true,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'passedMovieList': widget.moviesData,
                    'passedSeriesList': widget.seriesData,
                  },
                );
              },
              child: Text(
                'See All',
                style: FlutterFlowTheme.of(context).labelMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 12.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                      fontStyle:
                          FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      lineHeight: 1.3,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
