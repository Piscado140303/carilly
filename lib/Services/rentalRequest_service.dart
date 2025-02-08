import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/rentalRequest.dart';

const String RENTAL_REQUEST_COLLECTION_REF = "rental_requests";

class RentalRequestService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<RentalRequest> _rentalRequestRef;

  RentalRequestService() {
    _rentalRequestRef = _firestore.collection(RENTAL_REQUEST_COLLECTION_REF).withConverter<RentalRequest>(
      fromFirestore: (snapshot, _) => RentalRequest.fromJson(snapshot.data()!),
      toFirestore: (request, _) => request.toJson(),
    );
  }

  Stream<QuerySnapshot> getRentalRequests() {
    return _rentalRequestRef.snapshots();
  }

  Future<void> addRentalRequest(RentalRequest request) async {
    await _rentalRequestRef.add(request);
  }

  Future<void> updateRentalRequest(String requestId, RentalRequest request) async {
    await _rentalRequestRef.doc(requestId).update(request.toJson());
  }

  Future<void> deleteRentalRequest(String requestId) async {
    await _rentalRequestRef.doc(requestId).delete();
  }
}
