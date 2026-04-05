import '/backend/backend.dart';
import '/components/hero_poster_widget.dart';
import '/components/movie_card_widget.dart';
import '/components/section_header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_dashboard_copy_model.dart';
export 'home_dashboard_copy_model.dart';

class HomeDashboardCopyWidget extends StatefulWidget {
  const HomeDashboardCopyWidget({super.key});

  static String routeName = 'HomeDashboardCopy';
  static String routePath = '/homeDashboardCopy';

  @override
  State<HomeDashboardCopyWidget> createState() =>
      _HomeDashboardCopyWidgetState();
}

class _HomeDashboardCopyWidgetState extends State<HomeDashboardCopyWidget> {
  late HomeDashboardCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeDashboardCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isLoggedin == true) {
        if ((FFAppState().googleRefreshToken != '') &&
            (FFAppState().microsoftRefreshToken != '')) {
          _model.newGoogleToken = await actions.refreshGoogleToken(
            FFAppState().googleRefreshToken,
          );
          _model.newMicrosoftToken = await actions.refreshMicrosoftToken(
            FFAppState().microsoftRefreshToken,
          );
          if ((_model.newGoogleToken != null && _model.newGoogleToken != '') &&
              (_model.newMicrosoftToken != null &&
                  _model.newMicrosoftToken != '')) {
            FFAppState().googleAccessToken = _model.newGoogleToken!;
            FFAppState().microsoftAccessToken = _model.newMicrosoftToken!;
            safeSetState(() {});
          } else {
            FFAppState().googleAccessToken = '';
            FFAppState().googleRefreshToken = '';
            FFAppState().microsoftAccessToken = '';
            FFAppState().microsoftRefreshToken = '';
            FFAppState().isLoggedin = false;
            safeSetState(() {});

            context.goNamed(LoginPageWidget.routeName);
          }
        }
      } else {
        context.goNamed(LoginPageWidget.routeName);
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                wrapWithModel(
                  model: _model.heroPosterModel,
                  updateCallback: () => safeSetState(() {}),
                  child: HeroPosterWidget(),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.sectionHeaderModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: SectionHeaderWidget(
                        title: 'Trending Movies',
                        type: 'movie',
                        isTrending: true,
                        isContinueWatching: false,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 0.0, 16.0),
                        child: StreamBuilder<List<MoviesRecord>>(
                          stream: queryMoviesRecord(
                            queryBuilder: (moviesRecord) => moviesRecord.where(
                              'is_trending',
                              isEqualTo: true,
                            ),
                            limit: 10,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<MoviesRecord> trendingRowMoviesRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                    trendingRowMoviesRecordList.length,
                                    (trendingRowIndex) {
                                  final trendingRowMoviesRecord =
                                      trendingRowMoviesRecordList[
                                          trendingRowIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        MoviePageWidget.routeName,
                                        queryParameters: {
                                          'movieDoc': serializeParam(
                                            trendingRowMoviesRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'movieDoc': trendingRowMoviesRecord,
                                        },
                                      );
                                    },
                                    child: MovieCardWidget(
                                      key: Key(
                                          'Key0g4_${trendingRowIndex}_of_${trendingRowMoviesRecordList.length}'),
                                      img: trendingRowMoviesRecord.posterImage,
                                      movieDoc: trendingRowMoviesRecord,
                                    ),
                                  );
                                }).divide(SizedBox(width: 10.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.sectionHeaderModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: SectionHeaderWidget(
                        title: 'Trending Series',
                        type: 'series',
                        isTrending: true,
                        isContinueWatching: false,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 0.0, 16.0),
                        child: StreamBuilder<List<SeriesRecord>>(
                          stream: querySeriesRecord(
                            queryBuilder: (seriesRecord) => seriesRecord.where(
                              'is_trending',
                              isEqualTo: true,
                            ),
                            limit: 10,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<SeriesRecord> trendingRowSeriesRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(
                                    trendingRowSeriesRecordList.length,
                                    (trendingRowIndex) {
                                  final trendingRowSeriesRecord =
                                      trendingRowSeriesRecordList[
                                          trendingRowIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(
                                        SeasonPageWidget.routeName,
                                        queryParameters: {
                                          'seriesDoc': serializeParam(
                                            trendingRowSeriesRecord,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'seriesDoc': trendingRowSeriesRecord,
                                        },
                                      );
                                    },
                                    child: MovieCardWidget(
                                      key: Key(
                                          'Key4sb_${trendingRowIndex}_of_${trendingRowSeriesRecordList.length}'),
                                      img: trendingRowSeriesRecord.posterImage,
                                      seriesDoc: trendingRowSeriesRecord,
                                    ),
                                  );
                                }).divide(SizedBox(width: 10.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                wrapWithModel(
                  model: _model.sectionHeaderModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: SectionHeaderWidget(
                    title: 'Continue Watching',
                    isTrending: false,
                    isContinueWatching: false,
                  ),
                ),
                Container(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.movieCardModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: MovieCardWidget(
                              img:
                                  'image.tmdb.org/t/p/w500/xA7N41glw17MBQtcWSm2eBlBRuG.jpg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                StreamBuilder<List<CategoriesRecord>>(
                  stream: queryCategoriesRecord(
                    queryBuilder: (categoriesRecord) => categoriesRecord.where(
                      'type',
                      isEqualTo: 'movie',
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<CategoriesRecord> moviesCategoriesRecordList =
                        snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: moviesCategoriesRecordList.length,
                      itemBuilder: (context, moviesIndex) {
                        final moviesCategoriesRecord =
                            moviesCategoriesRecordList[moviesIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SectionHeaderWidget(
                              key: Key(
                                  'Keyyvq_${moviesIndex}_of_${moviesCategoriesRecordList.length}'),
                              title: moviesCategoriesRecord.name,
                              type: moviesCategoriesRecord.type,
                              isTrending: false,
                              isContinueWatching: false,
                            ),
                            Container(
                              width: double.infinity,
                              height: 200.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: StreamBuilder<List<MoviesRecord>>(
                                  stream: queryMoviesRecord(
                                    queryBuilder: (moviesRecord) =>
                                        moviesRecord.where(
                                      'category',
                                      isEqualTo: moviesCategoriesRecord.name,
                                    ),
                                    limit: 10,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<MoviesRecord>
                                        listViewMoviesRecordList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          listViewMoviesRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(width: 10.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewMoviesRecord =
                                            listViewMoviesRecordList[
                                                listViewIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              MoviePageWidget.routeName,
                                              queryParameters: {
                                                'movieDoc': serializeParam(
                                                  listViewMoviesRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'movieDoc':
                                                    listViewMoviesRecord,
                                              },
                                            );
                                          },
                                          child: MovieCardWidget(
                                            key: Key(
                                                'Keyfes_${listViewIndex}_of_${listViewMoviesRecordList.length}'),
                                            img: listViewMoviesRecord
                                                .posterImage,
                                            movieDoc: listViewMoviesRecord,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                StreamBuilder<List<CategoriesRecord>>(
                  stream: queryCategoriesRecord(
                    queryBuilder: (categoriesRecord) => categoriesRecord.where(
                      'type',
                      isEqualTo: 'series',
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<CategoriesRecord> seasonsCategoriesRecordList =
                        snapshot.data!;

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: seasonsCategoriesRecordList.length,
                      itemBuilder: (context, seasonsIndex) {
                        final seasonsCategoriesRecord =
                            seasonsCategoriesRecordList[seasonsIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SectionHeaderWidget(
                              key: Key(
                                  'Keylq7_${seasonsIndex}_of_${seasonsCategoriesRecordList.length}'),
                              title: seasonsCategoriesRecord.name,
                              type: seasonsCategoriesRecord.type,
                              isTrending: false,
                              isContinueWatching: false,
                            ),
                            Container(
                              width: double.infinity,
                              height: 200.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: StreamBuilder<List<SeriesRecord>>(
                                  stream: querySeriesRecord(
                                    queryBuilder: (seriesRecord) =>
                                        seriesRecord.where(
                                      'category',
                                      isEqualTo: seasonsCategoriesRecord.name,
                                    ),
                                    limit: 10,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                    List<SeriesRecord>
                                        listViewSeriesRecordList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          listViewSeriesRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(width: 10.0),
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewSeriesRecord =
                                            listViewSeriesRecordList[
                                                listViewIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              SeasonPageWidget.routeName,
                                              queryParameters: {
                                                'seriesDoc': serializeParam(
                                                  listViewSeriesRecord,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'seriesDoc':
                                                    listViewSeriesRecord,
                                              },
                                            );
                                          },
                                          child: MovieCardWidget(
                                            key: Key(
                                                'Keyw42_${listViewIndex}_of_${listViewSeriesRecordList.length}'),
                                            img: listViewSeriesRecord
                                                .posterImage,
                                            seriesDoc: listViewSeriesRecord,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                Container(
                  height: 100.0,
                ),
              ],
            ),
          ),
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xAA000000), Colors.transparent],
                stops: [0.0, 1.0],
                begin: AlignmentDirectional(0.0, -1.0),
                end: AlignmentDirectional(0, 1.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
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
                    ].divide(SizedBox(width: 24.0)),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              height: 80.0,
              alignment: AlignmentDirectional(0.0, 1.0),
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 20.0,
                    sigmaY: 20.0,
                  ),
                  child: Container(
                    height: 80.0,
                    decoration: BoxDecoration(
                      color: Color(0xCC000000),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).divider,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
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
                            ].divide(SizedBox(height: 4.0)),
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
                            ].divide(SizedBox(height: 4.0)),
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
                            ].divide(SizedBox(height: 4.0)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
