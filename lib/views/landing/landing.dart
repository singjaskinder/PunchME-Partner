import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:punchmepartner/res/app_colors.dart';
import 'package:punchmepartner/res/app_styles.dart';
import 'package:punchmepartner/routes/routes.dart';

import 'file:///C:/work/punchme/punchmepartner/lib/utils/size_config.dart';

class Landing extends StatefulWidget {
  static const id = 'landing';
  Landing({Key key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    User user = FirebaseAuth.instance.currentUser;
    // final saved = await SharedPreferences.getInstance();
    // saved.clear();
    // user = null;
    Future.delayed(Duration(seconds: 1), () async {
      if (user == null) {
        Get.offAndToNamed(Routes.login);
      } else {
        Get.offAndToNamed(Routes.pager);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Center(
      child: Text('Punch ME',
          style: AppStyles.idleTxt.copyWith(color: AppColors.yellow)),
    ));
  }
}
