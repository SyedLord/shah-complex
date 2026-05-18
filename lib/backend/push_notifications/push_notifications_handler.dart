import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/Shah_Complex_Logo.png',
              width: 250.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'ProfileSelection': ParameterData.none(),
  'HomeDashboard': ParameterData.none(),
  'AllItems': (data) async => ParameterData(
        allParams: {
          'categoryName': getParameter<String>(data, 'categoryName'),
          'itemType': getParameter<String>(data, 'itemType'),
        },
      ),
  'MoviePage': (data) async => ParameterData(
        allParams: {
          'movieDoc': await getDocumentParameter<MoviesRecord>(
              data, 'movieDoc', MoviesRecord.fromSnapshot),
        },
      ),
  'SeasonPage': (data) async => ParameterData(
        allParams: {
          'seriesDoc': await getDocumentParameter<SeriesRecord>(
              data, 'seriesDoc', SeriesRecord.fromSnapshot),
        },
      ),
  'Login': ParameterData.none(),
  'CreateProfile': (data) async => ParameterData(
        allParams: {
          'profileDoc': await getDocumentParameter<ProfilesRecord>(
              data, 'profileDoc', ProfilesRecord.fromSnapshot),
          'isFirstProfile': getParameter<bool>(data, 'isFirstProfile'),
        },
      ),
  'ChooseProfileIcon': ParameterData.none(),
  'Search': ParameterData.none(),
  'FixMetadata': (data) async => ParameterData(
        allParams: {
          'docRefMovie': getParameter<DocumentReference>(data, 'docRefMovie'),
          'docRefSeries': getParameter<DocumentReference>(data, 'docRefSeries'),
          'mediaType': getParameter<String>(data, 'mediaType'),
        },
      ),
  'MyProfile': ParameterData.none(),
  'NewHot': ParameterData.none(),
  'EpisodePage': (data) async => ParameterData(
        allParams: {
          'episodeDoc': await getDocumentParameter<EpisodesRecord>(
              data, 'episodeDoc', EpisodesRecord.fromSnapshot),
          'totalSeasons': getParameter<int>(data, 'totalSeasons'),
          'alreadySelectedSeason':
              getParameter<int>(data, 'alreadySelectedSeason'),
          'titleLogoImage': getParameter<String>(data, 'titleLogoImage'),
        },
      ),
  'SignUp': ParameterData.none(),
  'CollectionPage': (data) async => ParameterData(
        allParams: {
          'collectionDoc': await getDocumentParameter<MovieCollectionsRecord>(
              data, 'collectionDoc', MovieCollectionsRecord.fromSnapshot),
        },
      ),
  'PasswordReset': ParameterData.none(),
  'PaymentSuccess': (data) async => ParameterData(
        allParams: {
          'nextBillingDate': getParameter<DateTime>(data, 'nextBillingDate'),
        },
      ),
  'SubscriptionPage': ParameterData.none(),
  'Browser': (data) async => ParameterData(
        allParams: {
          'url': getParameter<String>(data, 'url'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
