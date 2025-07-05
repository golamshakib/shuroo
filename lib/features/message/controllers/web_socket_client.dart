import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketClient {
  WebSocketChannel? _channel;
  Function(String)? onMessageReceived;
  String? _socketUrl;
  bool _isConnected = false;

  // Reconnect delay
  final Duration _reconnectDelay = const Duration(seconds: 5);

  // Initialize Socket
  void connect(String socketUrl) {
    _socketUrl = socketUrl;
    _connect();
  }

  void _connect() {
    if (_socketUrl == null) return;

    _channel = WebSocketChannel.connect(Uri.parse(_socketUrl!));
    _isConnected = true;

    _channel?.stream.listen(
          (message) {
        debugPrint("Received WebSocket Message: $message");
        onMessageReceived?.call(message);
      },
      onError: (error) {
        debugPrint("WebSocket error: $error");
        _isConnected = false;
        _reconnect();
      },
      onDone: () {
        log("WebSocket connection closed");
        _isConnected = false;
        _reconnect();
      },
      cancelOnError: true,
    );

    debugPrint("WebSocket connected to $_socketUrl");
  }

  // Auto-Reconnect logic
  void _reconnect() async {
    if (_isConnected) return; // Prevent multiple reconnections

    debugPrint("Reconnecting in ${_reconnectDelay.inSeconds} seconds...");
    await Future.delayed(_reconnectDelay);

    if (!_isConnected) {
      debugPrint("Attempting to reconnect...");
      _connect();
    }
  }

  // Join room
  void joinRoom(String? user1Id, String user2Id) {
    final message = jsonEncode({
      "type": "joinRoom",
      "user1Id": user1Id,
      "user2Id": user2Id,
    });
    _sendMessage(message);
  }

  // View messages in a chatroom
  void viewMessage(String chatroomId, String userId) {
    final message = jsonEncode({
      "type": "viewMessage",
      "chatroomId": chatroomId,
      "userId": userId,
    });
    _sendMessage(message);
  }

  // Send Message
  void sendMessage(Map<String, dynamic> message) {
    final encodedMessage = jsonEncode(message);
    _sendMessage(encodedMessage);
  }

  void _sendMessage(String message) {
    if (_isConnected && _channel != null) {
      _channel!.sink.add(message);
      log("Message sent: $message");
    } else {
      debugPrint("WebSocket is not connected. Message not sent.");
    }
  }

  // Disconnect from socket
  void disconnect() {
    try {
      _channel?.sink.close(status.normalClosure);
      _isConnected = false;
      log("WebSocket connection closed manually.");
    } catch (e) {
      debugPrint("Error closing WebSocket: $e");
    }
  }

  // Callback function for incoming message
  void setOnMessageReceived(Function(String) callback) {
    onMessageReceived = callback;
  }
}