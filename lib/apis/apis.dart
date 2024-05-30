import 'package:cloud_firestore/cloud_firestore.dart';

class Apis {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchPendingDoctors() {
    return firestore
        .collection('doctors')
        .where('isUpdated', isEqualTo: true)
        .where('isReviewed', isEqualTo: false)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchDeclinedDoctors() {
    return firestore
        .collection('doctors')
        .where('isUpdated', isEqualTo: true)
        .where('isReviewed', isEqualTo: true)
        .where('isApproved', isEqualTo: false)
        .snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchApprovedDoctors() {
    return firestore
        .collection('doctors')
        .where('isUpdated', isEqualTo: true)
        .where('isReviewed', isEqualTo: true)
        .where('isApproved', isEqualTo: true)
        .snapshots();
  }

  static Future<void> updateStatus(bool isApproved, String id) async {
    await firestore
        .collection('doctors')
        .doc(id)
        .update({"isReviewed": true, 'isApproved': isApproved});
  }
}
