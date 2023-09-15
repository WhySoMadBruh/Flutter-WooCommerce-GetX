import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbb/controller/controllers.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 5,
          )
        ],
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: Obx(() => TextField(
                  autofocus: false,
                  controller: searchController.searchTextControoller,
                  onSubmitted: (val) {
                    searchController.productList.clear();
                    searchController.getProductLists(strSearch: val);
                  },
                  onChanged: (val) {
                    searchController.searchVal.value = val;
                  },
                  decoration: InputDecoration(
                      suffixIcon: searchController.searchVal.value.isNotEmpty
                          ? IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                searchController.searchTextControoller.clear();
                                searchController.searchVal.value = '';
                                searchController.getProductLists();
                              },
                            )
                          : null,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 16),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none),
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search)),
                )),
          ),
        ],
      ),
    );
  }
}
