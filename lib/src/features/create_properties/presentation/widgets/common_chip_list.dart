import 'package:chip_list/chip_list.dart';
import 'package:dream_home/src/theme/pellet.dart';
import 'package:flutter/material.dart';

class CommonChipList extends StatelessWidget {
  const CommonChipList({
    super.key,
    required this.list,
    required this.selectedListindex,
  });

  final List<String> list;
  final int selectedListindex;

  @override
  Widget build(BuildContext context) {
    return ChipList(
      listOfChipNames: list,
      listOfChipIndicesCurrentlySeclected: [selectedListindex],
      inactiveBgColorList: [Pellet.kSecondaryColor],
      activeBgColorList: [Pellet.kPrimaryColor],
      inactiveTextColorList: [Pellet.kDark],
    );
  }
}
