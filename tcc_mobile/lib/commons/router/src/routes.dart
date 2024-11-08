enum Routes {
  home('/'),
  firstPage('/first'),
  exampleWidget('/example/example_widget');

  const Routes(this.path);

  final String path;

  @override
  String toString() => name;
}
