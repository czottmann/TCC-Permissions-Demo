import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "person.2")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text(checkAccessibilityPermissions())
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
