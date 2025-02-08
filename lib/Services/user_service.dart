import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';

const String USER_COLLECTION_REF = "users";

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<User> _userRef;

  UserService() {
    _userRef = _firestore.collection("users").withConverter<User>(
      fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
      toFirestore: (user, _) => user.toJson(),
    );
  }

  Stream<QuerySnapshot> getUsers() {
    return _userRef.snapshots();
  }

 Future<void> addUser(User user) async {
  try {
    print("🔄 Attempting to add user: ${user.toJson()}"); // Debugging print
    await _userRef.add(user);
    print("✅ User added successfully!");
  } catch (e) {
    print("❌ Error adding user: $e");
  }
}

  Future<void> updateUser(String userId, User user) async {
    await _userRef.doc(userId).update(user.toJson());
  }

  Future<void> deleteUser(String userId) async {
    await _userRef.doc(userId).delete();
  }
}
