class Message {
  final String chatId;
  final String senderId;
  final String text;
  final DateTime createdAt;

  Message({
    required this.chatId,
    required this.senderId,
    required this.text,
    required this.createdAt,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      chatId: map['chatId'],
      senderId: map['senderId'],
      text: map['text'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'senderId': senderId,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
}
