import 'dart:async';
// import 'package:chat_app/models/message.dart';

void main() {
  // Stream<int> stream =
  /*
  slowCounter(5).listen((list) {
    print(list);
  });
*/

  /*
  slowCounter(5)
      .map((list) {
        return list.map((e) => e * 10).toList();
      })
      .listen((newList) {
        print(newList);
      });
*/
  /*  
  Stream<int> s1 = slowCounter(10);
  Stream<int> s2 = s1.map((e) => e * 10);

  s2.listen((value) {
    print('s2 value: $value');
  });
  */

  streamMessageMaps(5)
      .map((list) {
        return list.map((e) => Message.fromMap(e)).toList();
      })
      .listen((messageList) {
        for (int i = 0; i < messageList.length; i++) {
          print(
            'text: ${messageList[i].text} sent at time ${messageList[i].timestamp}',
          );
        }
        print('set finished printing\n\n');
      });
}

Stream<List<int>> slowCounter(int max) async* {
  print('start streaming');
  List<int> numbers = [];
  for (int i = 0; i < max; i++) {
    numbers.add(i);
    await Future.delayed(Duration(seconds: 1));
    yield List.from(numbers);
  }
}

Stream<List<Map<String, dynamic>>> streamMessageMaps(int max) async* {
  List<Map<String, dynamic>> maps = [];
  for (int i = 1; i <= max; i++) {
    maps.add({'text': 'message$i', 'timestamp': 't$i'});
    await Future.delayed(Duration(seconds: 1));
    yield List.from(maps);
  }
}

class Message {
  String text;
  String timestamp;

  Message({
    required this.text,
    required this.timestamp,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      text: map['text'],
      timestamp: map['timestamp'],
    );
  }
}
