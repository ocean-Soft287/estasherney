import 'package:consult_me/feature/booking/data/datasources/booking_remote_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
BookingRemoteDataSource bookingRemoteDataSource;
  BookingCubit({required this.bookingRemoteDataSource}) : super(BookingInitial());

  Future<void> doSomething({required String date,required String doctorId}) async {
    emit(BookinGtBookingAvailableLoading());
    try {
      final result = await bookingRemoteDataSource.getBookings(doctorId: doctorId, date: date);
      result.fold(
        (failure) => emit(BookingFailure(failure)),
        (success) => emit(GtBookingAvailableSuccess(success)),
      );
    } catch (e) {
      emit(BookingFailure(e.toString()));
    }
  }


}
