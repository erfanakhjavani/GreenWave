class ChoiceResponse {
  final int statusCode;
  final String message;
  final dynamic data;

  ChoiceResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory ChoiceResponse.fromJson(Map<String, dynamic> json) {
    return ChoiceResponse(
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'],
    );
  }


}