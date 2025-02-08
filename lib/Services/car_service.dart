import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/car.dart';

const String CAR_COLLECTION_REF = "cars";

class CarService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<Car> _carRef;

  CarService() {
    _carRef = _firestore.collection(CAR_COLLECTION_REF).withConverter<Car>(
      fromFirestore: (snapshot, _) => Car.fromJson(snapshot.data()!),
      toFirestore: (car, _) => car.toJson(),
    );
  }

  Stream<QuerySnapshot> getCars() {
    return _carRef.snapshots();
  }

  Future<void> addCar(Car car) async {
    await _carRef.add(car);
  }

  Future<void> updateCar(String carId, Car car) async {
    await _carRef.doc(carId).update(car.toJson());
  }

  Future<void> deleteCar(String carId) async {
    await _carRef.doc(carId).delete();
  }
}
