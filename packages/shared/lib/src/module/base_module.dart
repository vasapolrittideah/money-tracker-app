// Defines the base module structure for all modules.
abstract class BaseModule {
  // The name of the module.
  String get name;

  // Initializes the module like setting up dependencies, configurations, etc.
  void initialize();
}
