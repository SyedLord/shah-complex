import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_profile_model.dart';
export 'create_profile_model.dart';

class CreateProfileWidget extends StatefulWidget {
  const CreateProfileWidget({
    super.key,
    this.profileDoc,
    bool? isFirstProfile,
  }) : this.isFirstProfile = isFirstProfile ?? false;

  final ProfilesRecord? profileDoc;
  final bool isFirstProfile;

  static String routeName = 'CreateProfile';
  static String routePath = '/createProfile';

  @override
  State<CreateProfileWidget> createState() => _CreateProfileWidgetState();
}

class _CreateProfileWidgetState extends State<CreateProfileWidget> {
  late CreateProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateProfileModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tempSelectedAvatar = '';
      safeSetState(() {});
    });

    _model.profileNameTextController ??=
        TextEditingController(text: widget.profileDoc?.profileName);
    _model.profileNameFocusNode ??= FocusNode();

    _model.isKidsValue = false;
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ProfilesRecord>>(
      stream: queryProfilesRecord(
        parent: currentUserReference,
      ),
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
        List<ProfilesRecord> createProfileProfilesRecordList = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 64.0,
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(
                        FlutterFlowTheme.of(context).designToken.spacing.lg,
                        FlutterFlowTheme.of(context).designToken.spacing.md,
                        FlutterFlowTheme.of(context).designToken.spacing.lg,
                        FlutterFlowTheme.of(context).designToken.spacing.md),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FFButtonWidget(
                          onPressed: (widget.isFirstProfile == true)
                              ? null
                              : () async {
                                  context.safePop();
                                },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0x00E50914),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                            disabledTextColor: Color(0x80FFFFFF),
                          ),
                        ),
                        Text(
                          widget.profileDoc != null
                              ? 'Edit Profile'
                              : 'Add Profile',
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 17.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w800,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .fontStyle,
                                lineHeight: 1.3,
                              ),
                        ),
                        FFButtonWidget(
                          onPressed: (_model.profileNameTextController.text == '')
                              ? null
                              : () async {
                                  if (widget.profileDoc != null) {
                                    await widget.profileDoc!.reference
                                        .update(createProfilesRecordData(
                                      profileName:
                                          _model.profileNameTextController.text,
                                      profileImage: () {
                                        if (FFAppState().tempSelectedAvatar !=
                                                '') {
                                          return FFAppState()
                                              .tempSelectedAvatar;
                                        } else if (widget
                                                    .profileDoc?.profileImage !=
                                                null &&
                                            widget.profileDoc?.profileImage !=
                                                '') {
                                          return widget
                                              .profileDoc?.profileImage;
                                        } else {
                                          return 'https://wallpapers.com/images/hd/netflix-profile-pictures-1000-x-1000-qo9h82134t9nv0j0.jpg';
                                        }
                                      }(),
                                    ));
                                  } else {
                                    await ProfilesRecord.createDoc(
                                            currentUserReference!)
                                        .set(createProfilesRecordData(
                                      profileName:
                                          _model.profileNameTextController.text,
                                      profileImage: () {
                                        if (FFAppState().tempSelectedAvatar !=
                                                '') {
                                          return FFAppState()
                                              .tempSelectedAvatar;
                                        } else if (widget
                                                    .profileDoc?.profileImage !=
                                                null &&
                                            widget.profileDoc?.profileImage !=
                                                '') {
                                          return widget
                                              .profileDoc?.profileImage;
                                        } else {
                                          return 'https://wallpapers.com/images/hd/netflix-profile-pictures-1000-x-1000-qo9h82134t9nv0j0.jpg';
                                        }
                                      }(),
                                      isKids: false,
                                      isMainProfile: widget.isFirstProfile,
                                      createdAt: getCurrentTimestamp,
                                    ));
                                  }

                                  FFAppState().isEditMode =
                                      !(FFAppState().isEditMode ?? true);
                                  safeSetState(() {});

                                  context.goNamed(
                                      ProfileSelectionWidget.routeName);
                                },
                          text: 'Save',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0x00E50914),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                            disabledTextColor: Color(0x80FFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(
                      0.0,
                      FlutterFlowTheme.of(context).designToken.spacing.xl,
                      0.0,
                      0.0),
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(
                          FlutterFlowTheme.of(context).designToken.spacing.lg),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                FlutterFlowTheme.of(context)
                                    .designToken
                                    .radius
                                    .md),
                            child: Container(
                              width: 120.0,
                              height: 120.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    FlutterFlowTheme.of(context)
                                        .designToken
                                        .radius
                                        .md),
                              ),
                              child: Stack(
                                children: [
                                  CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 2),
                                    fadeOutDuration: Duration(milliseconds: 2),
                                    imageUrl: () {
                                      if (FFAppState().tempSelectedAvatar !=
                                              '') {
                                        return FFAppState().tempSelectedAvatar;
                                      } else if (widget
                                                  .profileDoc?.profileImage !=
                                              null &&
                                          widget.profileDoc?.profileImage !=
                                              '') {
                                        return widget.profileDoc!.profileImage;
                                      } else {
                                        return 'https://wallpapers.com/images/hd/netflix-profile-pictures-1000-x-1000-qo9h82134t9nv0j0.jpg';
                                      }
                                    }(),
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.contain,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 5.0, 5.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              ChooseProfileIconWidget
                                                  .routeName);
                                        },
                                        child: Container(
                                          width: 32.0,
                                          height: 32.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x88000000),
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
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.edit_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF333333),
                              borderRadius: BorderRadius.circular(
                                  FlutterFlowTheme.of(context)
                                      .designToken
                                      .radius
                                      .md),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 4.0, 16.0, 4.0),
                              child: TextFormField(
                                controller: _model.profileNameTextController,
                                focusNode: _model.profileNameFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.profileNameTextController',
                                  Duration(milliseconds: 2000),
                                  () async {
                                    safeSetState(() {});
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Profile Name',
                                  hintStyle: TextStyle(
                                    color: FlutterFlowTheme.of(context).hint,
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                                validator: _model
                                    .profileNameTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          if (_model.isHIdden == false)
                            Container(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0,
                                    0.0,
                                    0.0,
                                    FlutterFlowTheme.of(context)
                                        .designToken
                                        .spacing
                                        .md),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Kids',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontSize: 17.0,
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
                                          Text(
                                            'For ages 12 and under.',
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .fontStyle,
                                                  lineHeight: 1.4,
                                                ),
                                          ),
                                        ].divide(SizedBox(
                                            height: FlutterFlowTheme.of(context)
                                                .designToken
                                                .spacing
                                                .xs)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Switch(
                                          value: _model.isKidsValue!,
                                          onChanged: (newValue) async {
                                            safeSetState(() =>
                                                _model.isKidsValue = newValue);
                                          },
                                          activeThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          activeTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent1,
                                          inactiveTrackColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          inactiveThumbColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                        ),
                                        Container(
                                          width: 0.0,
                                          height: 0.0,
                                        ),
                                        Container(
                                          width: 0.0,
                                          height: 0.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if ((widget.profileDoc?.isMainProfile == false) &&
                              (widget.profileDoc != null))
                            FFButtonWidget(
                              onPressed: () async {
                                await actions.deleteContinueWatching(
                                  widget.profileDoc!.reference.id,
                                );
                                await actions.deleteAllProfileItems(
                                  'my_list',
                                  widget.profileDoc!.reference,
                                );
                                await widget.profileDoc!.reference.delete();

                                context
                                    .goNamed(ProfileSelectionWidget.routeName);
                              },
                              text: 'Delete Profile',
                              icon: FaIcon(
                                FontAwesomeIcons.trashAlt,
                                size: 15.0,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0x00E50914),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                        ].divide(SizedBox(
                            height: FlutterFlowTheme.of(context)
                                .designToken
                                .spacing
                                .xl)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
