import 'dart:io';

class HttpExceptionDelegate extends HttpException {
  HttpExceptionDelegate(super.message, {super.uri, this.statusCode});

  final int? statusCode;

  @override
  String toString() {
    final buffer = StringBuffer()
      ..write('HttpException: ')
      ..write(message);

    final uri = this.uri;
    if (uri != null) {
      buffer.write(', uri = $uri');
    }

    final statusCode = this.statusCode;
    if (statusCode != null) {
      buffer.write(', statusCode = $statusCode');
    }

    return buffer.toString();
  }
}