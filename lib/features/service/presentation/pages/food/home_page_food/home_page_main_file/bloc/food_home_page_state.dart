part of 'food_home_page_bloc.dart';

@immutable
sealed class FoodHomePageState {}

sealed class FoodHomePageActionState extends FoodHomePageState {}

final class FoodHomePageInitial extends FoodHomePageState {}

final class HomeloadingState extends FoodHomePageState {}

final class HomeloadedSuccessState extends FoodHomePageState {}

final class HomeErrorState extends FoodHomePageState {}

final class HomeNavigatorTofullPageFromFoodcontainer
    extends FoodHomePageActionState {}

final class NavigationToAddtoCartActionState extends FoodHomePageActionState {}

final class NavigationToAddtoFavouriteActionState
    extends FoodHomePageActionState {}
