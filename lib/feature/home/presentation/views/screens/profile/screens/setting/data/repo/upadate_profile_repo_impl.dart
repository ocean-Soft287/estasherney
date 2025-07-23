
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/data/models/update_profile_model.dart';
import 'update_profile_repo.dart';

class UpdateProfileRepoImpl implements UpdateProfileRepo {
  final DioConsumer dioConsumer;

  UpdateProfileRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, UpdateProfileModel>> updateProfile({
    required String fullname,
    required String phonenumber,
    required String birthdate,
    required String imageUrl,
  }) async {
    try {
      if (imageUrl.isEmpty) {
        return Left(ServerFailure("Image URL cannot be empty"));
      }
      MultipartFile imageFile = await MultipartFile.fromFile(
        imageUrl,
        filename: imageUrl.split("/").last,
      );

      final formData = FormData.fromMap({
        "FullName": fullname,
        "PhoneNumber": phonenumber,
        "Birthday": birthdate,
        "Image": imageFile,
      });

      final response = await dioConsumer.put(
        EndPoint.updateProfile,
        data: formData,
        isFromData: true,
      );

      return Right(UpdateProfileModel(message: response.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
