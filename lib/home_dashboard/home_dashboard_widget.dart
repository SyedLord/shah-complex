import '/backend/backend.dart';
import '/components/bottom_nav_bar_widget.dart';
import '/components/continue_watching_card_widget.dart';
import '/components/movie_card_widget.dart';
import '/components/profile_icon_dropdown_widget.dart';
import '/components/season_card_widget.dart';
import '/components/section_header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'home_dashboard_model.dart';
export 'home_dashboard_model.dart';

class HomeDashboardWidget extends StatefulWidget {
  const HomeDashboardWidget({super.key});

  static String routeName = 'HomeDashboard';
  static String routePath = '/homeDashboard';

  @override
  State<HomeDashboardWidget> createState() => _HomeDashboardWidgetState();
}

class _HomeDashboardWidgetState extends State<HomeDashboardWidget> {
  late HomeDashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeDashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.trendingList = await actions.getTrendingCarousel();
      FFAppState().carouselItems =
          _model.trendingList!.toList().cast<HeroItemStruct>();
      safeSetState(() {});
      _model.serverUpdateDoc = await queryAppConfigRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if ((_model.serverUpdateDoc!.trendingLastUpdated! >
              FFAppState().localCacheTime!) ||
          (FFAppState().localCacheTime == null)) {
        FFAppState().clearTrendingMoviesCacheCache();
        FFAppState().clearTrendingSeriesCacheCache();
        FFAppState().clearMoviesCacheCache();
        FFAppState().clearSeasonsCacheCache();
        FFAppState().clearMoviesCacheListCache();
        FFAppState().clearSeasonsCacheListCache();
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

    return StreamBuilder<ProfilesRecord>(
      stream: ProfilesRecord.getDocument(FFAppState().activeProfileRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }

        final homeDashboardProfilesRecord = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Stack(
            children: [
              RefreshIndicator(
                color: FlutterFlowTheme.of(context).primary,
                onRefresh: () async {
                  if (_model.serverUpdateDoc!.trendingLastUpdated! >
                      FFAppState().localCacheTime!) {
                    FFAppState().clearTrendingMoviesCacheCache();
                    FFAppState().clearTrendingSeriesCacheCache();
                    FFAppState().clearMoviesCacheCache();
                    FFAppState().clearSeasonsCacheCache();
                  }
                },
                child: SingleChildScrollView(
                  primary: false,
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Builder(
                        builder: (context) {
                          final currentSlide1 =
                              FFAppState().carouselItems.toList();

                          return Container(
                            width: double.infinity,
                            height: 400.0,
                            child: CarouselSlider.builder(
                              itemCount: currentSlide1.length,
                              itemBuilder: (context, currentSlide1Index, _) {
                                final currentSlide1Item =
                                    currentSlide1[currentSlide1Index];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (currentSlide1Item.contentType ==
                                        'movie') {
                                      _model.loadedMoviesDoc =
                                          await MoviesRecord.getDocumentOnce(
                                              currentSlide1Item.movieRef!);

                                      context.pushNamed(
                                        MoviePageWidget.routeName,
                                        queryParameters: {
                                          'movieDoc': serializeParam(
                                            _model.loadedMoviesDoc,
                                            ParamType.Document,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          'movieDoc': _model.loadedMoviesDoc,
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    } else {
                                      _model.loadedSeriesDoc =
                                          await SeriesRecord.getDocumentOnce(
                                              currentSlide1Item.seriesRef!);

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
                                          '__transition_info__': TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  child: Stack(
                                    children: [
                                      if (currentSlide1Item.image != '')
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {},
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 100),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 100),
                                              imageUrl: currentSlide1Item.image,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground
                                            ],
                                            stops: [0.3, 1.0],
                                            begin:
                                                AlignmentDirectional(0.0, -1.0),
                                            end: AlignmentDirectional(0, 1.0),
                                          ),
                                        ),
                                      ),
                                      if (currentSlide1Item.logoImage != '')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 50.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 100),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 100),
                                                imageUrl:
                                                    currentSlide1Item.logoImage,
                                                width: 300.0,
                                                height: 100.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                      if (currentSlide1Item.image == '')
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            width: 50.0,
                                            height: 50.0,
                                            child: custom_widgets.BeatLoader(
                                              width: 50.0,
                                              height: 50.0,
                                              size: 50.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                              carouselController: _model.carouselController ??=
                                  CarouselSliderController(),
                              options: CarouselOptions(
                                initialPage:
                                    max(0, min(1, currentSlide1.length - 1)),
                                viewportFraction: 1.0,
                                disableCenter: true,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.25,
                                enableInfiniteScroll: true,
                                scrollDirection: Axis.horizontal,
                                autoPlay: true,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                autoPlayInterval:
                                    Duration(milliseconds: (800 + 4000)),
                                autoPlayCurve: Curves.linear,
                                pauseAutoPlayInFiniteScroll: true,
                                onPageChanged: (index, _) =>
                                    _model.carouselCurrentIndex = index,
                              ),
                            ),
                          );
                        },
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
                            height: 220.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: StreamBuilder<List<MoviesRecord>>(
                                  stream: FFAppState().trendingMoviesCache(
                                    requestFn: () => queryMoviesRecord(
                                      queryBuilder: (moviesRecord) =>
                                          moviesRecord
                                              .where(
                                                'is_trending',
                                                isEqualTo: true,
                                              )
                                              .orderBy('created_at',
                                                  descending: true),
                                      limit: 10,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<MoviesRecord>
                                        trendingRowMoviesRecordList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          trendingRowMoviesRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(width: 10.0),
                                      itemBuilder: (context, trendingRowIndex) {
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
                                                'movieDoc':
                                                    trendingRowMoviesRecord,
                                              },
                                            );
                                          },
                                          child: MovieCardWidget(
                                            key: Key(
                                                'Key0g4_${trendingRowIndex}_of_${trendingRowMoviesRecordList.length}'),
                                            img: trendingRowMoviesRecord
                                                .posterImage,
                                            movieDoc: trendingRowMoviesRecord,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
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
                            height: 120.0,
                            decoration: BoxDecoration(),
                            child: Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 0.0, 0.0),
                                child: StreamBuilder<List<SeriesRecord>>(
                                  stream: FFAppState().trendingSeriesCache(
                                    requestFn: () => querySeriesRecord(
                                      queryBuilder: (seriesRecord) =>
                                          seriesRecord
                                              .where(
                                                'is_trending',
                                                isEqualTo: true,
                                              )
                                              .orderBy('created_at',
                                                  descending: true),
                                      limit: 10,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<SeriesRecord>
                                        trendingRowSeriesRecordList =
                                        snapshot.data!;

                                    return ListView.separated(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          trendingRowSeriesRecordList.length,
                                      separatorBuilder: (_, __) =>
                                          SizedBox(width: 10.0),
                                      itemBuilder: (context, trendingRowIndex) {
                                        final trendingRowSeriesRecord =
                                            trendingRowSeriesRecordList[
                                                trendingRowIndex];
                                        return SeasonCardWidget(
                                          key: Key(
                                              'Keyxqg_${trendingRowIndex}_of_${trendingRowSeriesRecordList.length}'),
                                          posterImage: trendingRowSeriesRecord
                                              .backdropImage,
                                          titleImage:
                                              trendingRowSeriesRecord.logoImage,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            height: 170.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: StreamBuilder<List<ItemsRecord>>(
                                stream: queryItemsRecord(
                                  parent: functions.getContinueWatchingRef(
                                      FFAppState().activeProfileRef!),
                                  queryBuilder: (itemsRecord) => itemsRecord
                                      .orderBy('updated_at', descending: true),
                                ),
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
                                  List<ItemsRecord> listViewItemsRecordList =
                                      snapshot.data!;

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: listViewItemsRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(width: 10.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewItemsRecord =
                                          listViewItemsRecordList[
                                              listViewIndex];
                                      return ContinueWatchingCardWidget(
                                        key: Key(
                                            'Keyuz4_${listViewIndex}_of_${listViewItemsRecordList.length}'),
                                        continueDoc: listViewItemsRecord,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      StreamBuilder<List<CategoriesRecord>>(
                        stream: FFAppState().moviesCache(
                          requestFn: () => queryCategoriesRecord(
                            queryBuilder: (categoriesRecord) =>
                                categoriesRecord.where(
                              'type',
                              isEqualTo: 'movie',
                            ),
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
                                    height: 220.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: StreamBuilder<List<MoviesRecord>>(
                                        stream: FFAppState().moviesCacheList(
                                          uniqueQueryKey:
                                              moviesCategoriesRecord.name,
                                          requestFn: () => queryMoviesRecord(
                                            queryBuilder: (moviesRecord) =>
                                                moviesRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          moviesCategoriesRecord
                                                              .name,
                                                    )
                                                    .orderBy('created_at',
                                                        descending: true),
                                            limit: 10,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
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
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewMoviesRecord =
                                                  listViewMoviesRecordList[
                                                      listViewIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    MoviePageWidget.routeName,
                                                    queryParameters: {
                                                      'movieDoc':
                                                          serializeParam(
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
                                                  movieDoc:
                                                      listViewMoviesRecord,
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
                        stream: FFAppState().seasonsCache(
                          requestFn: () => queryCategoriesRecord(
                            queryBuilder: (categoriesRecord) =>
                                categoriesRecord.where(
                              'type',
                              isEqualTo: 'series',
                            ),
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
                                    height: 120.0,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      child: StreamBuilder<List<SeriesRecord>>(
                                        stream: FFAppState().seasonsCacheList(
                                          uniqueQueryKey:
                                              seasonsCategoriesRecord.name,
                                          requestFn: () => querySeriesRecord(
                                            queryBuilder: (seriesRecord) =>
                                                seriesRecord
                                                    .where(
                                                      'category',
                                                      isEqualTo:
                                                          seasonsCategoriesRecord
                                                              .name,
                                                    )
                                                    .orderBy('created_at',
                                                        descending: true),
                                            limit: 10,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 50.0,
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
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewSeriesRecord =
                                                  listViewSeriesRecordList[
                                                      listViewIndex];
                                              return SeasonCardWidget(
                                                key: Key(
                                                    'Keyd13_${listViewIndex}_of_${listViewSeriesRecordList.length}'),
                                                posterImage:
                                                    listViewSeriesRecord
                                                        .backdropImage,
                                                titleImage: listViewSeriesRecord
                                                    .logoImage,
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
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 0.0),
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
                              Icons.search_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              context.pushNamed(SearchWidget.routeName);
                            },
                          ),
                          Builder(
                            builder: (context) => InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showAlignedDialog(
                                  context: context,
                                  isGlobal: false,
                                  avoidOverflow: true,
                                  targetAnchor: AlignmentDirectional(1.0, 1.0)
                                      .resolve(Directionality.of(context)),
                                  followerAnchor:
                                      AlignmentDirectional(1.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                  builder: (dialogContext) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: ProfileIconDropdownWidget(),
                                    );
                                  },
                                );
                              },
                              child: Container(
                                width: 32.0,
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).primary,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 200),
                                    fadeOutDuration:
                                        Duration(milliseconds: 200),
                                    imageUrl: homeDashboardProfilesRecord
                                        .profileImage,
                                    width: 200.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 24.0)),
                      ),
                    ],
                  ),
                ),
              ),
              wrapWithModel(
                model: _model.bottomNavBarModel,
                updateCallback: () => safeSetState(() {}),
                child: BottomNavBarWidget(
                  activeTab: 'home',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
