import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> sendNotification(String? token, String title, String body) async {
  final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization':
          'AAAAxusjELA:APA91bEiHDBcow9zJsJnKl4GO2bCS9sswyletboyTiZNwmyj-UMdknHyB5xjOW7xuZeL1-9UD9kcCtY30u_wMbn2AMrz_2-_xcOgVEK4F0UbFH6yHcq5nLYd_XgIocGNtGqTPWYKvGBa',
    },
    body: json.encode(
      <String, dynamic>{
        'notification': <String, dynamic>{
          'body': body,
          'title': token,
        },
        'priority': 'high',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        },
        'to': token,
      },
    ),
  );

  if (response.statusCode == 200) {
    print('Notification sent successfully');
  } else {
    print('Failed to send notification');
  }
}

Future<void> sendNotificationWithImage(
    String token, String title, String body, String imageUrl) async {
  final url = Uri.parse('https://fcm.googleapis.com/fcm/send');
  final response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization':
          'key=AAAAxusjELA:APA91bEiHDBcow9zJsJnKl4GO2bCS9sswyletboyTiZNwmyj-UMdknHyB5xjOW7xuZeL1-9UD9kcCtY30u_wMbn2AMrz_2-_xcOgVEK4F0UbFH6yHcq5nLYd_XgIocGNtGqTPWYKvGBa',
    },
    body: jsonEncode(
      <String, dynamic>{
        'notification': <String, dynamic>{
          'body': body,
          'title': title,
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'sound': 'default',
          'badge': '1',
          'color': '#FF5733',
          'image': imageUrl, // Add the image URL here
        },
        'priority': 'high',
        'data': <String, dynamic>{
         'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        },
        'to': token,
      },
    ),
  );

  if (response.statusCode == 200) {
    print('Notification sent successfully');
  } else {
    print('Failed to send notification');
  }
}
