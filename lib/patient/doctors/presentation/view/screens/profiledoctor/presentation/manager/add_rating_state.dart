abstract class AddRatingState {}

class AddRatingInitial extends AddRatingState {}

class AddRatingLoading extends AddRatingState {}

class AddRatingSuccess extends AddRatingState {
  final String message;

  AddRatingSuccess(this.message);
}

class AddRatingFailure extends AddRatingState {
  final String error;

  AddRatingFailure(this.error);
}
