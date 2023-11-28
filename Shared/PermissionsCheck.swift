import ApplicationServices

func checkAccessibilityPermissions() -> String {
  let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true]
  let isAccessibilityEnabled = AXIsProcessTrustedWithOptions(options as CFDictionary)
  return isAccessibilityEnabled
    ? "`kTCCServiceAccessibility` granted: yes"
    : "`kTCCServiceAccessibility` granted: no"
}
