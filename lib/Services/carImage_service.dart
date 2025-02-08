import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/carImage.dart';

const String CAR_IMAGE_COLLECTION_REF = "car_images";

class CarImageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<CarImage> _carImageRef;

  CarImageService() {
    _carImageRef = _firestore.collection(CAR_IMAGE_COLLECTION_REF).withConverter<CarImage>(
      fromFirestore: (snapshot, _) => CarImage.fromJson(snapshot.data()!),
      toFirestore: (image, _) => image.toJson(),
    );
  }

  Stream<QuerySnapshot> getCarImages() {
    return _carImageRef.snapshots();
  }

  Future<void> addCarImage(CarImage image) async {
    await _carImageRef.add(image);
  }

  Future<void> deleteCarImage(String imageId) async {
    await _carImageRef.doc(imageId).delete();
  }
}
