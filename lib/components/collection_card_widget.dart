import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'collection_card_model.dart';
export 'collection_card_model.dart';

class CollectionCardWidget extends StatefulWidget {
  const CollectionCardWidget({
    super.key,
    String? posterImage,
  }) : this.posterImage = posterImage ??
            'https://dimg.dreamflow.cloud/v1/image/Stranger%20Things%204%20cinematic%20landscape';

  final String posterImage;

  @override
  State<CollectionCardWidget> createState() => _CollectionCardWidgetState();
}

class _CollectionCardWidgetState extends State<CollectionCardWidget> {
  late CollectionCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CollectionCardModel());
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
          ],
        ),
      ),
    );
  }
}
