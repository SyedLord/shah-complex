import '/backend/backend.dart';
import '/components/all_notification_card_widget.dart';
import '/components/bottom_nav_bar_widget.dart';
import '/components/trending_news_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'new_hot_model.dart';
export 'new_hot_model.dart';

class NewHotWidget extends StatefulWidget {
  const NewHotWidget({super.key});

  static String routeName = 'NewHot';
  static String routePath = '/newHot';

  @override
  State<NewHotWidget> createState() => _NewHotWidgetState();
}

class _NewHotWidgetState extends State<NewHotWidget> {
  late NewHotModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewHotModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: AlignmentDirectional(-1.0, -1.0),
          children: [
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                    child: Container(
                      child: FutureBuilder<int>(
                        future: queryNewsFeedRecordCount(),
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
                          int columnCount = snapshot.data!;

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 100.0,
                                decoration: BoxDecoration(),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    if (columnCount > 0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Latest Updates',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                    lineHeight: 1.3,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (columnCount > 0)
                                      Container(
                                        width: double.infinity,
                                        height: 260.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          child: StreamBuilder<
                                              List<NewsFeedRecord>>(
                                            stream: queryNewsFeedRecord(
                                              queryBuilder: (newsFeedRecord) =>
                                                  newsFeedRecord
                                                      .where(
                                                        'created_at',
                                                        isGreaterThanOrEqualTo:
                                                            functions
                                                                .getStartOfDay(),
                                                      )
                                                      .orderBy('created_at',
                                                          descending: true),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child: SpinKitPulse(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<NewsFeedRecord>
                                                  rowNewsFeedRecordList =
                                                  snapshot.data!;

                                              return ListView.separated(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: rowNewsFeedRecordList
                                                    .length,
                                                separatorBuilder: (_, __) =>
                                                    SizedBox(width: 10.0),
                                                itemBuilder:
                                                    (context, rowIndex) {
                                                  final rowNewsFeedRecord =
                                                      rowNewsFeedRecordList[
                                                          rowIndex];
                                                  return InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      if (rowNewsFeedRecord
                                                              .movieRef !=
                                                          null) {
                                                        _model.movieRef =
                                                            await MoviesRecord
                                                                .getDocumentOnce(
                                                                    rowNewsFeedRecord
                                                                        .movieRef!);
                                                        if (Navigator.of(
                                                                context)
                                                            .canPop()) {
                                                          context.pop();
                                                        }
                                                        context.pushNamed(
                                                          MoviePageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'movieDoc':
                                                                serializeParam(
                                                              _model.movieRef,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'movieDoc':
                                                                _model.movieRef,
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                            ),
                                                          },
                                                        );
                                                      } else {
                                                        _model.seriesRef =
                                                            await SeriesRecord
                                                                .getDocumentOnce(
                                                                    rowNewsFeedRecord
                                                                        .seriesRef!);
                                                        if (Navigator.of(
                                                                context)
                                                            .canPop()) {
                                                          context.pop();
                                                        }
                                                        context.pushNamed(
                                                          SeasonPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'seriesDoc':
                                                                serializeParam(
                                                              _model.seriesRef,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'seriesDoc': _model
                                                                .seriesRef,
                                                            '__transition_info__':
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                            ),
                                                          },
                                                        );
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    child:
                                                        TrendingNewsCardWidget(
                                                      key: Key(
                                                          'Key9pd_${rowIndex}_of_${rowNewsFeedRecordList.length}'),
                                                      headline:
                                                          rowNewsFeedRecord
                                                              .title,
                                                      img: rowNewsFeedRecord
                                                          .imageUrl,
                                                      tag:
                                                          rowNewsFeedRecord.tag,
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                              if (columnCount > 0)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 16.0, 24.0, 16.0),
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Divider(
                                      height: 16.0,
                                      thickness: 1.0,
                                      indent: 0.0,
                                      endIndent: 0.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ),
                                ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 0.0, 24.0),
                                    child: Text(
                                      'All Notifications',
                                      style: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                            lineHeight: 1.2,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    child: StreamBuilder<List<NewsFeedRecord>>(
                                      stream: queryNewsFeedRecord(
                                        queryBuilder: (newsFeedRecord) =>
                                            newsFeedRecord.orderBy('created_at',
                                                descending: true),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<NewsFeedRecord>
                                            listViewNewsFeedRecordList =
                                            snapshot.data!;
                                        if (listViewNewsFeedRecordList
                                            .isEmpty) {
                                          return Center(
                                            child: Image.asset(
                                              'assets/images/ChatGPT_Image_Apr_26,_2026,_02_17_28_PM.png',
                                              fit: BoxFit.contain,
                                            ),
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewNewsFeedRecordList.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(height: 24.0),
                                          itemBuilder:
                                              (context, listViewIndex) {
                                            final listViewNewsFeedRecord =
                                                listViewNewsFeedRecordList[
                                                    listViewIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (listViewNewsFeedRecord
                                                        .movieRef !=
                                                    null) {
                                                  _model.movieRef1 =
                                                      await MoviesRecord
                                                          .getDocumentOnce(
                                                              listViewNewsFeedRecord
                                                                  .movieRef!);
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    MoviePageWidget.routeName,
                                                    queryParameters: {
                                                      'movieDoc':
                                                          serializeParam(
                                                        _model.movieRef1,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'movieDoc':
                                                          _model.movieRef1,
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                } else {
                                                  _model.seriesRef1 =
                                                      await SeriesRecord
                                                          .getDocumentOnce(
                                                              listViewNewsFeedRecord
                                                                  .seriesRef!);
                                                  if (Navigator.of(context)
                                                      .canPop()) {
                                                    context.pop();
                                                  }
                                                  context.pushNamed(
                                                    SeasonPageWidget.routeName,
                                                    queryParameters: {
                                                      'seriesDoc':
                                                          serializeParam(
                                                        _model.seriesRef1,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'seriesDoc':
                                                          _model.seriesRef1,
                                                      '__transition_info__':
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                }

                                                safeSetState(() {});
                                              },
                                              child: AllNotificationCardWidget(
                                                key: Key(
                                                    'Key84q_${listViewIndex}_of_${listViewNewsFeedRecordList.length}'),
                                                date: dateTimeFormat(
                                                    "MMM dd",
                                                    listViewNewsFeedRecord
                                                        .createdAt),
                                                description:
                                                    listViewNewsFeedRecord
                                                        .description,
                                                genres: listViewNewsFeedRecord
                                                    .genres,
                                                title: listViewNewsFeedRecord
                                                    .title,
                                                trailer_img:
                                                    listViewNewsFeedRecord
                                                        .imageUrl,
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 40.0, 24.0, 0.0),
              child: Container(
                decoration: BoxDecoration(),
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
                        Image.asset(
                          'assets/images/Shah_Complex_Logo.png',
                          width: 32.0,
                          height: 32.0,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          'New & Hot',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                                lineHeight: 1.2,
                              ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 8.0,
                          buttonSize: 40.0,
                          fillColor: Colors.transparent,
                          icon: Icon(
                            Icons.search_rounded,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            if (Navigator.of(context).canPop()) {
                              context.pop();
                            }
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
                activeTab: 'news',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
