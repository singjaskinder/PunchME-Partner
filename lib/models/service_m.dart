class ServiceM {
  int date;
  String id;
  String sid;
  String name;
  String description;
  String timings;
  List<String> images;
  int doIt;
  int getIt;
  int limit;
  double price;
  bool punch;
  String endDate;
  Object location;
  bool status;
  bool isService;
  String banFor;
  String storeName;

  ServiceM(
      {this.date,
      this.id,
      this.sid,
      this.name,
      this.description,
      this.timings,
      this.images,
      this.doIt,
      this.getIt,
      this.limit,
      this.price,
      this.punch,
      this.endDate,
      this.location,
      this.isService,
      this.status,
      this.banFor,
      this.storeName});

  ServiceM.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
    sid = json['sid'];
    name = json['name'];
    description = json['description'];
    timings = json['timings'];
    images = json['images'].cast<String>();
    doIt = json['do_it'];
    getIt = json['get_it'];
    limit = json['limit'];
    price = json['price'].toDouble();
    punch = json['punch'];
    endDate = json['endDate'];
    location = json['location']['geopoint'];
    isService = json['is_service'];
    status = json['status'];
    banFor = json['ban_for'];
    storeName = json['owner_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['id'] = this.id;
    data['sid'] = this.sid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['timings'] = this.timings;
    data['images'] = this.images;
    data['do_it'] = this.doIt;
    data['get_it'] = this.getIt;
    data['limit'] = this.limit;
    data['price'] = this.price;
    data['punch'] = this.punch;
    data['endDate'] = this.endDate;
    data['location'] = this.location;
    data['is_service'] = this.isService;
    data['status'] = this.status;
    data['ban_for'] = this.banFor;
    data['owner_name'] = this.storeName;
    return data;
  }
}
