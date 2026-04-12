import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 0),
                      fadeOutDuration: Duration(milliseconds: 0),
                      imageUrl: widget.slideData!.image,
                      height: 600.0,
                      fit: BoxFit.cover,
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
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 32.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineLarge
                                          .fontStyle,
                                      lineHeight: 1.1,
                                    ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      functions.formatGenres(
                                          widget.slideData?.genres.toList()),
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
                                            color: FlutterFlowTheme.of(context)
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          borderRadius: BorderRadius.circular(
                                              FlutterFlowTheme.of(context)
                                                  .designToken
                                                  .radius
                                                  .lg),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Stack(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
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
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .play_arrow_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        size: 16.0,
                                                      ),
                                                      Text(
                                                        'Play',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                              lineHeight: 1.3,
                                                            ),
                                                      ),
                                                      Container(
                                                        width: 0.0,
                                                        height: 0.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
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
                                    if (_model.isHidden == false)
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            borderRadius: BorderRadius.circular(
                                                FlutterFlowTheme.of(context)
                                                    .designToken
                                                    .radius
                                                    .lg),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
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
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.3,
                                                              ),
                                                        ),
                                                        Container(
                                                          width: 0.0,
                                                          height: 0.0,
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
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
    );
  }
}
