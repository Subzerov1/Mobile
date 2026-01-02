import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future _backgroundNotificationHandler(notification) async {}

class NotificationService {
  static final NotificationService instance = NotificationService._internal();
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  static Future<String?> get token => _messaging.getToken();
  NotificationService._internal();
  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  static void onTap(NotificationResponse details) {}

  Future<void> init() async {
    await _messaging.requestPermission();

    /// Create notification channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
      // sound: RawResourceAndroidNotificationSound("notification_sound"),
    );

    /// Define manifest notification channel
    await _plugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );
    await _plugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
    await _messaging.subscribeToTopic('test');
    await _messaging.subscribeToTopic('testNew');
    print("FCM ${await _messaging.getToken()}");
    FirebaseMessaging.onMessage.listen((notification) {
      showNotification(notification);
    });
    FirebaseMessaging.onBackgroundMessage(_backgroundNotificationHandler);
  }

  void showNotification(RemoteMessage notification) {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        'high_importance_channel',
        'High Importance Notifications',
        importance: Importance.max,
        priority: Priority.max,
        sound: RawResourceAndroidNotificationSound('notification_sound'),
      ),
    );
    _plugin.show(
      notification.hashCode,
      notification.notification?.title,
      notification.notification?.body,
      details,
      payload: notification.data.toString(),
    );
  }
}
