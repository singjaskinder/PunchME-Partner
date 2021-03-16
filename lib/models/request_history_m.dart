class RequestHistoryM {
  int date;
  String oid;
  String storeName;
  String uid;
  String userName;
  String serviceName;
  String sid;
  bool status;

  RequestHistoryM(
      {this.date,
      this.oid,
      this.storeName,
      this.uid,
      this.userName,
      this.serviceName,
      this.sid,
      this.status});

  RequestHistoryM.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    oid = json['oid'];
    storeName = json['store_name'];
    uid = json['uid'];
    userName = json['user_name'];
    serviceName = json['service_name'];
    sid = json['sid'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['oid'] = this.oid;
    data['store_name'] = this.storeName;
    data['uid'] = this.uid;
    data['user_name'] = this.userName;
    data['service_name'] = this.serviceName;
    data['sid'] = this.sid;
    data['status'] = this.status;
    return data;
  }
}
