abstract class ApiDelegateException implements Exception {
  ApiDelegateException(
    this.stackTrace,
  );

  final StackTrace? stackTrace;

  static const String apiPrefixError = 'api';
  static const String frontPrefixError = 'front';
  static const String sessionExpiredErrorMessage =
      '$apiPrefixError: sessão expirada';
  static const String clientErrorMessage =
      '$frontPrefixError: falha na conexão';

  @override
  String toString() {
    switch (runtimeType) {
      case const (ClientNetworkException):
        return clientErrorMessage;
      case const (SessionExpiredException):
        return sessionExpiredErrorMessage;
      case const (ApiNetworkException):
        return '$apiPrefixError: '
            '${(this as ApiNetworkException).stackTrace?.toString()}';
      default:
        return '$frontPrefixError: ${stackTrace.toString()}';
    }
  }
}

class ClientNetworkException implements ApiDelegateException {
  const ClientNetworkException(this.stackTrace);

  @override
  final StackTrace? stackTrace;

  @override
  String toString() =>
      'ClientNetworkException: Ocorreu um problema de rede no lado do cliente. '
      'Isso pode ser causado por uma perda de conexão com a internet, falha ao '
      'conectar ao servidor, tempo limite de conexão, conexão recusada pelo '
      'servidor, erro de DNS ou um problema com a configuração de rede do '
      'dispositivo.\n'
      'Rastreamento de pilha: $stackTrace';
}

class ApiNetworkException implements ApiDelegateException {
  const ApiNetworkException({
    this.stackTrace,
    this.statusCode,
    this.statusMessage,
    this.data,
    this.endpoint,
  });

  @override
  final StackTrace? stackTrace;
  final int? statusCode;
  final String? statusMessage;
  final dynamic data;
  final String? endpoint;

  @override
  String toString() =>
      'ApiNetworkException: Ocorreu um problema de rede ao fazer uma '
      'solicitação à API.\n'
      'Endpoint: $endpoint\n'
      'Código de status: $statusCode\n'
      'Mensagem de status: $statusMessage\n'
      'Dados: $data\n'
      'Rastreamento de pilha: $stackTrace\n';
}

class SessionExpiredException implements ApiDelegateException {
  const SessionExpiredException(this.stackTrace);

  @override
  final StackTrace? stackTrace;
}
