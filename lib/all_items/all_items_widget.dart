import '/backend/backend.dart';
import '/components/movie_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'all_items_model.dart';
export 'all_items_model.dart';

class AllItemsWidget extends StatefulWidget {
  const AllItemsWidget({
    super.key,
    required this.categoryName,
    required this.categoryType,
    required this.isTrending,
    required this.isContinueWatching,
  });

  final String? categoryName;
  final String? categoryType;
  final bool? isTrending;
  final bool? isContinueWatching;

  static String routeName = 'AllItems';
  static String routePath = '/allItems';

  @override
  State<AllItemsWidget> createState() => _AllItemsWidgetState();
}

class _AllItemsWidgetState extends State<AllItemsWidget> {
  late AllItemsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllItemsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.categoryType == 'movie') {
        await queryMoviesRecordOnce();
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                        FlutterFlowTheme.of(context).designToken.spacing.md),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlutterFlowIconButton(
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pop();
                              },
                            ),
                            Text(
                              valueOrDefault<String>(
                                widget.categoryName,
                                'Category Name',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                    lineHeight: 1.2,
                                  ),
                            ),
                          ].divide(SizedBox(
                              width: FlutterFlowTheme.of(context)
                                  .designToken
                                  .spacing
                                  .md)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FlutterFlowIconButton(
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.search_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed(SearchScreenWidget.routeName);
                              },
                            ),
                            FlutterFlowIconButton(
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.filter_list_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ].divide(SizedBox(
                              width: FlutterFlowTheme.of(context)
                                  .designToken
                                  .spacing
                                  .sm)),
                        ),
                      ].divide(SizedBox(
                          width: FlutterFlowTheme.of(context)
                              .designToken
                              .spacing
                              .md)),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.categoryType == 'movie')
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: StreamBuilder<List<MoviesRecord>>(
                    stream: queryMoviesRecord(
                      queryBuilder: (moviesRecord) => moviesRecord
                          .where(
                            'category',
                            isEqualTo: widget.categoryName,
                          )
                          .orderBy('title'),
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
                      List<MoviesRecord> moviesMoviesRecordList =
                          snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.6,
                        ),
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: moviesMoviesRecordList.length,
                        itemBuilder: (context, moviesIndex) {
                          final moviesMoviesRecord =
                              moviesMoviesRecordList[moviesIndex];
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
                                    moviesMoviesRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'movieDoc': moviesMoviesRecord,
                                },
                              );
                            },
                            child: MovieCardWidget(
                              key: Key(
                                  'Key0kt_${moviesIndex}_of_${moviesMoviesRecordList.length}'),
                              img: moviesMoviesRecord.posterImage,
                              movieDoc: moviesMoviesRecord,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            if ((widget.categoryType == 'movie') &&
                (widget.isTrending == true))
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: StreamBuilder<List<MoviesRecord>>(
                    stream: queryMoviesRecord(
                      queryBuilder: (moviesRecord) => moviesRecord.where(
                        'is_trending',
                        isEqualTo: true,
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
                      List<MoviesRecord> trendingMoviesMoviesRecordList =
                          snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.6,
                        ),
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: trendingMoviesMoviesRecordList.length,
                        itemBuilder: (context, trendingMoviesIndex) {
                          final trendingMoviesMoviesRecord =
                              trendingMoviesMoviesRecordList[
                                  trendingMoviesIndex];
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
                                    trendingMoviesMoviesRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'movieDoc': trendingMoviesMoviesRecord,
                                },
                              );
                            },
                            child: MovieCardWidget(
                              key: Key(
                                  'Key3c9_${trendingMoviesIndex}_of_${trendingMoviesMoviesRecordList.length}'),
                              img: trendingMoviesMoviesRecord.posterImage,
                              movieDoc: trendingMoviesMoviesRecord,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            if ((widget.categoryType == 'series') &&
                (widget.isTrending == true))
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: StreamBuilder<List<SeriesRecord>>(
                    stream: querySeriesRecord(
                      queryBuilder: (seriesRecord) => seriesRecord.where(
                        'is_trending',
                        isEqualTo: true,
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
                      List<SeriesRecord> trendingSeriesSeriesRecordList =
                          snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.6,
                        ),
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: trendingSeriesSeriesRecordList.length,
                        itemBuilder: (context, trendingSeriesIndex) {
                          final trendingSeriesSeriesRecord =
                              trendingSeriesSeriesRecordList[
                                  trendingSeriesIndex];
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
                                    trendingSeriesSeriesRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'seriesDoc': trendingSeriesSeriesRecord,
                                },
                              );
                            },
                            child: MovieCardWidget(
                              key: Key(
                                  'Keywo1_${trendingSeriesIndex}_of_${trendingSeriesSeriesRecordList.length}'),
                              img: trendingSeriesSeriesRecord.posterImage,
                              seriesDoc: trendingSeriesSeriesRecord,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            if (widget.categoryType == 'series')
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: StreamBuilder<List<SeriesRecord>>(
                    stream: querySeriesRecord(
                      queryBuilder: (seriesRecord) => seriesRecord
                          .where(
                            'category',
                            isEqualTo: widget.categoryName,
                          )
                          .orderBy('title'),
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
                      List<SeriesRecord> seriesSeriesRecordList =
                          snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.6,
                        ),
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: seriesSeriesRecordList.length,
                        itemBuilder: (context, seriesIndex) {
                          final seriesSeriesRecord =
                              seriesSeriesRecordList[seriesIndex];
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
                                    seriesSeriesRecord,
                                    ParamType.Document,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  'seriesDoc': seriesSeriesRecord,
                                },
                              );
                            },
                            child: MovieCardWidget(
                              key: Key(
                                  'Key8no_${seriesIndex}_of_${seriesSeriesRecordList.length}'),
                              img: seriesSeriesRecord.posterImage,
                              seriesDoc: seriesSeriesRecord,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(
                    FlutterFlowTheme.of(context).designToken.spacing.lg,
                    FlutterFlowTheme.of(context).designToken.spacing.md,
                    FlutterFlowTheme.of(context).designToken.spacing.lg,
                    FlutterFlowTheme.of(context).designToken.spacing.md),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sort_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          Text(
                            'Sort',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.grid_view_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          Text(
                            'Layout',
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
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings_input_component_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20.0,
                          ),
                          Text(
                            'Filter',
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
