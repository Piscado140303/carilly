import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/agency.dart';

const String AGENCY_COLLECTION_REF = "agencies";

class AgencyService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<Agency> _agencyRef;

  AgencyService() {
    _agencyRef = _firestore.collection(AGENCY_COLLECTION_REF).withConverter<Agency>(
      fromFirestore: (snapshot, _) => Agency.fromJson(snapshot.data()!),
      toFirestore: (agency, _) => agency.toJson(),
    );
  }

  Stream<QuerySnapshot> getAgencies() {
    return _agencyRef.snapshots();
  }

  Future<void> addAgency(Agency agency) async {
    await _agencyRef.add(agency);
  }

  Future<void> updateAgency(String agencyId, Agency agency) async {
    await _agencyRef.doc(agencyId).update(agency.toJson());
  }

  Future<void> deleteAgency(String agencyId) async {
    await _agencyRef.doc(agencyId).delete();
  }
}
