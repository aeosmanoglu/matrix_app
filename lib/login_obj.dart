class LoginObj {
  String userId;
  String accessToken;
  String homeServer;
  String deviceId;

  LoginObj({this.userId, this.accessToken, this.homeServer, this.deviceId});

  LoginObj.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    accessToken = json['access_token'];
    homeServer = json['home_server'];
    deviceId = json['device_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['access_token'] = this.accessToken;
    data['home_server'] = this.homeServer;
    data['device_id'] = this.deviceId;
    return data;
  }
}