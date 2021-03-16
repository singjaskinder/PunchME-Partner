import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:punchmepartner/apis/requests.dart';
import 'package:punchmepartner/models/request_history_m.dart';
import 'package:punchmepartner/models/requests_m.dart';
import 'package:punchmepartner/overlays/progress_dialog.dart';
import 'package:punchmepartner/overlays/snackbar.dart';
import 'package:punchmepartner/utils/date_time.dart';

class RequestsController extends GetxController {
  RequestsRepo requestsRepo = RequestsApis();

  Future<void> updateRequest(RequestM requestM, bool status) async {
    try {
      isLoading(true);
      requestM.status = status;
      final requestHistoryM = RequestHistoryM(
          date: setDate(),
          oid: requestM.oid,
          storeName: requestM.storeName,
          uid: requestM.uid,
          userName: requestM.userName,
          serviceName: requestM.serviceName,
          status: status,
          sid: requestM.sid);
      var serviceHistoryM;
      if (requestM.punch) {
        serviceHistoryM = {
          'uid': requestM.uid,
          'userName': requestM.userName,
          'times': 0,
          'lapse': FieldValue.arrayUnion([setDate()])
        };
      } else {
        serviceHistoryM = {
          'uid': requestM.uid,
          'userName': requestM.userName,
          'times': 0,
          'lapse': FieldValue.arrayUnion([setDate()]),
          'total': requestM.doIt
        };
      }

      await requestsRepo.update(requestM, requestHistoryM, serviceHistoryM);
      isLoading(false);
      JxSnackBarStatus(
          'Confirmation',
          (requestM.punch ? 'Punched to ' : 'Points collected by ') +
              requestM.userName);
      Future.delayed(Duration(seconds: 4), () async {
        await requestsRepo.delete(requestM);
      });
    } catch (e) {
      print(e);
      isLoading(false);
    }
  }

  Stream<QuerySnapshot> get() async* {
    yield* requestsRepo.get();
  }
}

void sample() {
  try {
    isLoading(true);
    isLoading(false);
  } catch (e) {
    print(e);
    isLoading(false);
  }
}
