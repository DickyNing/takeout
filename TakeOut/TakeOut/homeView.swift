import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            Text("Menu")
                .navigationTitle("Menu")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}