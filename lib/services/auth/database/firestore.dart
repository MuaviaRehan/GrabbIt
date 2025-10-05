import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  Future<void> saveOrderToDatabase(String receipt) async {
    try {
      await orders.add({
        'Date': Timestamp.fromDate(DateTime.now()), // safe for web
        'Order': receipt,
      });
    } catch (e, st) {
      print("❌ Failed to save order: $e");
      print(st);
    }
  }
}
