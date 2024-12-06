import SwiftUI

struct menuView: View {
    var body: some View {
        NavigationView{
            Text("show the menu of your dining halls")
                .padding()
                .navigationTitle("Menu")
        }
        .navigationViewStyle(.stack)
    }
}
struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
    }
}
