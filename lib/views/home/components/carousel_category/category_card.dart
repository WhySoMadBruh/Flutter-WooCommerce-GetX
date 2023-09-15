import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mbb/controller/controllers.dart';
import 'package:shimmer/shimmer.dart';

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int? id;
  const CategoryCard(
      {super.key, this.id, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      margin: const EdgeInsets.all(10),
      child: AspectRatio(
        aspectRatio: 4 / 4,
        child: InkWell(
          onTap: () {
            dashboardController.updateIndex(1);
            searchController.productList.clear();

            searchController.getProductLists(
              categoryId: id,
              totalRecord: searchController.productList.length,
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: AspectRatio(
                            aspectRatio: 4 / 4,
                            child: Container(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                name.replaceAll('&amp;', '&'),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
