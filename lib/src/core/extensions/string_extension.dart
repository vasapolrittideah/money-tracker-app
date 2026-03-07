extension StringX on String {
  String toCapitalized() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  String toTitleCase() {
    return split(' ').map((word) => word.toCapitalized()).join(' ');
  }

  String toSnakeCase() {
    return replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match.group(0)!.toLowerCase()}').replaceFirst('_', '');
  }

  String toKebabCase() {
    return replaceAllMapped(RegExp(r'[A-Z]'), (match) => '-${match.group(0)!.toLowerCase()}').replaceFirst('-', '');
  }

  String toPascalCase() {
    return split(' ').map((word) => word.toCapitalized()).join();
  }

  String toCamelCase() {
    final pascal = toPascalCase();
    if (pascal.isEmpty) return pascal;
    return pascal[0].toLowerCase() + pascal.substring(1);
  }
}
