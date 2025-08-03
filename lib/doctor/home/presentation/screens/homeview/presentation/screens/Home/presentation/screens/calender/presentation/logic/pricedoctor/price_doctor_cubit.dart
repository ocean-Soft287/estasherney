import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/repo/price/price_repo.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/logic/pricedoctor/price_doctor_state.dart';

class PriceCubit extends Cubit<PriceState> {
  final PriceRepo priceRepo;

  PriceCubit(this.priceRepo) : super(PriceInitial());

  Future<void> fetchDoctorPrice(double price) async {
    emit(PriceLoading());

    final result = await priceRepo.fetchPrice(price);

    result.fold(
      (failure) => emit(PriceFailure(failure.message)),
      (priceModel) => emit(PriceSuccess(priceModel)),
    );
  }
}
