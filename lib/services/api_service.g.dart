// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiService implements ApiService {
  _ApiService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://restcountries.com/v3.1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Country>> getEuropeanCountries() async {
    try {
      final queryParameters = <String, dynamic>{};
      final headers = <String, dynamic>{};
      final data = <String, dynamic>{};

      final result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<Country>>(
          Options(method: 'GET', headers: headers)
              .compose(
                _dio.options,
                '/region/europe?fields=name,capital,flags,region,languages,population',
                queryParameters: queryParameters,
                data: data,
              )
              .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl),
        ),
      );

      var value = result.data!
          .map((dynamic i) => Country.fromJson(i as Map<String, dynamic>))
          .toList();
      return value;
    } on DioException catch (e) {
      // Handle Dio errors, such as network issues or HTTP errors
      print("Dio error: ${e.response?.statusCode} - ${e.message}");
      // Rethrow the error or return an empty list
      rethrow; 
    } catch (e) {
      // Handle any other types of errors
      print("General error: $e");
      rethrow;
    }
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
