import 'package:flutter/material.dart';
import 'package:pizzaria/src/shared/constants/app.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

late StompClient _stompClient;
ValueNotifier<bool> _listener = ValueNotifier(false);

void _onConnect(StompClient stompClient, StompFrame stompFrame) {
  print(stompFrame.command);
  stompClient.subscribe(
    destination: '/topic/message',
    callback: (frame) {
      if (_listener.value) {
        _listener.value = false;
      } else {
        _listener.value = true;
      }
    },
  );
}

class WsController extends ChangeNotifier {
  StompClient get client => _stompClient = StompClient(
        config: StompConfig.SockJS(
          url: "${AppConstants.baseUrl}/ws-message",
          onConnect: (stompFrame) => _onConnect(_stompClient, stompFrame),
        ),
      );

  ValueNotifier<bool> get listener => _listener;
}
