import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punchmepartner/common/buttons.dart';
import 'package:punchmepartner/common/image_picker.dart';
import 'package:punchmepartner/common/sizedbox.dart';
import 'package:punchmepartner/common/text.dart';
import 'package:punchmepartner/res/app_colors.dart';
import 'package:punchmepartner/res/app_styles.dart';
import 'package:punchmepartner/views/home/pages/services/services_ctrller.dart';

class CreateService extends StatelessWidget {
  const CreateService({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ServicesController controller = Get.find();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.yellow,
          title: JxText(
            'Add Service',
            color: AppColors.black,
          ),
          iconTheme: IconThemeData(color: AppColors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Obx(
                    () => JxImagePicker(
                      isEmpty: controller.imageEmpty.value,
                      imageData: controller.imageBase.value,
                      onSelected: () => controller.showPicker(context),
                      onRemoved: () => controller.removeImage(),
                    ),
                  ),
                  JxSizedBox(
                    height: 2,
                  ),
                  JxSizedBox(),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                              controller: controller.nameCtrl,
                              decoration: AppStyles.generalTxtField
                                  .copyWith(labelText: 'Service name'),
                              validator: (val) => val.isNotEmpty ? null : '')),
                      JxSizedBox(
                        width: 3,
                      ),
                      Expanded(
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.priceCtrl,
                              decoration: AppStyles.generalTxtField.copyWith(
                                  labelText: 'Price',
                                  contentPadding: EdgeInsets.all(15)),
                              validator: (val) => val.isNum ? null : ''))
                    ],
                  ),
                  JxSizedBox(
                    height: 2,
                  ),
                  TextFormField(
                      controller: controller.descriptionCtrl,
                      maxLines: 3,
                      decoration: AppStyles.generalTxtField.copyWith(
                          labelText: 'Description',
                          contentPadding: EdgeInsets.all(15)),
                      validator: (val) => val.isNotEmpty ? null : ''),
                  JxSizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: JxText(
                          'Service type:',
                          size: 5,
                          color: AppColors.yellow,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => RoundedRectBTN(
                              onTap: () => controller.setServiceType(true),
                              label: 'Punch',
                              toEnable: controller.isPunch.value,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Obx(
                            () => RoundedRectBTN(
                              onTap: () => controller.setServiceType(false),
                              label: 'Points',
                              toEnable: !controller.isPunch.value,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  JxSizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.doItCtrl,
                              decoration: AppStyles.generalTxtField.copyWith(
                                  labelText: 'Scan For',
                                  contentPadding: EdgeInsets.all(15)),
                              validator: (val) => val.isNum ? null : '')),
                      JxSizedBox(
                        width: 3,
                      ),
                      Expanded(
                          child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: controller.getItCtrl,
                              decoration: AppStyles.generalTxtField.copyWith(
                                  labelText: 'And get',
                                  contentPadding: EdgeInsets.all(15)),
                              validator: (val) => val.isNum ? null : '')),
                      JxSizedBox(
                        width: 3,
                      ),
                      Obx(
                        () => Visibility(
                          visible: !controller.isPunch.value,
                          child: Expanded(
                              child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: controller.scanLimitCtrl,
                                  decoration: AppStyles.generalTxtField
                                      .copyWith(
                                          labelText: 'Scan point limit',
                                          contentPadding: EdgeInsets.all(15)),
                                  validator: (val) => !controller.isPunch.value
                                      ? val.isNum
                                          ? null
                                          : ''
                                      : null)),
                        ),
                      )
                    ],
                  ),
                  JxSizedBox(),
                  Obx(
                    () => Visibility(
                      visible: !controller.isPunch.value,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: JxText(
                          'Minimum 100 points, 1 dollar equals 1000 points ',
                          size: 3,
                          color: AppColors.yellow,
                        ),
                      ),
                    ),
                  ),
                  JxSizedBox(
                    height: 3,
                  ),
                  TextIconBTN(
                    onPressed: () => controller.create(),
                    enabled: true,
                    label: 'Add Service',
                    icondata: Icons.add,
                  ),
                  JxSizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
