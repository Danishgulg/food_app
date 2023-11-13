import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_food_tab_event.dart';
part 'home_food_tab_state.dart';

class HomeFoodTabBloc extends Bloc<HomeFoodTabEvent, HomeFoodTabDataState> {
  HomeFoodTabBloc() : super(const HomeFoodTabDataState(true)) {
    on<FoodSelectedEvent>((event, emit) {
      emit(const HomeFoodTabDataState(true));
    });

    on<OfferSelectedEvent>((event, emit) {
      emit(const HomeFoodTabDataState(false));
    });
  }
}
