class UserSearchObj {
  bool limited;
  List<Results> results;

  UserSearchObj({this.limited, this.results});

  UserSearchObj.fromJson(Map<String, dynamic> json) {
    limited = json['limited'];
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limited'] = this.limited;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String userId;
  String displayName;
  Null avatarUrl;

  Results({this.userId, this.displayName, this.avatarUrl});

  Results.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    displayName = json['display_name'];
    avatarUrl = json['avatar_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['display_name'] = this.displayName;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}