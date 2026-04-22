import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'local_filter_chip_model.dart';
export 'local_filter_chip_model.dart';

class LocalFilterChipWidget extends StatefulWidget {
  const LocalFilterChipWidget({
    super.key,
    String? label,
    bool? active,
  })  : this.label = label ?? 'All',
        this.active = active ?? true;

  final String label;
  final bool active;

  @override
  State<LocalFilterChipWidget> createState() => _LocalFilterChipWidgetState();
}

class _LocalFilterChipWidgetState extends State<LocalFilterChipWidget> {
  late LocalFilterChipModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocalFilterChipModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
      child: Container(),
    );
  }
}
