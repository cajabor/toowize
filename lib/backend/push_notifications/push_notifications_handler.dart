import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

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
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
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
          color: const Color(0xFF150E20),
          child: Image.asset(
            'assets/images/purpleQuoteCurvedIcon.png',
            fit: BoxFit.fitWidth,
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
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'homePage': ParameterData.none(),
  'notifications': ParameterData.none(),
  'searchPage': ParameterData.none(),
  'categories': ParameterData.none(),
  'createPage': ParameterData.none(),
  'QOTD': ParameterData.none(),
  'quoteDetailPage': (data) async {
    final allParams = {
      'quoteRef': getParameter<DocumentReference>(data, 'quoteRef'),
      'parentPage': getParameter<String>(data, 'parentPage'),
    };
    return ParameterData(
      requiredParams: {
        'quoteRef': serializeParam(
          allParams['quoteRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'emailSignup': ParameterData.none(),
  'setDisplayNamePic': ParameterData.none(),
  'authPage': ParameterData.none(),
  'resetPassword': ParameterData.none(),
  'editProfile': ParameterData.none(),
  'blockedUsers': ParameterData.none(),
  'profilePage': ParameterData.none(),
  'myFollowers': ParameterData.none(),
  'userDetailFollowers': (data) async => ParameterData(
        allParams: {
          'userDetailRef':
              getParameter<DocumentReference>(data, 'userDetailRef'),
          'userDisplayName': getParameter<String>(data, 'userDisplayName'),
        },
      ),
  'userDetailFollowing': (data) async => ParameterData(
        allParams: {
          'userDoc': await getDocumentParameter<UsersRecord>(
              data, 'userDoc', UsersRecord.fromSnapshot),
        },
      ),
  'settings': ParameterData.none(),
  'userDetailPage': (data) async {
    final allParams = {
      'userDetailRef': getParameter<DocumentReference>(data, 'userDetailRef'),
    };
    return ParameterData(
      requiredParams: {
        'userDetailRef': serializeParam(
          allParams['userDetailRef'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'likedQuotes': ParameterData.none(),
  'manageSubscription': ParameterData.none(),
  'notificationsSettings': ParameterData.none(),
  'suggestionsPage': ParameterData.none(),
  'Donate': ParameterData.none(),
  'termsOfService': ParameterData.none(),
  'privacyPolicy': ParameterData.none(),
  'myFollowing': ParameterData.none(),
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
