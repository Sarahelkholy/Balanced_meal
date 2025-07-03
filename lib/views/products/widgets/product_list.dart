import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../hooks/fetch_all_products.dart';
import '../../../models/product_model.dart';
import 'product_widget.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    this.scrollDirection = Axis.horizontal,
    required this.categoryFile,
  });

  final Axis scrollDirection;
  final String categoryFile;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: fetchProducts(categoryFile),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        final products = snapshot.data!;
        return SizedBox(
          height: 196.h,
          child: ListView.separated(
            scrollDirection: scrollDirection,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: products.length,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final p = products[index];
              return ProductWidget(
                product: p,
              );
            },
          ),
        );
      },
    );
  }
}
