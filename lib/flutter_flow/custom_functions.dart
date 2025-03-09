import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool showCategoryInSearch(
  String searchFor,
  String searchIn,
) {
  return searchIn.toLowerCase().contains(searchFor.toLowerCase());
}

String? getFirstNChars(
  String inputString,
  int firstN,
) {
  // get the firstN characters of a string
  if (inputString == null || inputString.isEmpty) {
    return null;
  }
  if (firstN <= 0) {
    return '';
  }
  if (firstN >= inputString.length) {
    return inputString;
  }
  return inputString.substring(0, firstN);
}

String randomNamePrefix() {
  // a function that randomly returns a string from a static list of 12 strings
  final List<String> strings = [
    'Lil',
    'Young',
    'Big',
    'TopG',
    'Elder',
    'DaReal',
    'ThatG',
    'TheGoat',
    'TrueSage',
    'BigBoss',
    'TheSage',
    'DayOne',
    'BottomG'
  ];
  final random = math.Random();
  return strings[random.nextInt(strings.length)];
}

bool isImageInStorage(String? imageUrl) {
  if (imageUrl == null) {
    return false;
  }
  return imageUrl.startsWith('https://firebasestorage.googleapis.com/');
}

bool? isQOTDViewed(DateTime? qotdLastViewedTimestamp) {
// Get the current date and time in the user's timezone
  DateTime currentDateTime = DateTime.now();

  // Set the QOTD schedule time to 11:11 am EST
  DateTime qotdScheduleTime = DateTime(
      currentDateTime.year, currentDateTime.month, currentDateTime.day, 11, 11);

  // Compare the current time with the scheduled time for the QOTD
  if (currentDateTime.isAfter(qotdScheduleTime)) {
    // Compare the last viewed timestamp with the scheduled time for the QOTD
    if (qotdLastViewedTimestamp == null ||
        qotdLastViewedTimestamp.isBefore(qotdScheduleTime)) {
      // User has not viewed the current QOTD
      return false;
    }
  }

  // User has viewed the current QOTD
  return true;
}

bool clearCache(DateTime lastCacheClearTIme) {
  DateTime currentDate = DateTime.now();
  if (lastCacheClearTIme.day != currentDate.day ||
      lastCacheClearTIme.month != currentDate.month ||
      lastCacheClearTIme.year != currentDate.year) {
    return true;
  }

  return false;
}

bool isNumberInString(
  String numbersString,
  int targetInteger,
) {
  // Split the string into a list of individual numbers
  List<String> numbersList = numbersString.split(' ');

  // Convert each string in the list to an integer
  List<int> numbers =
      numbersList.map((numString) => int.tryParse(numString) ?? 0).toList();

  // Check if the target integer is present in the list
  return numbers.contains(targetInteger);
}

int? daysBetween(
  DateTime from,
  DateTime to,
) {
  DateTime fromWithoutTime = DateTime(from.year, from.month, from.day);
  DateTime toWithoutTime = DateTime(to.year, to.month, to.day);
  return (toWithoutTime.difference(fromWithoutTime).inDays);
}
