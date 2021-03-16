class ServiceHistoryM {
  String uid;
  String userName;
  int times;
  List<int> lapse;

  ServiceHistoryM({this.uid, this.userName, this.times, this.lapse});

  ServiceHistoryM.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    userName = json['user_name'];
    times = json['times'];
    lapse = json['lapse'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['user_name'] = this.userName;
    data['times'] = this.times;
    data['lapse'] = this.lapse;
    return data;
  }
}
