import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/data/models/update_profile_model.dart';
import 'package:dartz/dartz.dart';

abstract class UpdateProfileRepo {
  Future<Either<Failure, UpdateProfileModel>> updateProfile({
    required String fullname,
    
    required String phonenumber,
    required String birthdate,    
    required String imageUrl,
  }); }