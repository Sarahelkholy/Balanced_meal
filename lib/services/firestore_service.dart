import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<ProductModel>> streamProducts(String collectionName) {
    return _db.collection(collectionName).orderBy('food_name').snapshots().map(
        (snap) => snap.docs
            .map((doc) => ProductModel.fromMap(doc.data(), id: doc.id))
            .toList());
  }

  Future<List<ProductModel>> fetchProductsOnce(String collectionName) async {
    final snap = await _db.collection(collectionName).get();
    return snap.docs
        .map((doc) => ProductModel.fromMap(doc.data(), id: doc.id))
        .toList();
  }
}
