abstract class UserCardsEvent {}

class FetchAllFoods extends UserCardsEvent {
  final String ingr;
  final String calories;
  FetchAllFoods(this.ingr, this.calories);
}