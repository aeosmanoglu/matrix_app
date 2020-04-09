class JoinedRooms {
  List<String> joinedRooms;

  JoinedRooms({this.joinedRooms});

  JoinedRooms.fromJson(Map<String, dynamic> json) {
    joinedRooms = json['joined_rooms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['joined_rooms'] = this.joinedRooms;
    return data;
  }
}

class RoomName {
  String type;
  String roomId;
  String sender;
  Content content;
  String stateKey;
  int originServerTs;
  Unsigned unsigned;
  String eventId;
  String userId;
  int age;

  RoomName(
      {this.type,
        this.roomId,
        this.sender,
        this.content,
        this.stateKey,
        this.originServerTs,
        this.unsigned,
        this.eventId,
        this.userId,
        this.age});

  RoomName.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    roomId = json['room_id'];
    sender = json['sender'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    stateKey = json['state_key'];
    originServerTs = json['origin_server_ts'];
    unsigned = json['unsigned'] != null
        ? new Unsigned.fromJson(json['unsigned'])
        : null;
    eventId = json['event_id'];
    userId = json['user_id'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['room_id'] = this.roomId;
    data['sender'] = this.sender;
    if (this.content != null) {
      data['content'] = this.content.toJson();
    }
    data['state_key'] = this.stateKey;
    data['origin_server_ts'] = this.originServerTs;
    if (this.unsigned != null) {
      data['unsigned'] = this.unsigned.toJson();
    }
    data['event_id'] = this.eventId;
    data['user_id'] = this.userId;
    data['age'] = this.age;
    return data;
  }
}

class Content {
  String name;

  Content({this.name});

  Content.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}

class Unsigned {
  int age;

  Unsigned({this.age});

  Unsigned.fromJson(Map<String, dynamic> json) {
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    return data;
  }
}
