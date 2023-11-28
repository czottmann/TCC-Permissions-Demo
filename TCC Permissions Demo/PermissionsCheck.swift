import ApplicationServices
import Foundation

func checkAccessibilityPermissions() -> Bool {
  let options = [kAXTrustedCheckOptionPrompt.takeUnretainedValue() as String: true]
  let isAccessibilityEnabled = AXIsProcessTrustedWithOptions(options as CFDictionary)
  return isAccessibilityEnabled
}
