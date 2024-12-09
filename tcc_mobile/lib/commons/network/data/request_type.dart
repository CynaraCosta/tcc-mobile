enum RequestType {
  get,
  post,
  put,
  delete,
  patch,
  download;

  factory RequestType.getByName(String? name) => RequestType.values.firstWhere(
        (e) => e.name == name,
        orElse: () => RequestType.get,
      );
}
