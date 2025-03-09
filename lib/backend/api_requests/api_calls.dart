import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ModerateTextCall {
  static Future<ApiCallResponse> call({
    String? screenedText = '',
    String? key = '',
  }) async {
    final ffApiRequestBody = '''
{"$screenedText"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'moderateText',
      apiUrl:
          'https://toowizemoderate.cognitiveservices.azure.com/contentmoderator/moderate/v1.0/ProcessText/Screen?autocorrect=false&PII=true&classify=True',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'text/plain',
        'Ocp-Apim-Subscription-Key': '$key',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? score1(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Classification.Category1.Score''',
      ));
  static double? score2(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Classification.Category2.Score''',
      ));
  static double? score3(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.Classification.Category3.Score''',
      ));
  static dynamic pii(dynamic response) => getJsonField(
        response,
        r'''$.PII''',
      );
}

class ModerateImageCall {
  static Future<ApiCallResponse> call({
    String? screenedImage = '',
    String? key = '',
  }) async {
    final ffApiRequestBody = '''
{
  "DataRepresentation": "URL",
  "Value": "$screenedImage"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'moderateImage',
      apiUrl:
          'https://toowizemoderate.cognitiveservices.azure.com/contentmoderator/moderate/v1.0/ProcessImage/Evaluate',
      callType: ApiCallType.POST,
      headers: {
        'Ocp-Apim-Subscription-Key': '$key',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? racyScore(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.RacyClassificationScore''',
      ));
  static bool? isAdultImage(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.IsImageAdultClassified''',
      ));
}

class GoogleImageSearchCall {
  static Future<ApiCallResponse> call({
    String? query = 'popular musical celebrities',
    String? key = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'googleImageSearch',
      apiUrl:
          'https://customsearch.googleapis.com/customsearch/v1?cx=b32b82771261e4bf3&imgType=photo&num=10&q=$query&safe=high&searchType=image&key=$key',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
      },
      params: {
        'query': query,
        'key': key,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? imageLinks(dynamic response) => (getJsonField(
        response,
        r'''$.items[:].link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static dynamic itemsReturned(dynamic response) => getJsonField(
        response,
        r'''$.items''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
