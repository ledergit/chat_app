import 'package:chat_app/models/member.dart';

class Chat {
  final String chatId;
  final List<Member> participants;

  Chat({
    required this.chatId,
    required this.participants,
  });
}
