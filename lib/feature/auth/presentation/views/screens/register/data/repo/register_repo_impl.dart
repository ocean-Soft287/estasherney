import 'dart:typed_data';
import 'package:consult_me/core/Api/dio_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/error/fauiluire.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/register/data/models/register_model.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/register/data/repo/register_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class RegisterRepoImpl implements RegisterRepo {
  final DioConsumer dioConsumer;

  RegisterRepoImpl({required this.dioConsumer});

  @override
  Future<Either<Failure, RegisterResponseModel>> registerPatient({
    required String fullName,
    required String email,
    required String password,
    required String phoneNumber,
    required String birthday,
    required Uint8List imageBytes,
  }) async {
    try {
      final MultipartFile imageMultipart = MultipartFile.fromBytes(
        imageBytes,
        filename: 'profile_image.jpg',
        contentType: MediaType('image', 'jpeg'),
      );

      final formData = FormData.fromMap({
        'FullName': fullName,
        'Email': email,
        'Password': password,
        'PhoneNumber': phoneNumber,
        'Birthday': birthday,
        'Image': imageMultipart,
      });

      final response = await dioConsumer.post(
        EndPoint.registerpation,
        data: formData,
        isFromData: true,
        withAuth: false, 
      );

      final model = RegisterResponseModel.fromJson(response);
      return Right(model);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
