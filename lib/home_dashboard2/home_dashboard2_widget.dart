import '/components/movie_card_with_title3_widget.dart';
import '/components/section_header3_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_dashboard2_model.dart';
export 'home_dashboard2_model.dart';

class HomeDashboard2Widget extends StatefulWidget {
  const HomeDashboard2Widget({super.key});

  static String routeName = 'HomeDashboard2';
  static String routePath = '/homeDashboard2';

  @override
  State<HomeDashboard2Widget> createState() => _HomeDashboard2WidgetState();
}

class _HomeDashboard2WidgetState extends State<HomeDashboard2Widget> {
  late HomeDashboard2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeDashboard2Model());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Stack(
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
                        imageUrl:
                            'https://dimg.dreamflow.cloud/v1/image/Stranger%20Things%20poster%20vertical%20dark%20atmosphere',
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
                      ),
                      Container(
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
                                  'STRANGER THINGS',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Sci-Fi',
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
                                      Container(
                                        width: 4.0,
                                        height: 4.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          borderRadius: BorderRadius.circular(
                                              FlutterFlowTheme.of(context)
                                                  .designToken
                                                  .radius
                                                  .full),
                                        ),
                                      ),
                                      Text(
                                        'Thriller',
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
                                      Container(
                                        width: 4.0,
                                        height: 4.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          borderRadius: BorderRadius.circular(
                                              FlutterFlowTheme.of(context)
                                                  .designToken
                                                  .radius
                                                  .full),
                                        ),
                                      ),
                                      Text(
                                        'Supernatural',
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
                                                              .primaryBackground,
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
                                                                    .primaryBackground,
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
                                                              .primaryBackground,
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
                                                                    .primaryBackground,
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
                wrapWithModel(
                  model: _model.sectionHeader3Model1,
                  updateCallback: () => safeSetState(() {}),
                  child: SectionHeader3Widget(
                    title: 'Trending Now',
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        FlutterFlowTheme.of(context).designToken.spacing.md,
                        0.0,
                        0.0,
                        FlutterFlowTheme.of(context).designToken.spacing.md),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model1,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model2,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model3,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model4,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.sectionHeader3Model2,
                  updateCallback: () => safeSetState(() {}),
                  child: SectionHeader3Widget(
                    title: 'Continue Watching',
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        FlutterFlowTheme.of(context).designToken.spacing.md,
                        0.0,
                        0.0,
                        FlutterFlowTheme.of(context).designToken.spacing.md),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model5,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model6,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model7,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model8,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                wrapWithModel(
                  model: _model.sectionHeader3Model3,
                  updateCallback: () => safeSetState(() {}),
                  child: SectionHeader3Widget(
                    title: 'Top Anime',
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        FlutterFlowTheme.of(context).designToken.spacing.md,
                        0.0,
                        0.0,
                        FlutterFlowTheme.of(context).designToken.spacing.md),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model9,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model10,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model11,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                          wrapWithModel(
                            model: _model.movieCardWithTitle3Model12,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWithTitle3Widget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100.0,
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xCC000000), Colors.transparent],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    FlutterFlowTheme.of(context).designToken.spacing.md,
                    40.0,
                    FlutterFlowTheme.of(context).designToken.spacing.md,
                    0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.question_mark,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 32.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.cast_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        FlutterFlowIconButton(
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                        Container(
                          width: 32.0,
                          height: 32.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            shape: BoxShape.circle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'AR',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.8,
                            ),
                          ),
                        ),
                      ].divide(SizedBox(
                          width: FlutterFlowTheme.of(context)
                              .designToken
                              .spacing
                              .lg)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              height: 90.0,
              alignment: AlignmentDirectional(0.0, 1.0),
              child: Stack(
                children: [
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 20.0,
                        sigmaY: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Color(0x99000000),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          FlutterFlowTheme.of(context).designToken.spacing.md,
                          0.0,
                          FlutterFlowTheme.of(context).designToken.spacing.md,
                          20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.home_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              Text(
                                'Home',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ].divide(SizedBox(
                                height: FlutterFlowTheme.of(context)
                                    .designToken
                                    .spacing
                                    .xs)),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.whatshot_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              Text(
                                'New & Hot',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ].divide(SizedBox(
                                height: FlutterFlowTheme.of(context)
                                    .designToken
                                    .spacing
                                    .xs)),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  'JD',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 9.6,
                                  ),
                                ),
                              ),
                              Text(
                                'My Profile',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ].divide(SizedBox(
                                height: FlutterFlowTheme.of(context)
                                    .designToken
                                    .spacing
                                    .xs)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
