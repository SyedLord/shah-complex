import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/subscription_expired_widget.dart';
import '/components/update_app_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'episode_item_model.dart';
export 'episode_item_model.dart';

class EpisodeItemWidget extends StatefulWidget {
  const EpisodeItemWidget({
    super.key,
    required this.episodeDoc,
    required this.color,
  });

  final EpisodesRecord? episodeDoc;
  final Color? color;

  @override
  State<EpisodeItemWidget> createState() => _EpisodeItemWidgetState();
}

class _EpisodeItemWidgetState extends State<EpisodeItemWidget> {
  late EpisodeItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EpisodeItemModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
          0.0, 0.0, 0.0, FlutterFlowTheme.of(context).designToken.spacing.sm),
      child: Container(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(
              FlutterFlowTheme.of(context).designToken.radius.md),
        ),
        child: Padding(
          padding: EdgeInsets.all(
              FlutterFlowTheme.of(context).designToken.spacing.md),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    FlutterFlowTheme.of(context).designToken.radius.sm),
                child: Container(
                  width: 120.0,
                  height: 68.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        FlutterFlowTheme.of(context).designToken.radius.sm),
                  ),
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
                          imageUrl: widget.episodeDoc!.thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              if (FFAppState().appUpdate) {
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
                                      child: WebViewAware(
                                        child: UpdateAppPopupWidget(),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                if (currentUserDocument!.subscriptionExpiry! >=
                                    getCurrentTimestamp) {
                                  await actions.launchExternalPlayer(
                                    functions.emptyMovieDoc(),
                                    widget.episodeDoc,
                                    functions.emptyContinueDoc(),
                                    FFAppState().activeProfileRef!.id,
                                    widget.episodeDoc?.parentReference.id,
                                  );
                                } else {
                                  if (valueOrDefault<bool>(
                                          currentUserDocument?.isAdmin,
                                          false) ==
                                      true) {
                                    await actions.launchExternalPlayer(
                                      functions.emptyMovieDoc(),
                                      widget.episodeDoc,
                                      functions.emptyContinueDoc(),
                                      FFAppState().activeProfileRef!.id,
                                      widget.episodeDoc?.parentReference.id,
                                    );
                                  } else {
                                    await showDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: WebViewAware(
                                            child: SubscriptionExpiredWidget(),
                                          ),
                                        );
                                      },
                                    );
                                  }
                                }
                              }
                            },
                            child: Container(
                              width: 32.0,
                              height: 32.0,
                              decoration: BoxDecoration(
                                color: Color(0x66000000),
                                borderRadius: BorderRadius.circular(
                                    FlutterFlowTheme.of(context)
                                        .designToken
                                        .radius
                                        .full),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${widget.episodeDoc?.episodeNumber.toString()}. ${widget.episodeDoc?.title}',
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                            lineHeight: 1.4,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.episodeDoc?.duration,
                        '1h 10m',
                      ),
                      style: FlutterFlowTheme.of(context).labelSmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
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
                      height:
                          FlutterFlowTheme.of(context).designToken.spacing.xs)),
                ),
              ),
              if (_model.isHidden == false)
                FlutterFlowIconButton(
                  buttonSize: 40.0,
                  icon: Icon(
                    Icons.download_for_offline_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
            ].divide(SizedBox(
                width: FlutterFlowTheme.of(context).designToken.spacing.md)),
          ),
        ),
      ),
    );
  }
}
