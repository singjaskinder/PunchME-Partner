class StoreM {
  String id;
  int date;
  String name;
  String description;
  String timings;
  int totalOffers;
  List<String> images;
  String mapLink;
  Object location;
  bool status;
  String banFor;
  String token;
  String email;
  String ownerName;
  String phone;

  StoreM(
      {this.id,
      this.date,
      this.name,
      this.description,
      this.timings,
      this.totalOffers,
      this.images,
      this.mapLink,
      this.location,
      this.status,
      this.banFor,
      this.token,
      this.email,
      this.ownerName,
      this.phone});

  StoreM.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    name = json['name'];
    description = json['description'];
    timings = json['timings'];
    totalOffers = json['total_offers'];
    images = json['images'].cast<String>();
    mapLink = json['mapLink'];
    location = json['location']['geopoint'];
    status = json['status'];
    banFor = json['ban_for'];
    token = json['token'];
    email = json['email'];
    ownerName = json['owner_name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['name'] = this.name;
    data['description'] = this.description;
    data['timings'] = this.timings;
    data['total_offers'] = this.totalOffers;
    data['images'] = this.images;
    data['mapLink'] = this.mapLink;
    data['location'] = this.location;
    data['status'] = this.status;
    data['ban_for'] = this.banFor;
    data['token'] = this.token;
    data['owner_name'] = this.ownerName;
    data['phone'] = this.phone;
    return data;
  }
}
