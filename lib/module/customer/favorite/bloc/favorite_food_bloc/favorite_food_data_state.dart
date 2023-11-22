part of 'food_data_bloc.dart';

@immutable
sealed class FoodDataState {
   FoodDataState();
}

final class FoodDataInitial extends FoodDataState {
}

final class FoodDataLoadingState extends FoodDataState{
}

final class FoodDataLoadedState extends FoodDataState{
   FoodDataLoadedState(this.foodList);
  final List<FoodDataModel> foodList;
  
}


final class FoodDataErrorState extends FoodDataState{
   FoodDataErrorState({this.errorMessage, this.stackTrace});
  final String? errorMessage;
  final StackTrace? stackTrace;
}