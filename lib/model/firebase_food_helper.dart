import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/data/constants/firebase_firestore_constants.dart';
import 'package:food_app/module/customer/home/model/food_data_model.dart';

class FirebaseFoodhelper {
  final FirebaseFirestore _dbInstance = FirebaseFirestore.instance;
  void storeFoodData(
      {required String foodName, required List<String> foodData}) async {
    _dbInstance
        .collection(FirebaseFirestoreConstants.foodCategory)
        .doc(foodName)
        .set({"data": foodData});
  }

  Future<List<FoodDataModel?>> getFoodData({required String foodName}) {
    List<FoodDataModel> foodList = [];

    try {
      _dbInstance
          .collection(FirebaseFirestoreConstants.foodCategory)
          .doc(foodName)
          .get()
          .then((value) {
            final collection = value.data()!['data'];
            for (var element  in collection) {
              foodList.add(FoodDataModel.fromMap(element));
            }
        return foodList;
      });
    } on FirebaseException catch (e) {
      // ignore: avoid_print
      print("Error: $e");
    }
    return Future.value(foodList);
  }

}
