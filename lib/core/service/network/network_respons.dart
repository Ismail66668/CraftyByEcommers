part of 'network_clint.dart';

class NetworkRespons {
  final int statusCode;

  final Map<String, dynamic>? responsData;
  final String? errorMassage;
  final bool isSuccess;

  NetworkRespons(
      {required this.statusCode,
      this.responsData,
      this.errorMassage,
      required this.isSuccess});
}
