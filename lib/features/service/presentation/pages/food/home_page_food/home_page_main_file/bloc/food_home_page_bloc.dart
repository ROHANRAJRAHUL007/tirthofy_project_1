import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'food_home_page_event.dart';
part 'food_home_page_state.dart';

class FoodHomePageBloc extends Bloc<FoodHomePageEvent, FoodHomePageState> {
  FoodHomePageBloc() : super(FoodHomePageInitial()) {
    //   on<FoodHomePageEvent>((event, emit) {});
    on<FavouriteFoodClickedEvent>(favouriteFoodClickedEvent);
    on<FoodAddCartClickedEvent>(foodAddCartClickedEvent);
  }

  FutureOr<void> favouriteFoodClickedEvent(
    FavouriteFoodClickedEvent event,
    Emitter<FoodHomePageState> emit,
  ) {
    print("Favourite clicked");
    emit(NavigationToAddtoFavouriteActionState());
  }

  FutureOr<void> foodAddCartClickedEvent(
    FoodAddCartClickedEvent event,
    Emitter<FoodHomePageState> emit,
  ) {
    print("FoodCart clicked");
    emit(NavigationToAddtoCartActionState());
  }
}
