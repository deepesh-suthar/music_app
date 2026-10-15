abstract final class APIConstants {
  static const String baseUrl = 'https://api.jamendo.com/v3.0';
  static const String tracks = '/tracks/';

  static const String clientId = String.fromEnvironment('JAMENDO_CLIENT_ID');
  static const String responseFormat = 'json';
  static const String audioFormat = 'mp32';

  static String get tracksUrl => '$baseUrl$tracks';
}
