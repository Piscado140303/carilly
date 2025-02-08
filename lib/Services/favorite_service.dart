import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/favorite.dart';

const String FAVORITE_COLLECTION_REF = "favorites";

class FavoriteService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<Favorite> _favoriteRef;

  FavoriteService() {
    _favoriteRef = _firestore.collection(FAVORITE_COLLECTION_REF).withConverter<Favorite>(
      fromFirestore: (snapshot, _) => Favorite.fromJson(snapshot.data()!),
      toFirestore: (favorite, _) => favorite.toJson(),
    );
  }

  Stream<QuerySnapshot> getFavorites() {
    return _favoriteRef.snapshots();
  }

  Future<void> addFavorite(Favorite favorite) async {
    await _favoriteRef.add(favorite);
  }

  Future<void> deleteFavorite(String favoriteId) async {
    await _favoriteRef.doc(favoriteId).delete();
  }
}
