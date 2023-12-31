class Bond {
  String? createdAt;
  String? name;
  String? avatar;
  double? apy;
  String? id;

  Bond({this.createdAt, this.name, this.avatar, this.apy, this.id});

  Bond.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    apy = json['apy'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['avatar'] = avatar;
    data['apy'] = apy;
    data['id'] = id;
    return data;
  }
}
