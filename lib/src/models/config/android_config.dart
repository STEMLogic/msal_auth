/// Configuration class for Android platform.
class AndroidConfig {
  /// Asset path of JSON configuration file.
  final String configFilePath;

  /// Redirect URI of android application. available in authentication settings
  /// in Azure portal.
  final String redirectUri;

  /// Tenant ID of the application.
  final String? tenantId;

  AndroidConfig({
    required this.configFilePath,
    required this.redirectUri,
    this.tenantId,
  });
}
