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

class RoomState {
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

  RoomState({
    this.type,
    this.roomId,
    this.sender,
    this.content,
    this.stateKey,
    this.originServerTs,
    this.unsigned,
    this.eventId,
    this.userId,
    this.age,
  });

  RoomState.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    roomId = json['room_id'];
    sender = json['sender'];
    content = json['content'] != null ? new Content.fromJson(json['content']) : null;
    stateKey = json['state_key'];
    originServerTs = json['origin_server_ts'];
    unsigned = json['unsigned'] != null ? new Unsigned.fromJson(json['unsigned']) : null;
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
  List aliases;
  String alias;
  bool mFederate;
  String roomVersion;
  String creator;
  String historyVisibility;
  String joinRule;
  String membership;
  String displayname;
  String avatarUrl;
  String name;
  Map users;
  int usersDefault;
  Map events;
  int eventsDefault;
  int stateDefault;
  int ban;
  int kick;
  int redact;
  int invite;
  String topic;

  Content({
    this.aliases,
    this.alias,
    this.mFederate,
    this.roomVersion,
    this.creator,
    this.historyVisibility,
    this.joinRule,
    this.membership,
    this.displayname,
    this.avatarUrl,
    this.name,
    this.users,
    this.usersDefault,
    this.events,
    this.eventsDefault,
    this.stateDefault,
    this.ban,
    this.kick,
    this.redact,
    this.invite,
    this.topic,
  });

  Content.fromJson(Map<String, dynamic> json) {
    aliases = json['aliases'];
    alias = json['alias'];
    mFederate = json['mFederate'];
    roomVersion = json['roomVersion'];
    creator = json['creator'];
    historyVisibility = json['historyVisibility'];
    joinRule = json['joinRule'];
    membership = json['membership'];
    displayname = json['displayname'];
    avatarUrl = json['avatarUrl'];
    name = json['name'];
    users = json['users'];
    usersDefault = json['usersDefault'];
    events = json['events'];
    eventsDefault = json['eventsDefault'];
    stateDefault = json['stateDefault'];
    ban = json['ban'];
    kick = json['kick'];
    redact = json['redact'];
    invite = json['invite'];
    topic = json['topic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aliases'] = this.aliases;
    data['alias'] = this.alias;
    data['mFederate'] = this.mFederate;
    data['roomVersion'] = this.roomVersion;
    data['creator'] = this.creator;
    data['historyVisibility'] = this.historyVisibility;
    data['joinRule'] = this.joinRule;
    data['membership'] = this.membership;
    data['displayname'] = this.displayname;
    data['avatarUrl'] = this.avatarUrl;
    data['name'] = this.name;
    data['users'] = this.users;
    data['usersDefault'] = this.usersDefault;
    data['events'] = this.events;
    data['eventsDefault'] = this.eventsDefault;
    data['stateDefault'] = this.stateDefault;
    data['ban'] = this.ban;
    data['kick'] = this.kick;
    data['redact'] = this.redact;
    data['invite'] = this.invite;
    data['topic'] = this.topic;
    return data;
  }
}

class Unsigned {
  int age;

  Unsigned({
    this.age,
  });

  Unsigned.fromJson(Map<String, dynamic> json) {
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    return data;
  }
}
