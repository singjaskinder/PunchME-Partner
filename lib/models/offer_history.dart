class OfferHistory {
  int date;
  String image;
  String offerName;
  int doIt;
  String uid;
  String sid;
  String userName;
  List<int> lapse;
  int total;

  OfferHistory(
      {this.date,
      this.image,
      this.offerName,
      this.doIt,
      this.uid,
      this.sid,
      this.userName,
      this.lapse,
      this.total});

  OfferHistory.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    image = json['image'];
    offerName = json['offer_name'];
    doIt = json['do_it'];
    uid = json['uid'];
    sid = json['sid'];
    userName = json['user_name'];
    lapse = json['lapse'].cast<int>();
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['image'] = this.image;
    data['offer_name'] = this.offerName;
    data['do_it'] = this.doIt;
    data['uid'] = this.uid;
    data['sid'] = this.sid;
    data['user_name'] = this.userName;
    data['lapse'] = this.lapse;
    data['total'] = this.total;
    return data;
  }
}
