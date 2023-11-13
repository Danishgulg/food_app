part of 'food_data_bloc.dart';

class FetchFoodDataEvent {
  const FetchFoodDataEvent(this.foodType);
  final String foodType;
}
