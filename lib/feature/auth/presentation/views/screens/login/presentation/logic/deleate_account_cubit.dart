import 'package:consult_me/feature/auth/presentation/views/screens/login/data/repo/deleate_acount_repo.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/logic/delaete_account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountRepo deleteAccountRepo;

  DeleteAccountCubit(this.deleteAccountRepo) : super(DeleteAccountInitial());

  Future<void> deleteAccount() async {
    emit(DeleteAccountLoading());

    final result = await deleteAccountRepo.deleteAccount();

    result.fold(
      (failure) => emit(DeleteAccountFailure(failure.message)),
      (model) => emit(DeleteAccountSuccess(model.message)),
    );
  }
}
