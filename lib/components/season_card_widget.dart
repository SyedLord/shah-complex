import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'season_card_model.dart';
export 'season_card_model.dart';

class SeasonCardWidget extends StatefulWidget {
  const SeasonCardWidget({
    super.key,
    String? posterImage,
    String? titleImage,
  })  : this.posterImage = posterImage ??
            'https://dimg.dreamflow.cloud/v1/image/Stranger%20Things%204%20cinematic%20landscape',
        this.titleImage = titleImage ??
            'https://dimg.dreamflow.cloud/v1/image/Stranger%20Things%204%20cinematic%20landscape';

  final String posterImage;
  final String titleImage;

  @override
  State<SeasonCardWidget> createState() => _SeasonCardWidgetState();
}

class _SeasonCardWidgetState extends State<SeasonCardWidget> {
  late SeasonCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeasonCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
          ],
        ),
      ),
    );
  }
}
