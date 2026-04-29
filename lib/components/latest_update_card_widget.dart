import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'latest_update_card_model.dart';
export 'latest_update_card_model.dart';

class LatestUpdateCardWidget extends StatefulWidget {
  const LatestUpdateCardWidget({
    super.key,
    String? posterImage,
    String? titleImage,
    this.tag,
  })  : this.posterImage = posterImage ??
            'https://dimg.dreamflow.cloud/v1/image/Stranger%20Things%204%20cinematic%20landscape',
        this.titleImage = titleImage ??
            'https://dimg.dreamflow.cloud/v1/image/Stranger%20Things%204%20cinematic%20landscape';

  final String posterImage;
  final String titleImage;
  final String? tag;

  @override
  State<LatestUpdateCardWidget> createState() => _LatestUpdateCardWidgetState();
}

class _LatestUpdateCardWidgetState extends State<LatestUpdateCardWidget> {
  late LatestUpdateCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LatestUpdateCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 120.0,
      decoration: BoxDecoration(),
      child: Container(
        width: 180.0,
        height: 120.0,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 200),
                fadeOutDuration: Duration(milliseconds: 200),
                imageUrl: widget.posterImage,
                width: 180.0,
                height: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            if (widget.titleImage != '')
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: CachedNetworkImage(
                      fadeInDuration: Duration(milliseconds: 200),
                      fadeOutDuration: Duration(milliseconds: 200),
                      imageUrl: widget.titleImage,
                      width: 100.0,
                      height: 50.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            if (widget.tag != null && widget.tag != '')
              Align(
                alignment: AlignmentDirectional(1.0, -1.0),
                child: Container(
                  width: 70.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24.0),
                    ),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.tag,
                        'TAG',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 8.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
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
