enum Routes {
  home('/'),
  xdebuggingPage('/xdebugging/menu_page'),
  exampleWidget('/example/example_widget');

  const Routes(this.path);

  final String path;

  @override
  String toString() => name;
}
