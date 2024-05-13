import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:quranic_calm/modules/settings/service/notification/notification_service.dart';

class ScheduledNotificationHelper {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Check if app can schedule notification on Android 13+ (S+). Always return true on Android 12 and below.
  /// faqat schedule ni qabul qiladigan permission uchun ishlatildi Flutter_Local_Notification
  Future<bool> canScheduleNotification() async {
    final androidNotif =
        flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    // underlying implementation: https://github.com/MaikuB/flutter_local_notifications/blob/ca71c96ba2a245175b44471e2e41e4958d480876/flutter_local_notifications/android/src/main/java/com/dexterous/flutterlocalnotifications/FlutterLocalNotificationsPlugin.java#L2119
    final res = await androidNotif?.canScheduleExactNotifications();
    return res ?? false;
  }

  /// Schedule notification for each prayer time.
  void schedulePrayNotification(DateTime time) async {
    if (!await canScheduleNotification()) {
      print(
          'Notifications are not scheduled. Schedule notification permission is not granted huhu');
      return;
    }
    if (await NotificationService().init()) {
      await flutterLocalNotificationsPlugin.cancelAll(); //reset all
      final currentDateTime = DateTime.now();
      await _defaultScheduler(time, currentDateTime);
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _defaultScheduler(
      DateTime scheduletime, DateTime currentDateTime) async {
    if (scheduletime.isAfter(currentDateTime)) {
      //to make sure the time is in future
      await NotificationService().scheduleSinglePrayerNotification(
        name: 'Quron',
        // Note: previosly, there was a bug with this id.
        // Read more: https://github.com/mptwaktusolat/app_waktu_solat_malaysia/issues/201
        id: int.parse(scheduletime.millisecondsSinceEpoch
            .toString()
            .replaceAll(RegExp(r'0+$'), "")),
        title: 'Quron eshitish vaqti',
        scheduledTime: scheduletime,
        body: 'Quron eshitish vaqti',
      );
    }
  }
}
