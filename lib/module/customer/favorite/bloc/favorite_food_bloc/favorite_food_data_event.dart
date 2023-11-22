part of 'food_data_bloc.dart';

sealed class FetchFoodDataEvent {
  const FetchFoodDataEvent();
}

class FetchFoodDataAddEvent extends FetchFoodDataEvent {
  final String foodType;
  
  const FetchFoodDataAddEvent(this.foodType);
}

class LikedFoodDataAddEvent extends FetchFoodDataEvent {
  final Map likedFood;
  final String foodType;
  final bool isLiked;
  const LikedFoodDataAddEvent(this.likedFood, this.foodType, this.isLiked);
}
