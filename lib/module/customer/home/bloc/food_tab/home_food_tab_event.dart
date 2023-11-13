part of 'home_food_tab_bloc.dart';

@immutable
sealed class HomeFoodTabEvent {}

final class FoodSelectedEvent extends HomeFoodTabEvent{
}

final class OfferSelectedEvent extends HomeFoodTabEvent{
}