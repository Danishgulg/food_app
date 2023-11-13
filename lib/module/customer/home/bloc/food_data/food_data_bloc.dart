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
    on<FetchFoodDataEvent>((event, emit) {
    emit(FoodDataLoadingState());

    try {
      _firebaseFoodHelper
          .getFoodData(foodName: event.foodType)
          .then((value) => emit(FoodDataLoadedState( value)));
    } on FirebaseException catch (e) {
      emit(FoodDataErrorState(
          errorMessage: e.message, stackTrace: e.stackTrace));
    }
  });
  }

  void _fetchData(event, emit) {
    emit(FoodDataLoadingState());

    try {
      _firebaseFoodHelper
          .getFoodData(foodName: event.foodType)
          .then((value) => emit(FoodDataLoadedState(value)));
    } on FirebaseException catch (e) {
      emit(FoodDataErrorState(
          errorMessage: e.message, stackTrace: e.stackTrace));
    }
  }
}
