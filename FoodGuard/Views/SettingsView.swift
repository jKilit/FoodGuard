import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Appearance")) {
                Toggle("Dark Mode", isOn: $isDarkModeEnabled)
            }

            Section(header: Text("Other Settings")) {
                // Add more settings here
                NavigationLink(destination: Text("Additional Settings")) {
                    Text("Additional Settings")
                }
            }

            Section {
                Button(action: resetSettings) {
                    Text("Reset Settings")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationBarTitle("Settings")
    }

    private func resetSettings() {
        // Implement logic to reset settings
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

