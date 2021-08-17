class UsersModel {
  String? uid;
  String? name;
  String? email;
  String? status;
  String? photoUrl;
  String? creationTime;
  String? lastSignInTime;
  String? updateTime;

  UsersModel(
      {this.uid,
      this.name,
      this.email,
      this.status,
      this.photoUrl,
      this.creationTime,
      this.lastSignInTime,
      this.updateTime});

  UsersModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    photoUrl = json['photoUrl'];
    creationTime = json['creationTime'];
    lastSignInTime = json['lastSignInTime'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['status'] = status;
    data['photoUrl'] = photoUrl;
    data['creationTime'] = creationTime;
    data['lastSignInTime'] = lastSignInTime;
    data['updateTime'] = updateTime;
    return data;
  }
}
