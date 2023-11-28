import AppIntents

struct PermissionStatus: AppIntent {
  static var title: LocalizedStringResource = "Permission Status"
  
  func perform() async throws -> some IntentResult & ReturnsValue<String> {
    .result(value: checkAccessibilityPermissions())
  }
}
