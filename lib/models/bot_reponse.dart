

import '../core/safe_convert.dart';

class BotResponse {
  final bool ok;
  final List<ResultItem> result;

  BotResponse({
    this.ok = false,
    required this.result,
  });

  factory BotResponse.fromJson(Map<String, dynamic>? json) => BotResponse(
    ok: asBool(json, 'ok'),
    result: asList(json, 'result').map((e) => ResultItem.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'ok': ok,
    'result': result.map((e) => e.toJson()).toList(),
  };
}

class ResultItem {
  final int updateId;
  final Message message;

  ResultItem({
    this.updateId = 0,
    required this.message,
  });

  factory ResultItem.fromJson(Map<String, dynamic>? json) => ResultItem(
    updateId: asInt(json, 'update_id'),
    message: Message.fromJson(asMap(json, 'message')),
  );

  Map<String, dynamic> toJson() => {
    'update_id': updateId,
    'message': message.toJson(),
  };
}

class Message {
  final int messageId;
  final From from;
  final Chat chat;
  final int date;
  final String text;

  Message({
    this.messageId = 0,
    required this.from,
    required this.chat,
    this.date = 0,
    this.text = "",
  });

  factory Message.fromJson(Map<String, dynamic>? json) => Message(
    messageId: asInt(json, 'message_id'),
    from: From.fromJson(asMap(json, 'from')),
    chat: Chat.fromJson(asMap(json, 'chat')),
    date: asInt(json, 'date'),
    text: asString(json, 'text'),
  );

  Map<String, dynamic> toJson() => {
    'message_id': messageId,
    'from': from.toJson(),
    'chat': chat.toJson(),
    'date': date,
    'text': text,
  };
}

class From {
  final int id;
  final bool isBot;
  final String firstName;
  final String lastName;
  final String username;
  final String languageCode;

  From({
    this.id = 0,
    this.isBot = false,
    this.firstName = "",
    this.lastName = "",
    this.username = "",
    this.languageCode = "",
  });

  factory From.fromJson(Map<String, dynamic>? json) => From(
    id: asInt(json, 'id'),
    isBot: asBool(json, 'is_bot'),
    firstName: asString(json, 'first_name'),
    lastName: asString(json, 'last_name'),
    username: asString(json, 'username'),
    languageCode: asString(json, 'language_code'),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'is_bot': isBot,
    'first_name': firstName,
    'last_name': lastName,
    'username': username,
    'language_code': languageCode,
  };
}


class Chat {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String type;

  Chat({
    this.id = 0,
    this.firstName = "",
    this.lastName = "",
    this.username = "",
    this.type = "",
  });

  factory Chat.fromJson(Map<String, dynamic>? json) => Chat(
    id: asInt(json, 'id'),
    firstName: asString(json, 'first_name'),
    lastName: asString(json, 'last_name'),
    username: asString(json, 'username'),
    type: asString(json, 'type'),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'username': username,
    'type': type,
  };
}

