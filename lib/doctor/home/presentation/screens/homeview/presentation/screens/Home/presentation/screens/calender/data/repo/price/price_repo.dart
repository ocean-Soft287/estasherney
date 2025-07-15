import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/models/price_model.dart';
import 'package:dartz/dartz.dart';

abstract class PriceRepo {
  Future<Either<Failure, PriceModel>> fetchPrice(double price);
}
