import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  DarwinInitializationSettings initializationSettingsDarwin =
      const DarwinInitializationSettings();

  Future<bool> init() async {
    try {
      final String timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation(timeZoneName));

      // Request permissions
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);

      final bool? requestAndorid = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.requestNotificationsPermission();
      final bool? requestIos = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      final bool? requestMacos = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(alert: true, badge: true, sound: true);

      // Initialize notifications
      InitializationSettings initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
          macOS: initializationSettingsDarwin);
      await flutterLocalNotificationsPlugin
          .initialize(initializationSettings)
          .then((value) {
        log("Notification status: $value ");
      });

      return Platform.isAndroid
          ? requestAndorid ?? false
          : Platform.isMacOS
              ? requestMacos ?? false
              : requestIos ?? false;
    } catch (e) {
      log('Error initializing notifications: $e');
      return false;
    }
  }


  /// Single prayer notification without azan
  Future<void> scheduleSinglePrayerNotification(
      {required String name,
      required int id,
      required String title,
      required String body,
      required DateTime scheduledTime,
      String? summary}) async {
    final BigTextStyleInformation styleInformation =
        BigTextStyleInformation(body, summaryText: summary);
    final AndroidNotificationDetails androidSpecifics =
        AndroidNotificationDetails(
            '$name id', // Different prayer time have different id
            '$name notification',
            channelDescription: 'Scheduled daily prayer notification',
            priority: Priority.max,
            importance: Importance.high,
            playSound: true,
            styleInformation: styleInformation,
            category: AndroidNotificationCategory.alarm,
            when: scheduledTime.millisecondsSinceEpoch,
            color: const Color(0xFF19e3cb));
    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails(
      interruptionLevel: InterruptionLevel.active,
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      presentBanner: true,
    );

    final platformChannelSpecifics = NotificationDetails(
        android: androidSpecifics,
        iOS: iosNotificationDetails,
        macOS: iosNotificationDetails);

    await FlutterLocalNotificationsPlugin().zonedSchedule(id, title, body,
        tz.TZDateTime.from(scheduledTime, tz.local), platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
