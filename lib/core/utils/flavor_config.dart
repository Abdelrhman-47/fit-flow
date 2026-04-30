enum Flavor {
  dev,
  staging,
  prod,
}

class FlavorConfig {
  static late Flavor _flavor;
  static late FlavorValues _flavorValues;

  static Flavor get flavor => _flavor;
  static String get appName => _flavorValues.appName;
  static String get baseUrl => _flavorValues.baseUrl;
  static bool get isProduction => _flavor == Flavor.prod;
  static bool get isStaging => _flavor == Flavor.staging;
  static bool get isDevelopment => _flavor == Flavor.dev;

  static void setFlavor(Flavor flavor) {
    _flavor = flavor;
    switch (flavor) {
      case Flavor.dev:
        _flavorValues = FlavorValues(
          appName: 'FitFlow Dev',
          baseUrl: 'https://dev-api.example.com',
        );
        break;
      case Flavor.staging:
        _flavorValues = FlavorValues(
          appName: 'FitFlow Staging',
          baseUrl: 'https://staging-api.example.com',
        );
        break;
      case Flavor.prod:
        _flavorValues = FlavorValues(
          appName: 'FitFlow',
          baseUrl: 'https://api.example.com',
        );
        break;
    }
  }
}

class FlavorValues {
  final String appName;
  final String baseUrl;

  FlavorValues({
    required this.appName,
    required this.baseUrl,
  });
}
