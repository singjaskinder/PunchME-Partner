import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class AccountCtrller extends GetxController {
  final List<Menu> menus = [
    Menu(name: 'My History', icon: Icons.history),
    Menu(name: 'My Redeemed', icon: Icons.ac_unit),
    Menu(name: 'Help & Support', icon: Icons.help_outline),
    Menu(name: 'About', icon: Icons.change_history),
    Menu(name: 'FAQ', icon: Icons.subject_outlined)
  ];
}

class Menu {
  Menu({this.name, this.icon});
  final String name;
  final IconData icon;
}
