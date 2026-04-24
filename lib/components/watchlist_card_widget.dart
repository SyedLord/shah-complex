import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'watchlist_card_model.dart';
export 'watchlist_card_model.dart';

class WatchlistCardWidget extends StatefulWidget {
  const WatchlistCardWidget({
    super.key,
    String? img,
  }) : this.img = img ??
            'https://dimg.dreamflow.cloud/v1/image/Jujutsu%20Kaisen%20anime%20poster';

  final String img;

  @override
  State<WatchlistCardWidget> createState() => _WatchlistCardWidgetState();
}

class _WatchlistCardWidgetState extends State<WatchlistCardWidget> {
  late WatchlistCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WatchlistCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            width: 110.0,
            height: 160.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              shape: BoxShape.rectangle,
            ),
            child: Stack(
              alignment: AlignmentDirectional(-1.0, -1.0),
              children: [
                CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 0),
                  fadeOutDuration: Duration(milliseconds: 0),
                  imageUrl: valueOrDefault<String>(
                    widget.img,
                    'https://dimg.dreamflow.cloud/v1/image/Jujutsu%20Kaisen%20anime%20poster',
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment(0.0, 0.0),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xCCE50914),
                            borderRadius: BorderRadius.circular(4.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 2.0, 4.0, 2.0),
                            child: Container(
                              child: Text(
                                'New',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
