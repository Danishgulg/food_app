import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/model/firebase_food_helper.dart';
import 'package:food_app/module/customer/home/model/food_data_model.dart';
import 'package:meta/meta.dart';

part 'food_data_event.dart';
part 'food_data_state.dart';

class FoodDataBloc extends Bloc<FetchFoodDataEvent, FoodDataState> {
  final _firebaseFoodHelper = FirebaseFoodhelper();

  FoodDataBloc() : super(FoodDataInitial()) {
    on<FetchFoodDataAddEvent>(_fetchData);
    on<LikedFoodDataAddEvent>((event, emit) async {
      
      if(event.isLiked){
       event.likedFood["liked"] = true;
      }else if(event.isLiked == false){
       event.likedFood["liked"] = false;
      }
    
    await _firebaseFoodHelper.updateLikedFood(
        foodName: event.foodType, mapToUpdate: event.likedFood);
    try {
      final data =
          await _firebaseFoodHelper.getFoodData(foodName: event.foodType);

      emit(FoodDataLoadedState(data));
    } on FirebaseException catch (e) {
      emit(FoodDataErrorState(
          errorMessage: e.message, stackTrace: e.stackTrace));
    }
  });
  }

  //fetch event of the data
  void _fetchData(event, emit) async {
    emit(FoodDataLoadingState());

    try {
      final data =
          await _firebaseFoodHelper.getFoodData(foodName: event.foodType);

      emit(FoodDataLoadedState(data));
    } on FirebaseException catch (e) {
      emit(FoodDataErrorState(
          errorMessage: e.message, stackTrace: e.stackTrace));
    }
  }

  // liked event of the data
  void _likedData(event, emit) async {
    final data =
    await _firebaseFoodHelper.updateLikedFood(
        foodName: event.foodType, mapToUpdate: event.likedFood);
    try {
      final data =
          await _firebaseFoodHelper.getFoodData(foodName: event.foodType);

      emit(FoodDataLoadedState(data));
    } on FirebaseException catch (e) {
      emit(FoodDataErrorState(
          errorMessage: e.message, stackTrace: e.stackTrace));
    }
  }
}
