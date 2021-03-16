import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:punchmepartner/apis/services.dart';
import 'package:punchmepartner/models/service_m.dart';
import 'package:punchmepartner/overlays/dialog.dart';
import 'package:punchmepartner/overlays/progress_dialog.dart';
import 'package:punchmepartner/overlays/snackbar.dart';
import 'package:punchmepartner/utils/converts.dart';
import 'package:punchmepartner/utils/date_time.dart';
import 'package:punchmepartner/utils/location.dart';
import 'package:punchmepartner/views/home/pager_ctrller.dart';

class ServicesController extends GetxController {
  ServicesRepo servicesRepo = ServicesApis();
  final PageCtrller pageCtrller = Get.find();
  final formKey = GlobalKey<FormState>();
  final nameCtrl = TextEditingController();
  final priceCtrl = TextEditingController();
  final descriptionCtrl = TextEditingController();
  final doItCtrl = TextEditingController();
  final getItCtrl = TextEditingController();
  final scanLimitCtrl = TextEditingController();
  bool isUpdate = false;
  ServiceM storeM;

  final imageBase = ''.obs;
  final imageFile = <dynamic>[].obs;
  final imageEmpty = false.obs;
  final errText = ''.obs;
  final isPunch = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Camera'),
                      onTap: () {
                        pickImage(0);
                        Get.back();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Gallery'),
                    onTap: () {
                      pickImage(1);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> pickImage(int type) async {
    ImageSource source;
    source = type == 0 ? ImageSource.camera : ImageSource.gallery;
    File image = await ImagePicker.pickImage(source: source, imageQuality: 40);
    imageFile.add(image);
    final bytes = await image.readAsBytes();
    imageBase.value = base64Encode(bytes);
    imageEmpty.value = false;
  }

  void removeImage() async {
    isLoading(true);
    if (imageBase.value.contains('http')) {
      try {
        // await storeRepo.removeImage(imageBase.value);
      } catch (e) {}
      isLoading(false);
    } else {
      imageBase.value = '';
      imageFile.clear();
      isLoading(false);
    }
  }

  void setServiceType(bool value) => isPunch.value = value;

  String getInfo() {
    if (isPunch.value) {
      return 'Customers will scan ${doItCtrl.text} times & will receive ${getItCtrl.text} ${nameCtrl.text} / s for free';
    } else {
      return 'For ${nameCtrl.text}, Customers will scan ${doItCtrl.text} times & will receive ${scanLimitCtrl.text} points per every scan, once they collected total point they\'ll receive ${getItCtrl.text} ${nameCtrl.text} / s for free';
    }
  }

  void clearFields() {
    nameCtrl.text = '';
    descriptionCtrl.text = '';
    doItCtrl.text = '';
    getItCtrl.text = '';
    priceCtrl.text = '';
    removeImage();
  }

  Future<void> create() async {
    // nameCtrl.text = 'coffww';
    // descriptionCtrl.text = 'de coffww';
    // doItCtrl.text = '5';
    // getItCtrl.text = '1';
    // priceCtrl.text = '20';
    if (formKey.currentState.validate()) {
      if (imageBase.value == '') {
        imageEmpty.value = true;
        return;
      }
      final onPos = () async {
        imageEmpty.value = false;
        try {
          final storeM = pageCtrller.storeM.value;
          final serviceM = ServiceM(
              date: setDate(),
              name: nameCtrl.text,
              description: descriptionCtrl.text,
              timings: storeM.timings,
              doIt: toInt(doItCtrl.text),
              getIt: toInt(getItCtrl.text),
              limit: isPunch.value ? 0 : toInt(scanLimitCtrl.text),
              price: toDouble(priceCtrl.text),
              punch: isPunch.value,
              location: setGeoPoint(storeM.location),
              status: storeM.status,
              storeName: storeM.ownerName);
          isLoading(true);
          await servicesRepo.create(serviceM, imageFile);
          isLoading(false);
          JxDialog.dimiss();
          JxSnackBarStatus('Confirmation', 'New Service added');
          clearFields();
        } catch (e) {
          print(e);
          isLoading(false);
          JxSnackBarStatus(null, null);
        }
      };
      JxDialog('Confirmation', getInfo(), 'OK', 'cancel', onPos, null);
    }
  }

  Future<void> updateService(ServiceM serviceM, List<File> images) async {
    try {
      isLoading(true);
      isLoading(false);
    } catch (e) {
      print(e);
      isLoading(false);
    }
  }

  Future<void> delete(ServiceM serviceM) async {
    try {
      isLoading(true);
      await servicesRepo.delete(serviceM);
      isLoading(false);
    } catch (e) {
      print(e);
      isLoading(false);
    }
  }

  Stream<QuerySnapshot> get() async* {
    yield* servicesRepo.get();
  }
}
