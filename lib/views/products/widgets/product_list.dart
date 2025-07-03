import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/product_model.dart';
import '../../../services/firestore_service.dart';
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
    final firestore = FirestoreService();
    return StreamBuilder<List<ProductModel>>(
      stream: firestore.streamProducts(categoryFile),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 196,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (snapshot.hasError) {
          return SizedBox(
            height: 196,
            child: Center(child: Text('Error: ${snapshot.error}')),
          );
        }
        final products = snapshot.data ?? [];
        if (products.isEmpty) {
          return SizedBox(
            height: 196,
            child: Center(child: Text('No items found in $categoryFile')),
          );
        }
        return SizedBox(
          height: 196.h,
          child: ListView.separated(
            scrollDirection: scrollDirection,
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: products.length,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final p = products[index];
              return ProductWidget(product: p);
            },
          ),
        );
      },
    );
  }
}
