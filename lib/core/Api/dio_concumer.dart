import 'package:consult_me/core/Api/api_concumer.dart';
import 'package:consult_me/core/Api/end_point.dart';
import 'package:consult_me/core/Network/local/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.options.headers = {
      'Accept-Language': 'ar',
    };

    dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          policy: CachePolicy.request,
          maxStale: const Duration(minutes: 30),
          priority: CachePriority.high,
          keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        ),
      ),
    );

    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  Future<Map<String, String>> _buildHeaders({bool withAuth = true}) async {
    final token = await SharedPreferencesService.read(SharedPreferencesService.token);
    return {
      'Accept-Language': 'ar',
      if (token != null)
        'Authorization': 'Bearer $token',
    };
  }

  @override
  Future get(
    String path, {
    Duration? cacheDuration,
    Map<String, dynamic>? queryParameters,
    bool useCache = true,
    bool withAuth = true,
  }) async {
    try {
      final response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: await _buildHeaders(withAuth: withAuth),
          extra: {
            'cache': useCache,
            if (useCache && cacheDuration != null) 'maxStale': cacheDuration,
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioErrorHandler.getErrorMessage(e);
      throw errorMessage;
    }
  }

  @override
  Future post(
    String path, {
    Object? data,
    bool isFromData = false,
    Map<String, dynamic>? queryParameters,
    bool withAuth = true,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: await _buildHeaders(withAuth: withAuth),
          contentType: isFromData ? 'multipart/form-data' : 'application/json',
        ),
      );
      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioErrorHandler.getErrorMessage(e);
      throw errorMessage;
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    bool isFromData = false,
    Map<String, dynamic>? queryParameters,
    bool withAuth = true,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: await _buildHeaders(withAuth: withAuth),
          contentType: isFromData ? 'multipart/form-data' : 'application/json',
        ),
      );
      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioErrorHandler.getErrorMessage(e);
      throw errorMessage;
    }
  }

  @override
  Future delete(
    String path, {
    Object? data,
    bool isFromData = false,
    Map<String, dynamic>? queryParameters,
    bool withAuth = true,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: await _buildHeaders(withAuth: withAuth),
          contentType: 'application/json',
        ),
      );
      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioErrorHandler.getErrorMessage(e);
      throw errorMessage;
    }
  }

  @override
  Future put(
    String path, {
    Object? data,
    bool isFromData = false,
    Map<String, dynamic>? queryParameters,
    bool withAuth = true,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: await _buildHeaders(withAuth: withAuth),
          contentType: isFromData ? 'multipart/form-data' : 'application/json',
        ),
      );
      return response.data;
    } on DioException catch (e) {
      final errorMessage = DioErrorHandler.getErrorMessage(e);
      throw errorMessage;
    }
  }

  void handleDioExceptions(DioException e) {
    if (e.response != null) {
      print('Dio error: ${e.response!.statusCode} - ${e.response!.data}');
    } else {
      print('Dio error: ${e.message}');
    }
  }
}

class DioErrorHandler {
  static String getErrorMessage(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return 'تم إلغاء الطلب';
      
      case DioExceptionType.connectionTimeout:
        return 'انتهت مهلة الاتصال';
      
      case DioExceptionType.receiveTimeout:
        return 'انتهت مهلة استلام البيانات';
      
      case DioExceptionType.sendTimeout:
        return 'انتهت مهلة إرسال البيانات';
      
      case DioExceptionType.badResponse:
        return _handleBadResponse(dioError);
      
      case DioExceptionType.badCertificate:
        return 'شهادة الأمان غير صحيحة';
      
      case DioExceptionType.connectionError:
        return 'فشل الاتصال بالإنترنت';
      
      default:
        return 'حدث خطأ غير معروف';
    }
  }

  static String _handleBadResponse(DioException dioError) {
    final response = dioError.response;
    
    if (response != null) {
      switch (response.statusCode) {
        case 400:
          return 'طلب غير صحيح';
        case 401:
          return 'غير مصرح بالدخول';
        case 403:
          return 'ممنوع الوصول';
        case 404:
          return 'البيانات غير موجودة';
        case 409:
          return 'حدث تعارض';
        case 422:
          return 'خطأ في التحقق من البيانات';
        case 500:
          return 'خطأ في الخادم';
        case 502:
          return 'بوابة غير صحيحة';
        case 503:
          return 'الخدمة غير متوفرة';
        default:
          return 'خطأ ${response.statusCode}: ${response.statusMessage ?? 'غير معروف'}';
      }
    }
    
    return 'استجابة غير صحيحة من الخادم';
  }

  static String extractServerMessage(dynamic data) {
    try {
      if (data is Map<String, dynamic>) {
        if (data.containsKey('message')) {
          return data['message'].toString();
        }
        if (data.containsKey('error')) {
          return data['error'].toString();
        }
        if (data.containsKey('errors')) {
          final errors = data['errors'];
          if (errors is List && errors.isNotEmpty) {
            return errors.first.toString();
          }
        }
      }
      if (data is String) {
        return data;
      }
    } catch (e) {
      return '';
    }
    return '';
  }
}