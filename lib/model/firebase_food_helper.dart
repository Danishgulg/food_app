import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_app/data/constants/firebase_firestore_constants.dart';
import 'package:food_app/module/customer/home/model/food_data_model.dart';

class FirebaseFoodhelper {
  final FirebaseFirestore _dbInstance = FirebaseFirestore.instance;
  void storeFoodData(
      {required String foodName, required List<String> foodData}) async {
    await _dbInstance
        .collection(FirebaseFirestoreConstants.foodCategory)
        .doc(foodName)
        .set({"data": foodData});
  }

  Future<List<FoodDataModel>> getFoodData({required String foodName}) async {
    List<FoodDataModel> foodList = [];

    try {
      await _dbInstance
          .collection(FirebaseFirestoreConstants.foodCategory)
          .doc(foodName)
          .get()
          .then((value) {
        final collection = value.data()!['data'];
        for (var element in collection) {
          foodList.add(FoodDataModel.fromMap(element));
        }
        return foodList.reversed;
      });
    } on FirebaseException catch (e) {
      // ignore: avoid_print
      print("Error: $e");
    }
    return Future.value(foodList);
  }

  Future<bool> updateLikedFood(
      {required String foodName, required Map mapToUpdate}) async {

    final ref = _dbInstance
        .collection(FirebaseFirestoreConstants.foodCategory)
        .doc(foodName);

    try {
      await ref.update({
        "data": FieldValue.arrayRemove([mapToUpdate])
      });
      if(mapToUpdate['liked'] == false){
        mapToUpdate['liked'] = true;
      }else if(mapToUpdate['liked'] == true){
        mapToUpdate['liked'] = false;
      }
      ref.update(
        {
          "data": FieldValue.arrayUnion([mapToUpdate])
        }
      );
      return Future.value(true);
    } on FirebaseException catch (e) {
      // ignore: avoid_print
      return Future.value(false);
    }
  }
}
