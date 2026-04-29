import '/backend/backend.dart';
import '/components/continue_watching_card_widget.dart';
import '/components/latest_update_card_widget.dart';
import '/components/movie_card_widget.dart';
import '/components/season_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'all_items_model.dart';
export 'all_items_model.dart';

class AllItemsWidget extends StatefulWidget {
  const AllItemsWidget({
    super.key,
    required this.categoryName,
    this.itemType,
  });

  final String? categoryName;
  final String? itemType;

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
      if (widget.categoryName == 'movie') {
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
    context.watch<FFAppState>();

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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Container(
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                              Text(
                                valueOrDefault<String>(
                                  widget.categoryName,
                                  'Page Title',
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed(
                                    SearchWidget.routeName,
                                    extra: <String, dynamic>{
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
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
            ),
            if (widget.categoryName == 'Continue Watching')
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: StreamBuilder<List<ItemsRecord>>(
                    stream: queryItemsRecord(
                      parent: functions.getContinueWatchingRef(
                          FFAppState().activeProfileRef!),
                      queryBuilder: (itemsRecord) =>
                          itemsRecord.orderBy('updated_at', descending: true),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitPulse(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<ItemsRecord> continueWatchingItemsRecordList =
                          snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.0,
                        ),
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: continueWatchingItemsRecordList.length,
                        itemBuilder: (context, continueWatchingIndex) {
                          final continueWatchingItemsRecord =
                              continueWatchingItemsRecordList[
                                  continueWatchingIndex];
                          return ContinueWatchingCardWidget(
                            key: Key(
                                'Keyujz_${continueWatchingIndex}_of_${continueWatchingItemsRecordList.length}'),
                            continueDoc: continueWatchingItemsRecord,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            if (widget.categoryName == 'My List')
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: FutureBuilder<List<MyListRecord>>(
                    future: FFAppState().myListAllItems(
                      requestFn: () => queryMyListRecordOnce(
                        queryBuilder: (myListRecord) => myListRecord
                            .where(
                              'profile_ref',
                              isEqualTo: FFAppState().activeProfileRef,
                            )
                            .orderBy('added_at', descending: true),
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitPulse(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<MyListRecord> myListMyListRecordList =
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
                        itemCount: myListMyListRecordList.length,
                        itemBuilder: (context, myListIndex) {
                          final myListMyListRecord =
                              myListMyListRecordList[myListIndex];
                          return Stack(
                            children: [
                              if (myListMyListRecord.movieRef != null)
                                StreamBuilder<MoviesRecord>(
                                  stream: MoviesRecord.getDocument(
                                      myListMyListRecord.movieRef!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }

                                    final movieCardMoviesRecord =
                                        snapshot.data!;

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
                                              movieCardMoviesRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'movieDoc': movieCardMoviesRecord,
                                            '__transition_info__':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                            ),
                                          },
                                        );
                                      },
                                      child: MovieCardWidget(
                                        key: Key(
                                            'Keyxwq_${myListIndex}_of_${myListMyListRecordList.length}'),
                                        img: movieCardMoviesRecord.posterImage,
                                      ),
                                    );
                                  },
                                ),
                              if (myListMyListRecord.seasonRef != null)
                                StreamBuilder<SeriesRecord>(
                                  stream: SeriesRecord.getDocument(
                                      myListMyListRecord.seasonRef!),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }

                                    final movieCardSeriesRecord =
                                        snapshot.data!;

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
                                              movieCardSeriesRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'seriesDoc': movieCardSeriesRecord,
                                            '__transition_info__':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                            ),
                                          },
                                        );
                                      },
                                      child: MovieCardWidget(
                                        key: Key(
                                            'Key9o3_${myListIndex}_of_${myListMyListRecordList.length}'),
                                        img: movieCardSeriesRecord.posterImage,
                                      ),
                                    );
                                  },
                                ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            if (widget.itemType == 'movie')
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: FutureBuilder<List<MoviesRecord>>(
                    future: FFAppState().moviesCacheListAll(
                      uniqueQueryKey: valueOrDefault<String>(
                        widget.categoryName,
                        'cache',
                      ),
                      requestFn: () => queryMoviesRecordOnce(
                        queryBuilder: (moviesRecord) => moviesRecord
                            .where(
                              'category',
                              isEqualTo: widget.categoryName,
                            )
                            .orderBy('title'),
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitPulse(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
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
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );
                            },
                            child: MovieCardWidget(
                              key: Key(
                                  'Keyh41_${moviesIndex}_of_${moviesMoviesRecordList.length}'),
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
            if (widget.categoryName == 'Trending Movies')
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: FutureBuilder<List<MoviesRecord>>(
                      future: FFAppState().trendingMoviesCache(
                        requestFn: () => queryMoviesRecordOnce(
                          queryBuilder: (moviesRecord) => moviesRecord
                              .where(
                                'is_trending',
                                isEqualTo: true,
                              )
                              .orderBy('created_at', descending: true),
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitPulse(
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<MoviesRecord> trendingMoviesMoviesRecordList =
                            snapshot.data!;

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
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
              ),
            if (widget.categoryName == 'Latest Uploads')
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: FutureBuilder<List<NewsFeedRecord>>(
                    future: FFAppState().newsCardsAll(
                      requestFn: () => queryNewsFeedRecordOnce(
                        queryBuilder: (newsFeedRecord) => newsFeedRecord
                            .orderBy('created_at', descending: true),
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitPulse(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<NewsFeedRecord> latestUploadsNewsFeedRecordList =
                          snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.5,
                        ),
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount: latestUploadsNewsFeedRecordList.length,
                        itemBuilder: (context, latestUploadsIndex) {
                          final latestUploadsNewsFeedRecord =
                              latestUploadsNewsFeedRecordList[
                                  latestUploadsIndex];
                          return InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (latestUploadsNewsFeedRecord.movieRef !=
                                  null) {
                                _model.movieRef1 =
                                    await MoviesRecord.getDocumentOnce(
                                        latestUploadsNewsFeedRecord.movieRef!);

                                context.pushNamed(
                                  MoviePageWidget.routeName,
                                  queryParameters: {
                                    'movieDoc': serializeParam(
                                      _model.movieRef1,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'movieDoc': _model.movieRef1,
                                    '__transition_info__': TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              } else {
                                _model.seriesRef1 =
                                    await SeriesRecord.getDocumentOnce(
                                        latestUploadsNewsFeedRecord.seriesRef!);
                                if ((latestUploadsNewsFeedRecord.tag ==
                                        'NEW SERIES') ||
                                    (latestUploadsNewsFeedRecord.tag ==
                                        'NEW SEASON')) {
                                  context.pushNamed(
                                    SeasonPageWidget.routeName,
                                    queryParameters: {
                                      'seriesDoc': serializeParam(
                                        _model.seriesRef1,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'seriesDoc': _model.seriesRef1,
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                } else {
                                  _model.episodeDoc1 =
                                      await EpisodesRecord.getDocumentOnce(
                                          latestUploadsNewsFeedRecord
                                              .episodeRef!);

                                  context.pushNamed(
                                    EpisodePageWidget.routeName,
                                    queryParameters: {
                                      'episodeDoc': serializeParam(
                                        _model.episodeDoc1,
                                        ParamType.Document,
                                      ),
                                      'totalSeasons': serializeParam(
                                        _model.seriesRef1?.totalSeasons,
                                        ParamType.int,
                                      ),
                                      'alreadySelectedSeason': serializeParam(
                                        _model.episodeDoc1?.seasonNumber,
                                        ParamType.int,
                                      ),
                                      'titleLogoImage': serializeParam(
                                        _model.seriesRef1?.logoImage,
                                        ParamType.String,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'episodeDoc': _model.episodeDoc1,
                                    },
                                  );
                                }
                              }

                              safeSetState(() {});
                            },
                            child: LatestUpdateCardWidget(
                              key: Key(
                                  'Keyxiq_${latestUploadsIndex}_of_${latestUploadsNewsFeedRecordList.length}'),
                              posterImage: latestUploadsNewsFeedRecord.imageUrl,
                              titleImage: latestUploadsNewsFeedRecord.logoImage,
                              tag: latestUploadsNewsFeedRecord.tag,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            if (widget.categoryName == 'Trending Series')
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: FutureBuilder<List<SeriesRecord>>(
                    future: FFAppState().trendingSeriesCache(
                      requestFn: () => querySeriesRecordOnce(
                        queryBuilder: (seriesRecord) => seriesRecord
                            .where(
                              'is_trending',
                              isEqualTo: true,
                            )
                            .orderBy('created_at', descending: true),
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitPulse(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<SeriesRecord> trendingSeriesSeriesRecordList =
                          snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.5,
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
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );
                            },
                            child: SeasonCardWidget(
                              key: Key(
                                  'Key7zl_${trendingSeriesIndex}_of_${trendingSeriesSeriesRecordList.length}'),
                              posterImage:
                                  trendingSeriesSeriesRecord.backdropImage,
                              titleImage: trendingSeriesSeriesRecord.logoImage,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            if (widget.itemType == 'series')
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                  child: FutureBuilder<List<SeriesRecord>>(
                    future: FFAppState().seriesCacheListAll(
                      uniqueQueryKey: valueOrDefault<String>(
                        widget.categoryName,
                        'cache',
                      ),
                      requestFn: () => querySeriesRecordOnce(
                        queryBuilder: (seriesRecord) => seriesRecord
                            .where(
                              'category',
                              isEqualTo: widget.categoryName,
                            )
                            .orderBy('title'),
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitPulse(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<SeriesRecord> seriesSeriesRecordList =
                          snapshot.data!;

                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 1.5,
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
                                  '__transition_info__': TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                  ),
                                },
                              );
                            },
                            child: SeasonCardWidget(
                              key: Key(
                                  'Keywz1_${seriesIndex}_of_${seriesSeriesRecordList.length}'),
                              posterImage: seriesSeriesRecord.backdropImage,
                              titleImage: seriesSeriesRecord.logoImage,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
