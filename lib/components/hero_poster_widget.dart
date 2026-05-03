import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hero_poster_model.dart';
export 'hero_poster_model.dart';

class HeroPosterWidget extends StatefulWidget {
  const HeroPosterWidget({
    super.key,
    required this.slideData,
  });

  final HeroItemStruct? slideData;

  @override
  State<HeroPosterWidget> createState() => _HeroPosterWidgetState();
}

class _HeroPosterWidgetState extends State<HeroPosterWidget> {
  late HeroPosterModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HeroPosterModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        if (widget.slideData?.contentType == 'movie') {
          _model.loadedMovieDoc =
              await MoviesRecord.getDocumentOnce(widget.slideData!.movieRef!);

          context.pushNamed(
            MoviePageWidget.routeName,
            queryParameters: {
              'movieDoc': serializeParam(
                _model.loadedMovieDoc,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'movieDoc': _model.loadedMovieDoc,
            },
          );
        } else {
          _model.loadedSeriesDoc =
              await SeriesRecord.getDocumentOnce(widget.slideData!.seriesRef!);

          context.pushNamed(
            SeasonPageWidget.routeName,
            queryParameters: {
              'seriesDoc': serializeParam(
                _model.loadedSeriesDoc,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'seriesDoc': _model.loadedSeriesDoc,
            },
          );
        }

        safeSetState(() {});
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 600.0,
                  child: Stack(
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {},
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 200),
                          fadeOutDuration: Duration(milliseconds: 200),
                          imageUrl: widget.slideData!.image,
                          height: 600.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 600.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              FlutterFlowTheme.of(context).primaryBackground,
                              Colors.transparent
                            ],
                            stops: [0.0, 0.5],
                            begin: AlignmentDirectional(0.0, 1.0),
                            end: AlignmentDirectional(0, -1.0),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                FlutterFlowTheme.of(context)
                                    .designToken
                                    .spacing
                                    .lg,
                                0.0,
                                FlutterFlowTheme.of(context)
                                    .designToken
                                    .spacing
                                    .lg,
                                FlutterFlowTheme.of(context)
                                    .designToken
                                    .spacing
                                    .xl),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  children: [
                                    if (widget.slideData?.logoImage == null ||
                                        widget.slideData?.logoImage == '')
                                      Text(
                                        valueOrDefault<String>(
                                          widget.slideData?.title,
                                          'Title',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w800,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                              lineHeight: 1.1,
                                            ),
                                      ),
                                    if (widget.slideData?.logoImage != null &&
                                        widget.slideData?.logoImage != '')
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          fadeInDuration:
                                              Duration(milliseconds: 200),
                                          fadeOutDuration:
                                              Duration(milliseconds: 200),
                                          imageUrl:
                                              widget.slideData!.logoImage,
                                          width: double.infinity,
                                          height: 120.0,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        functions.formatGenres(widget
                                            .slideData?.genres
                                            .toList()),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontSize: 12.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                              lineHeight: 1.3,
                                            ),
                                      ),
                                    ].divide(SizedBox(
                                        width: FlutterFlowTheme.of(context)
                                            .designToken
                                            .spacing
                                            .md)),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  'THIS IS FOR TESTING',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            if (widget
                                                    .slideData?.contentType ==
                                                'movie') {
                                              if (_model.loadedMovieDoc
                                                      ?.driveType ==
                                                  'gdrive') {
                                                await actions
                                                    .playVideoInExternalPlayer(
                                                  'https://shahcomplex.sa-syedali2000.workers.dev/?id=${_model.loadedMovieDoc?.videoUrl}',
                                                );
                                              } else {
                                                await actions
                                                    .playVideoInExternalPlayer(
                                                  'https://shahcomplex.sa-syedali2000.workers.dev/?source=onedrive&file_id=${_model.loadedMovieDoc?.videoUrl}&key=Pappu@007',
                                                );
                                              }
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .designToken
                                                          .radius
                                                          .lg),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Container(
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .designToken
                                                                  .spacing
                                                                  .xl,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .designToken
                                                                  .spacing
                                                                  .md,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .designToken
                                                                  .spacing
                                                                  .xl,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .designToken
                                                                  .spacing
                                                                  .md),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons
                                                                .play_arrow_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 16.0,
                                                          ),
                                                          Text(
                                                            'Play',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                  lineHeight:
                                                                      1.3,
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 0.0,
                                                            height: 0.0,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 0.0,
                                                    height: 0.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      if (_model.isHidden == false)
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .designToken
                                                          .radius
                                                          .lg),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                children: [
                                                  Container(
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .designToken
                                                                  .spacing
                                                                  .xl,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .designToken
                                                                  .spacing
                                                                  .md,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .designToken
                                                                  .spacing
                                                                  .xl,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .designToken
                                                                  .spacing
                                                                  .md),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.add_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 16.0,
                                                          ),
                                                          Text(
                                                            'My List',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                  lineHeight:
                                                                      1.3,
                                                                ),
                                                          ),
                                                          Container(
                                                            width: 0.0,
                                                            height: 0.0,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 8.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 0.0,
                                                    height: 0.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                    ].divide(SizedBox(
                                        width: FlutterFlowTheme.of(context)
                                            .designToken
                                            .spacing
                                            .md)),
                                  ),
                                ),
                              ].divide(SizedBox(
                                  height: FlutterFlowTheme.of(context)
                                      .designToken
                                      .spacing
                                      .lg)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
