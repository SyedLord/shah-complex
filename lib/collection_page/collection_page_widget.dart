import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/description_widget_widget.dart';
import '/components/movie_card_widget.dart';
import '/components/subscription_expired_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'collection_page_model.dart';
export 'collection_page_model.dart';

class CollectionPageWidget extends StatefulWidget {
  const CollectionPageWidget({
    super.key,
    required this.collectionDoc,
  });

  final MovieCollectionsRecord? collectionDoc;

  static String routeName = 'CollectionPage';
  static String routePath = '/collectionPage';

  @override
  State<CollectionPageWidget> createState() => _CollectionPageWidgetState();
}

class _CollectionPageWidgetState extends State<CollectionPageWidget> {
  late CollectionPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CollectionPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserDocument!.subscriptionExpiry! < getCurrentTimestamp) {
        if (valueOrDefault<bool>(currentUserDocument?.isAdmin, false) != true) {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: SubscriptionExpiredWidget(),
              );
            },
          );
        }
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
    return Builder(
      builder: (context) => Scaffold(
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
                    height: 220.0,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 0),
                          fadeOutDuration: Duration(milliseconds: 0),
                          imageUrl: widget.collectionDoc!.backdropImage,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          width: double.infinity,
                          height: 300.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primaryBackground,
                                Colors.transparent
                              ],
                              stops: [0.0, 0.6],
                              begin: AlignmentDirectional(0.0, 1.0),
                              end: AlignmentDirectional(0, -1.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 5.0, 24.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  wrapWithModel(
                                    model: _model.movieCardModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: MovieCardWidget(
                                      img: widget.collectionDoc?.posterImage,
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      widget.collectionDoc?.name,
                                      'Title',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.w900,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 26.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                          lineHeight: 1.2,
                                        ),
                                  ),
                                  wrapWithModel(
                                    model: _model.descriptionWidgetModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: DescriptionWidgetWidget(
                                      description:
                                          widget.collectionDoc?.overview,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(),
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).divider,
                              ),
                            ].divide(SizedBox(
                                height: FlutterFlowTheme.of(context)
                                    .designToken
                                    .spacing
                                    .md)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 24.0),
                      child: FutureBuilder<List<MoviesRecord>>(
                        future: queryMoviesRecordOnce(
                          queryBuilder: (moviesRecord) => moviesRecord
                              .where(
                                'collection_ref',
                                isEqualTo: widget.collectionDoc?.reference,
                              )
                              .orderBy('release_year'),
                          limit: 9,
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
                          List<MoviesRecord> gridViewMoviesRecordList =
                              snapshot.data!;

                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: FlutterFlowTheme.of(context)
                                  .designToken
                                  .spacing
                                  .md,
                              mainAxisSpacing: FlutterFlowTheme.of(context)
                                  .designToken
                                  .spacing
                                  .md,
                              childAspectRatio: 0.6,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            itemCount: gridViewMoviesRecordList.length,
                            itemBuilder: (context, gridViewIndex) {
                              final gridViewMoviesRecord =
                                  gridViewMoviesRecordList[gridViewIndex];
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
                                        gridViewMoviesRecord,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'movieDoc': gridViewMoviesRecord,
                                      '__transition_info__': TransitionInfo(
                                        hasTransition: true,
                                        transitionType: PageTransitionType.fade,
                                      ),
                                    },
                                  );
                                },
                                child: MovieCardWidget(
                                  key: Key(
                                      'Key85w_${gridViewIndex}_of_${gridViewMoviesRecordList.length}'),
                                  img: gridViewMoviesRecord.posterImage,
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
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Container(
                height: 120.0,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      FlutterFlowTheme.of(context).designToken.spacing.md,
                      48.0,
                      FlutterFlowTheme.of(context).designToken.spacing.md,
                      0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          color: Color(0x88000000),
                          borderRadius: BorderRadius.circular(
                              FlutterFlowTheme.of(context)
                                  .designToken
                                  .radius
                                  .full),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: FlutterFlowIconButton(
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
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0x88000000),
                              borderRadius: BorderRadius.circular(
                                  FlutterFlowTheme.of(context)
                                      .designToken
                                      .radius
                                      .full),
                            ),
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FlutterFlowIconButton(
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.search_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 20.0,
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
                          ),
                          if (_model.isHidden == false)
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                color: Color(0x88000000),
                                borderRadius: BorderRadius.circular(
                                    FlutterFlowTheme.of(context)
                                        .designToken
                                        .radius
                                        .full),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.keyboard_control_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                ),
                                onPressed: () async {},
                              ),
                            ),
                        ].divide(SizedBox(
                            width: FlutterFlowTheme.of(context)
                                .designToken
                                .spacing
                                .md)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
