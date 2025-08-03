import '../../../data/models/price_model.dart';

abstract class PriceState {}

class PriceInitial extends PriceState {}

class PriceLoading extends PriceState {}

class PriceSuccess extends PriceState {
  final PriceModel priceModel;

  PriceSuccess(this.priceModel);
}

class PriceFailure extends PriceState {
  final String message;

  PriceFailure(this.message);
}
