enum messageType { user, chatGpt }

class MessageModel {
  String message;
  messageType type;
  MessageModel({
    required this.message,
    required this.type,
  });
}
