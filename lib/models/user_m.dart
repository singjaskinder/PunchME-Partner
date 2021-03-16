class UserM {
  int date;
  String id;
  String token;
  String image;
  String name;
  String email;
  String phone;
  String banFor;

  UserM(
      {this.date,
      this.id,
      this.token,
      this.image,
      this.name,
      this.email,
      this.phone,
      this.banFor});

  UserM.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
    token = json['token'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    banFor = json['ban_for'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['id'] = this.id;
    data['token'] = this.token;
    data['image'] = this.image;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['ban_for'] = this.banFor;
    return data;
  }
}
