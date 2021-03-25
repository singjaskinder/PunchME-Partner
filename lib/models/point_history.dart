class PointHistory {
  int date;
  String uid;
  String oid;
  String storeName;
  String userName;
  int total;

  PointHistory(
      {this.date,
      this.uid,
      this.oid,
      this.storeName,
      this.userName,
      this.total});

  PointHistory.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    uid = json['uid'];
    oid = json['oid'];
    storeName = json['store_name'];
    userName = json['user_name'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['uid'] = this.uid;
    data['oid'] = this.oid;
    data['store_name'] = this.storeName;
    data['user_name'] = this.userName;
    data['total'] = this.total;
    return data;
  }
}
