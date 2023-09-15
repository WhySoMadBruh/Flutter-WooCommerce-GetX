import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mbb/models/product_lists.dart';
import 'package:mbb/components/product_card.dart';
import 'package:mbb/controller/controllers.dart';

class ProductListView extends StatefulWidget {
  final List<ProductLists> products;
  final int? categoryID;
  final int? totalRecord;
  const ProductListView(
      {super.key, this.categoryID, this.totalRecord, required this.products});

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  int _page = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        searchController.changeStatus(RxBool(false));
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        searchController.changeStatus(RxBool(true));
      }
    });
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await searchController.getProductLists(
          pageNumber: ++_page,
          categoryId: widget.categoryID,
          totalRecord: widget.products.length,
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2),
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(10),
      itemCount: widget.products.length,
      itemBuilder: (context, index) =>
          ProductCard(product: widget.products[index]),
    );
  }
}
