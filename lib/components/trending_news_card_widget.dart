import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'trending_news_card_model.dart';
export 'trending_news_card_model.dart';

class TrendingNewsCardWidget extends StatefulWidget {
  const TrendingNewsCardWidget({
    super.key,
    String? headline,
    String? img,
    String? tag,
    required this.logoImage,
  })  : this.headline = headline ??
            'Wednesday Season 2: Production officially begins in Ireland',
        this.img = img ??
            'https://dimg.dreamflow.cloud/v1/image/Wednesday%20Addams%20season%202%20production',
        this.tag = tag ?? 'NEW SEASON';

  final String headline;
  final String img;
  final String tag;
  final String? logoImage;

  @override
  State<TrendingNewsCardWidget> createState() => _TrendingNewsCardWidgetState();
}

class _TrendingNewsCardWidgetState extends State<TrendingNewsCardWidget> {
  late TrendingNewsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrendingNewsCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        width: 300.0,
        height: 260.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 100),
              fadeOutDuration: Duration(milliseconds: 100),
              imageUrl: valueOrDefault<String>(
                widget.img,
                'https://dimg.dreamflow.cloud/v1/image/Wednesday%20Addams%20season%202%20production',
              ),
              height: 160.0,
              fit: BoxFit.cover,
              alignment: Alignment(0.0, 0.0),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    valueOrDefault<String>(
                      widget.tag,
                      'NEW SEASON',
                    ),
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primary,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                          lineHeight: 1.2,
                        ),
                  ),
                  Stack(
                    children: [
                      if (widget.logoImage == null || widget.logoImage == '')
                        Text(
                          valueOrDefault<String>(
                            widget.headline,
                            'Wednesday Season 2: Production officially begins in Ireland',
                          ),
                          maxLines: 2,
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                                lineHeight: 1.3,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      if (widget.logoImage != null && widget.logoImage != '')
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 100),
                              fadeOutDuration: Duration(milliseconds: 100),
                              imageUrl: widget.logoImage!,
                              width: 200.0,
                              height: 50.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                    ],
                  ),
                ].divide(SizedBox(height: 4.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
