import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../theme/pellet.dart';
import '../views/filters_bottom_sheet.dart';

class CommonFeaturesSearchField extends StatelessWidget {
  const CommonFeaturesSearchField({
    super.key,
    this.showFilters = false,
    required TextEditingController searchController,
    this.borderColor = Colors.transparent,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final bool showFilters;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: _searchController,
          keyboardType: TextInputType.text,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            hintText: 'Search for anything',
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: borderColor,
                width: 2.0,
              ),
            ),
            prefixIcon: Icon(
              IconlyLight.search,
              color: Pellet.kDark,
            ),
            suffixIcon: showFilters
                ? IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const FiltersBottomSheet(),
                        isScrollControlled: true,
                        showDragHandle: true,
                        backgroundColor: Pellet.kWhite,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      IconlyLight.filter,
                      color: Pellet.kDark,
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
