import SwiftUI

struct settingView: View {
    var body: some View {
        NavigationView{
            Text("v1.0.0")
                .padding()
                .navigationTitle("Settings")
        }
        .navigationViewStyle(.stack)

    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        settingView()
    }
}

