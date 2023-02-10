import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'bluetoothOffScreen.dart';
import 'findDeviceScreen.dart';

FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
void main() {
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black87,
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return FindDevicesScreen();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}




