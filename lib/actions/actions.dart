import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future likeQuoteActions(
  BuildContext context, {
  required QuotesRecord? quoteDoc,
}) async {
  UsersRecord? togglepostedByDoc69;
  UsersRecord? togglepostedByDoc111;
  UsersRecord? togglepostedByDoc500;
  UsersRecord? togglepostedByDoc1k;
  UsersRecord? togglepostedByDoc10k;

  if (!quoteDoc!.likedByUsers.contains(currentUserUid)) {
    logFirebaseEvent('likeQuoteActions_haptic_feedback');
    HapticFeedback.mediumImpact();
    logFirebaseEvent('likeQuoteActions_backend_call');

    await quoteDoc.reference.update({
      ...createQuotesRecordData(
        randomIndex: random_data.randomString(
          12,
          12,
          true,
          true,
          true,
        ),
      ),
      ...mapToFirestore(
        {
          'foulRating': FieldValue.increment(-(1)),
        },
      ),
    });
    if ((quoteDoc.likedByUsers.length >= 69) &&
        quoteDoc.likesMilestones.milestone69) {
      logFirebaseEvent('likeQuoteActions_backend_call');
      unawaited(
        () async {
          await UserNotificationsRecord.createDoc(quoteDoc.postedBy!)
              .set(createUserNotificationsRecordData(
            notificationType: 'likes_milestone',
            notificationHeader: 'Nice 😏',
            createdTime: getCurrentTimestamp,
            quoteRef: quoteDoc.reference,
            externalUserRef: currentUserReference,
            notificationBody:
                'Your quote on \"${functions.getFirstNChars(quoteDoc.quoteText, 25)}...\" reached 69 likes!',
          ));
        }(),
      );
      // Make quote recommended and update milestone
      logFirebaseEvent('likeQuoteActions_Makequoterecommendedand');
      unawaited(
        () async {
          await quoteDoc.reference.update({
            ...createQuotesRecordData(
              likesMilestones: createLikesMilestonesStruct(
                milestone69: true,
                clearUnsetFields: false,
              ),
            ),
            ...mapToFirestore(
              {
                'categories_posted_to': FieldValue.arrayUnion(
                    [FFAppState().recommendedCategoryRef]),
              },
            ),
          });
        }(),
      );
      logFirebaseEvent('likeQuoteActions_backend_call');
      togglepostedByDoc69 =
          await UsersRecord.getDocumentOnce(quoteDoc.postedBy!);
      if (togglepostedByDoc69.settings.likesMilestonesNotifications) {
        logFirebaseEvent('likeQuoteActions_trigger_push_notificati');
        triggerPushNotification(
          notificationTitle: 'Nice 😏',
          notificationText:
              'Your quote on \"${functions.getFirstNChars(quoteDoc.quoteText, 35)}...\" reached 69 likes!',
          notificationImageUrl: quoteDoc.backgroundImage,
          notificationSound: 'default',
          userRefs: [quoteDoc.postedBy!],
          initialPageName: 'quoteDetailPage',
          parameterData: {
            'quoteRef': quoteDoc.reference,
            'parentPage': 'pushNotification',
          },
        );
      }
    } else {
      if ((quoteDoc.likedByUsers.length == 111) &&
          quoteDoc.likesMilestones.milestone111) {
        logFirebaseEvent('likeQuoteActions_backend_call');
        unawaited(
          () async {
            await UserNotificationsRecord.createDoc(quoteDoc.postedBy!)
                .set(createUserNotificationsRecordData(
              notificationType: 'likes_milestone',
              notificationHeader:
                  'Perfectly balanced, as all things should be ⚖️',
              createdTime: getCurrentTimestamp,
              quoteRef: quoteDoc.reference,
              externalUserRef: currentUserReference,
              notificationBody:
                  'Your quote on \"${functions.getFirstNChars(quoteDoc.quoteText, 25)}...\" reached 111 likes!',
            ));
          }(),
        );
        logFirebaseEvent('likeQuoteActions_backend_call');
        unawaited(
          () async {
            await quoteDoc.reference.update(createQuotesRecordData(
              likesMilestones: createLikesMilestonesStruct(
                milestone111: true,
                clearUnsetFields: false,
              ),
            ));
          }(),
        );
        logFirebaseEvent('likeQuoteActions_backend_call');
        togglepostedByDoc111 =
            await UsersRecord.getDocumentOnce(quoteDoc.postedBy!);
        if (togglepostedByDoc111.settings.likesMilestonesNotifications) {
          logFirebaseEvent('likeQuoteActions_trigger_push_notificati');
          triggerPushNotification(
            notificationTitle: 'Perfectly balanced, as all things should be ⚖️',
            notificationText:
                'Your quote on \"${functions.getFirstNChars(quoteDoc.quoteText, 35)}...\" reached 111 likes!',
            notificationImageUrl: quoteDoc.backgroundImage,
            notificationSound: 'default',
            userRefs: [quoteDoc.postedBy!],
            initialPageName: 'quoteDetailPage',
            parameterData: {
              'quoteRef': quoteDoc.reference,
              'parentPage': 'pushNotification',
            },
          );
        }
      } else {
        if ((quoteDoc.likedByUsers.length == 500) &&
            quoteDoc.likesMilestones.milestone500) {
          logFirebaseEvent('likeQuoteActions_backend_call');
          unawaited(
            () async {
              await UserNotificationsRecord.createDoc(quoteDoc.postedBy!)
                  .set(createUserNotificationsRecordData(
                notificationType: 'likes_milestone',
                notificationHeader: 'Heating up 🔥',
                createdTime: getCurrentTimestamp,
                quoteRef: quoteDoc.reference,
                externalUserRef: currentUserReference,
                notificationBody:
                    'Your quote on \"${functions.getFirstNChars(quoteDoc.quoteText, 25)}...\" reached 500 likes!',
              ));
            }(),
          );
          logFirebaseEvent('likeQuoteActions_backend_call');
          unawaited(
            () async {
              await quoteDoc.reference.update(createQuotesRecordData(
                likesMilestones: createLikesMilestonesStruct(
                  milestone500: true,
                  clearUnsetFields: false,
                ),
              ));
            }(),
          );
          logFirebaseEvent('likeQuoteActions_backend_call');
          togglepostedByDoc500 =
              await UsersRecord.getDocumentOnce(quoteDoc.postedBy!);
          if (togglepostedByDoc500.settings.likesMilestonesNotifications) {
            logFirebaseEvent('likeQuoteActions_trigger_push_notificati');
            triggerPushNotification(
              notificationTitle: 'Heating up 🔥',
              notificationText:
                  'Your quote on \"${functions.getFirstNChars(quoteDoc.quoteText, 35)}...\" reached 500 likes!',
              notificationImageUrl: quoteDoc.backgroundImage,
              notificationSound: 'default',
              userRefs: [quoteDoc.postedBy!],
              initialPageName: 'quoteDetailPage',
              parameterData: {
                'quoteRef': quoteDoc.reference,
                'parentPage': 'pushNotification',
              },
            );
          }
        } else {
          if ((quoteDoc.likedByUsers.length == 1000) &&
              quoteDoc.likesMilestones.milestone1000) {
            logFirebaseEvent('likeQuoteActions_backend_call');
            unawaited(
              () async {
                await UserNotificationsRecord.createDoc(quoteDoc.postedBy!)
                    .set(createUserNotificationsRecordData(
                  notificationType: 'likes_milestone',
                  notificationHeader: 'First 1K Likes! 😮‍💨',
                  createdTime: getCurrentTimestamp,
                  quoteRef: quoteDoc.reference,
                  externalUserRef: currentUserReference,
                  notificationBody:
                      'Your quote on \"${functions.getFirstNChars(quoteDoc.quoteText, 25)}...\" reached 1000 likes!',
                ));
              }(),
            );
            logFirebaseEvent('likeQuoteActions_backend_call');
            unawaited(
              () async {
                await quoteDoc.reference.update(createQuotesRecordData(
                  likesMilestones: createLikesMilestonesStruct(
                    milestone1000: true,
                    clearUnsetFields: false,
                  ),
                ));
              }(),
            );
            logFirebaseEvent('likeQuoteActions_backend_call');
            togglepostedByDoc1k =
                await UsersRecord.getDocumentOnce(quoteDoc.postedBy!);
            if (togglepostedByDoc1k.settings.likesMilestonesNotifications) {
              logFirebaseEvent('likeQuoteActions_trigger_push_notificati');
              triggerPushNotification(
                notificationTitle: 'First 1K Likes! 😮‍💨',
                notificationText:
                    'Your quote on \"${functions.getFirstNChars(quoteDoc.quoteText, 35)}...\" reached 1000 likes!',
                notificationImageUrl: quoteDoc.backgroundImage,
                notificationSound: 'default',
                userRefs: [quoteDoc.postedBy!],
                initialPageName: 'quoteDetailPage',
                parameterData: {
                  'quoteRef': quoteDoc.reference,
                  'parentPage': 'pushNotification',
                },
              );
            }
          } else {
            if ((quoteDoc.likedByUsers.length == 10000) &&
                quoteDoc.likesMilestones.milestone10000) {
              logFirebaseEvent('likeQuoteActions_backend_call');
              unawaited(
                () async {
                  await UserNotificationsRecord.createDoc(quoteDoc.postedBy!)
                      .set(createUserNotificationsRecordData(
                    notificationType: 'likes_milestone',
                    notificationHeader: '10K Likes! Not bad 😏',
                    createdTime: getCurrentTimestamp,
                    quoteRef: quoteDoc.reference,
                    externalUserRef: currentUserReference,
                    notificationBody:
                        'Your quote on \"${functions.getFirstNChars(quoteDoc.quoteText, 25)}...\" reached 10,000 likes!',
                  ));
                }(),
              );
              logFirebaseEvent('likeQuoteActions_backend_call');
              unawaited(
                () async {
                  await quoteDoc.reference.update(createQuotesRecordData(
                    likesMilestones: createLikesMilestonesStruct(
                      milestone10000: false,
                      clearUnsetFields: false,
                    ),
                  ));
                }(),
              );
              logFirebaseEvent('likeQuoteActions_backend_call');
              togglepostedByDoc10k =
                  await UsersRecord.getDocumentOnce(quoteDoc.postedBy!);
              if (togglepostedByDoc10k.settings.likesMilestonesNotifications) {
                logFirebaseEvent('likeQuoteActions_trigger_push_notificati');
                triggerPushNotification(
                  notificationTitle: '10K Likes! Not bad 😏',
                  notificationText:
                      'Your quote on \"${functions.getFirstNChars(quoteDoc.quoteText, 35)}...\" reached 10,000 likes!',
                  notificationImageUrl: quoteDoc.backgroundImage,
                  notificationSound: 'default',
                  userRefs: [quoteDoc.postedBy!],
                  initialPageName: 'quoteDetailPage',
                  parameterData: {
                    'quoteRef': quoteDoc.reference,
                    'parentPage': 'pushNotification',
                  },
                );
              }
            }
          }
        }
      }
    }
  }
}
