import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punchmepartner/common/text.dart';
import 'package:punchmepartner/res/app_colors.dart';
import 'package:punchmepartner/res/app_styles.dart';

import 'file:///C:/work/punchme/punchmepartner/lib/utils/size_config.dart';

import 'account_ctrller.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ctrller = Get.put(AccountCtrller());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              CircleAvatar(
                radius: SizeConfig.width * 12,
                backgroundColor: AppColors.black.withOpacity(0.5),
                child: Icon(Icons.person,
                    color: AppColors.yellow.withOpacity(0.8)),
              ),
              SizedBox(
                width: SizeConfig.width * 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Harsh Makwana',
                    style: AppStyles.idleTxt.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.width * 5,
                        letterSpacing: 2),
                  ),
                  SizedBox(
                    width: SizeConfig.width,
                  ),
                  Text(
                    '+9819100770',
                    style: AppStyles.idleTxt.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: SizeConfig.width * 3.5,
                        letterSpacing: 2),
                  )
                ],
              ),
              Spacer(),
              Visibility(
                visible: false,
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.edit,
                    size: SizeConfig.width * 8,
                    color: AppColors.yellow,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.height * 1,
        ),
        Container(
          height: SizeConfig.height * 90,
          decoration: BoxDecoration(
              color: AppColors.black.withOpacity(0.3),
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                for (int i = 0; i < ctrller.menus.length; i++)
                  ListTile(
                    onTap: () {},
                    leading: Icon(ctrller.menus[i].icon),
                    title: JxText(ctrller.menus[i].name, size: 4, isBold: true),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: AppColors.yellow,
                    ),
                  ),
                ListTile(
                    onTap: () {},
                    leading: Icon(Icons.exit_to_app_outlined),
                    title: JxText('Sign out', size: 4, isBold: true)),
                Divider(
                    thickness: 5,
                    height: 10,
                    color: AppColors.darkGrey.withOpacity(0.5)),
                ListTile(
                    onTap: null,
                    title: JxText('App Version', size: 4),
                    trailing: JxText('v0.0.1', size: 3)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
