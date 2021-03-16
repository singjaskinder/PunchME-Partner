class RequestM {
  int date;
  String id;
  String uid;
  String userName;
  String oid;
  String storeName;
  String sid;
  String serviceName;
  int doIt;
  int getIt;
  double price;
  bool punch;
  bool status;

  RequestM(
      {this.date,
      this.id,
      this.uid,
      this.userName,
      this.sid,
      this.storeName,
      this.oid,
      this.serviceName,
      this.doIt,
      this.getIt,
      this.price,
      this.punch,
      this.status});

  RequestM.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    id = json['id'];
    uid = json['uid'];
    userName = json['user_name'];
    sid = json['sid'];
    storeName = json['store_name'];
    oid = json['oid'];
    serviceName = json['service_name'];
    doIt = json['doIt'];
    getIt = json['getIt'];
    price = json['price'].toDouble();
    punch = json['punch'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['user_name'] = this.userName;
    data['sid'] = this.sid;
    data['store_name'] = this.storeName;
    data['oid'] = this.oid;
    data['service_name'] = this.serviceName;
    data['doIt'] = this.doIt;
    data['getIt'] = this.getIt;
    data['price'] = this.price;
    data['punch'] = this.punch;
    data['status'] = this.status;
    return data;
  }
}
