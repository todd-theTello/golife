/// Lifecycle of a BaseResponse:
/// Base Response entity
class BaseResponse<T> {
  /// Use static methods to initialize this class
  const BaseResponse({required this.status, this.data, this.message});

  /// set the base response status
  final bool status;

  /// Network response data from network request
  final T? data;

  /// Network response message
  final String? message;

  /// Return a base response with data on success and set response
  static BaseResponse<T> success<T>(T data) => BaseResponse(
        status: true,
        data: data,
      );

  /// set error when an error occurs
  static BaseResponse<T> error<T>({required String? message, T? data}) {
    return BaseResponse(
      status: false,
      data: data,
      message: message,
    );
  }
}
