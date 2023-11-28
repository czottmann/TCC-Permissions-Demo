import AppIntents

struct PermissionStatus: AppIntent {
  static var title: LocalizedStringResource = "PermissionStatus"
  static var description: IntentDescription?

  func perform() async throws -> some IntentResult & ReturnsValue<String> {
    .result(value: "`kTCCServiceAccessibility` granted: \(String(describing: checkAccessibilityPermissions()))")
  }
}
