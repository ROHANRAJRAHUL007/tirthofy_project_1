part of 'food_home_page_bloc.dart';

@immutable
sealed class FoodHomePageEvent {}

final class FoodcategoryOptionEvent extends FoodHomePageEvent {}

final class FoodAddCartEvent extends FoodHomePageEvent {}

final class FoodContainerEvent extends FoodHomePageEvent {}

final class FavouriteFoodClickedEvent extends FoodHomePageEvent {}

final class FoodAddCartClickedEvent extends FoodHomePageEvent {}
