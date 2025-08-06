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

    // Add Cache Interceptor
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

    // Add Custom Logging Interceptor with Enhanced Request Body Logging
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          print('=== REQUEST ===');
          print('Timestamp: ${DateTime.now()}');
          print('Method: ${options.method}');
          print('URL: ${options.uri}');
          print('Headers: ${options.headers}');
          print('Query Parameters: ${options.queryParameters}');
          print('Body: ${_formatRequestBody(options.data)}');
          print('==============');
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          print('=== RESPONSE ===');
          print('Timestamp: ${DateTime.now()}');
          print('Status Code: ${response.statusCode}');
          print('Status Message: ${response.statusMessage}');
          print('Headers: ${response.headers}');
          print('Data: ${response.data}');
          print('==============');
          return handler.next(response);
        },
        onError: (DioException e, ErrorInterceptorHandler handler) {
          print('=== ERROR ===');
          print('Timestamp: ${DateTime.now()}');
          print('Error Type: ${e.type}');
          print('Message: ${e.message}');
          if (e.response != null) {
            print('Status Code: ${e.response!.statusCode}');
            print('Response Data: ${e.response!.data}');
          }
          print('==============');
          return handler.next(e);
        },
      ),
    );
  }

  // Helper method to format request body for logging
  String _formatRequestBody(dynamic data) {
    if (data == null) {
      return 'No body';
    } else if (data is FormData) {
      // Handle FormData (multipart/form-data)
      final fields = data.fields.map((field) => '${field.key}: ${field.value}').join(', ');
      final files = data.files
          .map((file) => '${file.key}: ${file.value.filename} (Content-Type: ${file.value.contentType})')
          .join(', ');
      return 'FormData { Fields: {$fields}, Files: {$files} }';
    } else if (data is Map || data is List) {
      // Handle JSON (Map or List)
      return data.toString();
    } else {
      // Handle other types (e.g., String, int)
      return data.toString();
    }
  }

  Future<Map<String, String>> _buildHeaders({bool withAuth = true, bool isFromData = false,String? outerToken}) async {

    String? token = await SharedPreferencesService.read(SharedPreferencesService.token);
      token ??= await     SharedPreferencesService.read(SharedPreferencesService.tokenpationt);
    token ??= outerToken;
    return {
      'Accept-Language': 'ar',
      if (!isFromData) 'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
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
    dynamic data,
    String? outerToken,
    bool isFromData = false,
    Map<String, dynamic>? queryParameters,
    bool withAuth = true,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFromData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
        options: Options(
          
          headers: await _buildHeaders(withAuth: withAuth, isFromData: isFromData,outerToken: outerToken),
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
          headers: await _buildHeaders(withAuth: withAuth, isFromData: isFromData),
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
          headers: await _buildHeaders(withAuth: withAuth, isFromData: isFromData),
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
          headers: await _buildHeaders(withAuth: withAuth, isFromData: isFromData),
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
      if (response.data is String) {
        return '${response.data ?? 'حدث خطا غير معروف'}';
      } else if (response.data is Map<String, dynamic>) {
        return 'تحقق من البيانات';
      }

      switch (response.statusCode) {
        case 400:
          return 'خطأ ${response.statusCode}: ${response.statusMessage ?? 'غير معروف'}';
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
          return 'طلب غير صحيح';
      }
    }

    return 'استجابة غير صحيحة من الخادم';
  }

  static List<String> extractErrorMessages(dynamic errorData) {
    final List<String> messages = [];

    if (errorData is Map<String, dynamic>) {
      final errors = errorData['errors'];

      if (errors is Map<String, dynamic>) {
        for (final field in errors.entries) {
          final errorList = field.value;
          if (errorList is List) {
            for (final msg in errorList) {
              messages.add(msg.toString());
            }
          }
        }
      }
    }

    return messages;
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