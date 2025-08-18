/// This configuration is used to customize the webview that is used to
/// authenticate the user.
///
/// See more details here:
/// https://learn.microsoft.com/en-us/entra/msal/objc/customize-webviews
///
/// This configuration is only supported on iOS/MacOS platforms when broker is
/// webView.
final class CustomWebViewConfig {
  /// Title of the webview.
  final String? title;

  /// Title of the cancel button. default value is "Cancel".
  final String cancelButtonTitle;

  /// Show navigation controls. default value is "false".
  final bool showNavigationControls;

  const CustomWebViewConfig({
    this.title,
    this.cancelButtonTitle = 'Cancel',
    this.showNavigationControls = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'cancelButtonTitle': cancelButtonTitle,
      'showNavigationControls': showNavigationControls,
    };
  }
}
